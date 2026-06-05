import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart'; // Importamos la entidad correcta (Freezed)
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

/// Implementación del repositorio de usuarios utilizando Isar Database.
/// Se ha simplificado para persistir únicamente los datos básicos del perfil,
/// eliminando la persistencia de direcciones que son transitorias.
class IsarUserRepositoryImpl implements UserRepository {
  final Isar isar;

  IsarUserRepositoryImpl(this.isar);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers({String? query}) async {
    try {
      final List<UserModel> models;
      if (query != null && query.isNotEmpty) {
        models = await isar.userModels
            .filter()
            .nameContains(query, caseSensitive: false)
            .findAll();
      } else {
        models = await isar.userModels.where().findAll();
      }
      
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Error al obtener usuarios locales: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById(int id) async {
    try {
      final model = await isar.userModels.get(id);
      if (model == null) return const Right(null);
      return Right(model.toEntity());
    } catch (e) {
      return Left(DatabaseFailure('Error al obtener usuario local: $e'));
    }
  }

  @override
  Future<Either<Failure, int>> saveUser(UserEntity user) async {
    try {
      return await isar.writeTxn(() async {
        final userModel = UserModel.fromEntity(user);
        
        // Sincronización simple por UID de Firebase (id String)
        final existing = await isar.userModels.filter().idEqualTo(user.id).findFirst();
        
        if (existing != null) {
          userModel.isarId = existing.isarId; // Mantener ID interno de Isar para actualizar
        }

        final isarId = await isar.userModels.put(userModel);
        return Right(isarId);
      });
    } catch (e) {
      return Left(DatabaseFailure('Error al guardar usuario local: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.userModels.delete(id);
      });
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Error al eliminar usuario local: $e'));
    }
  }
}
