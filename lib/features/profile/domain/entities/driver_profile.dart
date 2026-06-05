import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_profile.freezed.dart';
part 'driver_profile.g.dart';

@freezed
class DriverProfileEntity with _$DriverProfileEntity {
  const factory DriverProfileEntity({
    required String vehicleBrand,
    required String vehicleModel,
    required String plate,
    required String vehiclePhoto,
    required int totalSeats,
  }) = _DriverProfileEntity;

  factory DriverProfileEntity.fromJson(Map<String, dynamic> json) => 
      _$DriverProfileEntityFromJson(json);
}
