// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.driver: 'driver',
  UserRole.passenger: 'passenger',
};
