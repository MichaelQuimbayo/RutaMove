import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/sign_up_usecase.dart';

class SignUpController extends StateNotifier<AsyncValue<void>> {
  final SignUpUseCase signUpUseCase;

  SignUpController(this.signUpUseCase)
      : super(const AsyncData(null));

  Future<void> signUp({
    required String email,
    required String password,
  }) async {

    state = const AsyncLoading();

    try {

      await signUpUseCase(
        email: email,
        password: password,
      );

      state = const AsyncData(null);

    } catch (e, st) {

      state = AsyncError(e, st);
    }
  }
}