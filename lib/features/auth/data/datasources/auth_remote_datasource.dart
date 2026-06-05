
import 'package:RutaMove/features/auth/domain/entities/authenticated_user.dart';


abstract class AuthRemoteDatasource {
  Future<UserEntity> signUp({
    required String email,
    required String password,
  });

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });
}

