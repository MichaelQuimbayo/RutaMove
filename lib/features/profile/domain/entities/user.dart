import 'package:freezed_annotation/freezed_annotation.dart';
import 'driver_profile.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'active_role') required String activeRole,
    required Map<String, bool> roles,
    @JsonKey(name: 'driver_profile') DriverProfileEntity? driverProfile,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserEntity;

  const UserEntity._();
  
  bool get isDriver => roles['driver'] ?? false;
  bool get isPassenger => roles['passenger'] ?? false;
  bool get needsDriverOnboarding => activeRole == 'driver' && driverProfile == null;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
