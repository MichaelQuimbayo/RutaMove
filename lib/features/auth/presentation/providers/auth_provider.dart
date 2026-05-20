import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../domain/entities/authenticated_user.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  AsyncValue<AuthenticatedUser?> build() => const AsyncValue.data(null);

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    // Inyección manual por ahora (luego se puede mejorar con providers específicos)
    final repository = AuthRepositoryImpl(FirebaseAuthService());

    try {
      final user = await repository.login(email, password);
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}