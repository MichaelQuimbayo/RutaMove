// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreUserServiceHash() =>
    r'f8be7ad9bf35cb3c3f700f1f685efce13d739f83';

/// --- Capa de Datos (Servicios) ---
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

/// --- Capa de Datos (Repositorios) ---
///
/// Copied from [authRepository].
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

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
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

typedef SignUpUseCaseRef = AutoDisposeProviderRef<SignUpUseCase>;
String _$signUpControllerHash() => r'f384267d8ec8c804954fa1ac3db358b0aa4959c3';

/// --- Capa de Presentación (Controlador/Estado) ---
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
