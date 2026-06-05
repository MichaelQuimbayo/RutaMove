import 'package:isar/isar.dart';
import '../../domain/entities/user.dart';
import 'driver_profile_model.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id? isarId; 

  @Index(unique: true, replace: true)
  late String id; // UID de Firebase

  late String name;
  late String email;
  late String phone;
  late String activeRole;
  
  late bool isPassengerRole;
  late bool isDriverRole;

  DriverProfileModel? driverProfile;
  late DateTime createdAt;


  static UserModel fromEntity(UserEntity entity) {
    return UserModel()
      ..id = entity.id
      ..name = entity.name
      ..email = entity.email
      ..phone = entity.phone
      ..activeRole = entity.activeRole
      ..isPassengerRole = entity.roles['passenger'] ?? false
      ..isDriverRole = entity.roles['driver'] ?? false
      ..driverProfile = entity.driverProfile != null 
          ? DriverProfileModel.fromEntity(entity.driverProfile!) 
          : null
      ..createdAt = entity.createdAt;
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      activeRole: activeRole,
      roles: {
        'passenger': isPassengerRole,
        'driver': isDriverRole,
      },
      driverProfile: driverProfile?.toEntity(),
      createdAt: createdAt,
      // Cargamos las direcciones desde los links de Isar
    );
  }
}
