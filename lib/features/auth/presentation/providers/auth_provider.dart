import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/firestore_user_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';

part 'auth_provider.g.dart';

/// --- Capa de Datos (Servicios e Infraestructura) ---

@riverpod
FirestoreUserService firestoreUserService(FirestoreUserServiceRef ref) {
  return FirestoreUserService();
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  // Inyectamos el servicio de Firestore en el Repositorio
  final firestoreService = ref.watch(firestoreUserServiceProvider);
  return AuthRepositoryImpl(firestoreService);
}

/// --- Capa de Dominio (Casos de Uso) ---

@riverpod
SignUpUseCase signUpUseCase(SignUpUseCaseRef ref) {
  return SignUpUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
SignInUseCase signInUseCase(SignInUseCaseRef ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
}

/// --- Capa de Presentación (Controladores) ---

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
      final signUpUseCase = ref.read(signUpUseCaseProvider);
      await signUpUseCase.call(
        email: email,
        password: password,
      );
    });
  }
}

@riverpod
class SignInController extends _$SignInController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // CORRECCIÓN: Usar signInUseCase en lugar de signUpUseCase
      final signInUseCase = ref.read(signInUseCaseProvider);
      await signInUseCase.call(
        email: email,
        password: password,
      );
    });
  }
}
