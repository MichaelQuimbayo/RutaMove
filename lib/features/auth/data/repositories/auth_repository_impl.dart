import '../../domain/entities/authenticated_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_user_model.dart';
import '../services/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _service;

  AuthRepositoryImpl(this._service);

  @override
  Future<AuthenticatedUser?> login(String email, String password) async {
    final data = await _service.signIn(email, password);
    if (data != null && data.containsKey('idToken')) {
      return AuthenticatedUser(
        id: data['localId'],
        email: data['email'],
        token: data['idToken'],
      );
    }
    return null;
  }

  @override
  Future<String?> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AuthenticatedUser?> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

// Implementar register, logout, etc.
}