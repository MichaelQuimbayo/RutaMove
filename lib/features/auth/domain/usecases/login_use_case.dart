import '../entities/authenticated_user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<AuthenticatedUser?> execute(String email, String password) {
    return _repository.login(email, password);
  }
}