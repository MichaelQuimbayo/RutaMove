// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripEntityImpl _$$TripEntityImplFromJson(Map<String, dynamic> json) =>
    _$TripEntityImpl(
      id: json['id'] as String,
      driverId: json['driver_id'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departureTime: DateTime.parse(json['departure_time'] as String),
      totalSeats: (json['total_seats'] as num).toInt(),
      availableSeats: (json['available_seats'] as num).toInt(),
      status: $enumDecode(_$TripStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$TripEntityImplToJson(_$TripEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'origin': instance.origin,
      'destination': instance.destination,
      'departure_time': instance.departureTime.toIso8601String(),
      'total_seats': instance.totalSeats,
      'available_seats': instance.availableSeats,
      'status': _$TripStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$TripStatusEnumMap = {
  TripStatus.active: 'active',
  TripStatus.full: 'full',
  TripStatus.finished: 'finished',
};
