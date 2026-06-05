import 'package:isar/isar.dart';
import '../../domain/entities/driver_profile.dart';

part 'driver_profile_model.g.dart';

@embedded
class DriverProfileModel {
  late String vehicleBrand;
  late String vehicleModel;
  late String plate;
  late String vehiclePhoto;
  late int totalSeats;

  // Mapper de Entidad a Modelo
  static DriverProfileModel fromEntity(DriverProfileEntity entity) {
    return DriverProfileModel()
      ..vehicleBrand = entity.vehicleBrand
      ..vehicleModel = entity.vehicleModel
      ..plate = entity.plate
      ..vehiclePhoto = entity.vehiclePhoto
      ..totalSeats = entity.totalSeats;
  }

  // Mapper de Modelo a Entidad
  DriverProfileEntity toEntity() {
    return DriverProfileEntity(
      vehicleBrand: vehicleBrand,
      vehicleModel: vehicleModel,
      plate: plate,
      vehiclePhoto: vehiclePhoto,
      totalSeats: totalSeats,
    );
  }
}
