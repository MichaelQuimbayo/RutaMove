import '../../domain/entities/authenticated_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) {
    return datasource.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) {
    return datasource.signIn(
      email: email,
      password: password,
    );
  }
}
