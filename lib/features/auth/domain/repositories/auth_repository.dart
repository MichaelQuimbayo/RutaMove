import '../entities/authenticated_user.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp({
    required String email,
    required String password,
  });

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });
}
