// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationEntityImpl _$$ReservationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationEntityImpl(
      id: json['id'] as String,
      tripId: json['trip_id'] as String,
      passengerId: json['passenger_id'] as String,
      seatsReserved: (json['seats_reserved'] as num).toInt(),
      status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReservationEntityImplToJson(
        _$ReservationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'passenger_id': instance.passengerId,
      'seats_reserved': instance.seatsReserved,
      'status': _$ReservationStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.reserved: 'reserved',
  ReservationStatus.confirmed: 'confirmed',
  ReservationStatus.cancelled: 'cancelled',
};
