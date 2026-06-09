// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreUserServiceHash() =>
    r'9119cc2fdfb18148df47a9183802e2f7a2f92ab8';

/// --- Capa de Datos (Servicios e Infraestructura) ---
///
/// Copied from [firestoreUserService].
@ProviderFor(firestoreUserService)
final firestoreUserServiceProvider =
    AutoDisposeProvider<FirestoreUserService>.internal(
  firestoreUserService,
  name: r'firestoreUserServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreUserServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreUserServiceRef = AutoDisposeProviderRef<FirestoreUserService>;
String _$authRepositoryHash() => r'ef1459d952a663f89e22571138596bb6043a5bd5';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = Ref<AuthRepository>;
String _$signUpUseCaseHash() => r'4201daf5f96493848da629b32fddadef84544cd7';

/// --- Capa de Dominio (Casos de Uso) ---
///
/// Copied from [signUpUseCase].
@ProviderFor(signUpUseCase)
final signUpUseCaseProvider = AutoDisposeProvider<SignUpUseCase>.internal(
  signUpUseCase,
  name: r'signUpUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignUpUseCaseRef = Ref<SignUpUseCase>;
String _$signInUseCaseHash() => r'd8c4ca8799d3c785d724fcb12259fb8cb5c6f7aa';

/// See also [signInUseCase].
@ProviderFor(signInUseCase)
final signInUseCaseProvider = AutoDisposeProvider<SignInUseCase>.internal(
  signInUseCase,
  name: r'signInUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInUseCaseRef = Ref<SignInUseCase>;
String _$signUpControllerHash() => r'04cd2d82cfe738a40bbac77d642e2ebf947bf6f6';

/// --- Capa de Presentación (Controladores) ---
///
/// Copied from [SignUpController].
@ProviderFor(SignUpController)
final signUpControllerProvider =
    AutoDisposeNotifierProvider<SignUpController, AsyncValue<void>>.internal(
  SignUpController.new,
  name: r'signUpControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpController = AutoDisposeNotifier<AsyncValue<void>>;
String _$signInControllerHash() => r'0e9cdaa339d668a422fbd82e98df5a2e8315e554';

/// See also [SignInController].
@ProviderFor(SignInController)
final signInControllerProvider =
    AutoDisposeNotifierProvider<SignInController, AsyncValue<void>>.internal(
  SignInController.new,
  name: r'signInControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInController = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
