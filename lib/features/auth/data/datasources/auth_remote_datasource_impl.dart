import 'package:RutaMove/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:RutaMove/features/auth/domain/entities/authenticated_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDatasourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {

    final credential = await firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    final userModel = UserEntity(
      uid: uid,
      email: email,
      password: password,
    );

    await firestore
        .collection('users')
        .doc(uid)
        .set({
      'uid': uid,
      'email': email,
      'active_role': 'passenger',
      'roles': {
        'passenger': true,
        'driver': false,
      },
      'created_at': Timestamp.now(),
    });

    return userModel;
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password
  }) async {
    final credential = await firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;
    final userModel = UserEntity(
      uid: uid,
      email: email,
      password: password,
    );
    return userModel;
  }

}