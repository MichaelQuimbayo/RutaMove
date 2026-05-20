import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole { driver, passenger }

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String phone,
    required UserRole role,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
