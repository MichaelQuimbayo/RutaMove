import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/providers/firebase_providers.dart';
import '../data/services/firestore_user_service.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/sign_up_usecase.dart';

part 'auth_provider.g.dart';

/// --- Capa de Datos (Servicios) ---

@riverpod
FirestoreUserService firestoreUserService(FirestoreUserServiceRef ref) {
  // Inyectamos la instancia de Firestore desde el provider compartido
  return FirestoreUserService(firestore: ref.watch(firestoreProvider));
}

/// --- Capa de Datos (Repositorios) ---

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  // CORRECCIÓN: Inyectamos el FirestoreUserService que requiere el constructor
  final firestoreService = ref.watch(firestoreUserServiceProvider);
  return AuthRepositoryImpl(firestoreService);
}

/// --- Capa de Dominio (Casos de Uso) ---

@riverpod
SignUpUseCase signUpUseCase(SignUpUseCaseRef ref) {
  return SignUpUseCase(
    ref.watch(authRepositoryProvider),
  );
}

/// --- Capa de Presentación (Controlador/Estado) ---

@riverpod
class SignUpController extends _$SignUpController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // Usamos el caso de uso inyectado
      final useCase = ref.read(signUpUseCaseProvider);
      await useCase.call(
        email: email,
        password: password,
      );
    });
  }
}