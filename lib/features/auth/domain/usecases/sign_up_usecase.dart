import '../entities/authenticated_user.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  /// Ejecuta el Paso 1 del registro: Creación de cuenta en Firebase Auth.
  /// Retorna la entidad con el UID para proceder al guardado de datos en Firestore.
  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    // Aquí podrías añadir validaciones de dominio si fueran necesarias
    // antes de llamar al repositorio.

    return await _repository.signUp(
      email: email,
      password: password,
    );
  }
}