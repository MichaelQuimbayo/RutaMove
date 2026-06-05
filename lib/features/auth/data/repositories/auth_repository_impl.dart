import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/authenticated_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../services/firestore_user_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  // ignore: unused_field
  final FirestoreUserService _firestoreService;

  // Inyectamos FirebaseAuth para poder mockearlo en los tests
  AuthRepositoryImpl(this._firestoreService, {FirebaseAuth? firebaseAuth}) 
    : _auth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;

      return UserEntity(
        uid: uid,
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Error en el registro');
    }
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final uid = credential.user!.uid;
      
      return UserEntity(
        uid: uid,
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Error al iniciar sesión');
    }
  }
}
