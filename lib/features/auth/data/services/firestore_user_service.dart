import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserService {
  final FirebaseFirestore _firestore;

  FirestoreUserService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Crea o actualiza el documento del usuario en Firestore siguiendo el esquema del proyecto.
  Future<void> saveUser({
    required String uid,
    required String name,
    required String phone,
    required String role,
    String? email,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'phone': phone,
      'active_role': role,
      'roles': {
        'passenger': role == 'passenger',
        'driver': role == 'driver',
      },
      'created_at': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
