// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      activeRole: json['active_role'] as String,
      roles: Map<String, bool>.from(json['roles'] as Map),
      driverProfile: json['driver_profile'] == null
          ? null
          : DriverProfileEntity.fromJson(
              json['driver_profile'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'active_role': instance.activeRole,
      'roles': instance.roles,
      'driver_profile': instance.driverProfile,
      'created_at': instance.createdAt.toIso8601String(),
    };
