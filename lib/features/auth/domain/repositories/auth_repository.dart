import '../entities/authenticated_user.dart';

abstract class AuthRepository {
  Future<AuthenticatedUser?> login(String email, String password);
  Future<AuthenticatedUser?> register(String email, String password);
  Future<void> logout();
  Future<String?> getToken();
}