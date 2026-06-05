import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart'; // <--- Cambiado de user_entity.dart a user.dart

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers({String? query});
  Future<Either<Failure, UserEntity?>> getUserById(int id);
  Future<Either<Failure, int>> saveUser(UserEntity user);
  Future<Either<Failure, void>> deleteUser(int id);
}
