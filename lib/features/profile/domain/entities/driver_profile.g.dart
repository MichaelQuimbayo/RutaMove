// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverProfileEntityImpl _$$DriverProfileEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverProfileEntityImpl(
      vehicleBrand: json['vehicleBrand'] as String,
      vehicleModel: json['vehicleModel'] as String,
      plate: json['plate'] as String,
      vehiclePhoto: json['vehiclePhoto'] as String,
      totalSeats: (json['totalSeats'] as num).toInt(),
    );

Map<String, dynamic> _$$DriverProfileEntityImplToJson(
        _$DriverProfileEntityImpl instance) =>
    <String, dynamic>{
      'vehicleBrand': instance.vehicleBrand,
      'vehicleModel': instance.vehicleModel,
      'plate': instance.plate,
      'vehiclePhoto': instance.vehiclePhoto,
      'totalSeats': instance.totalSeats,
    };
