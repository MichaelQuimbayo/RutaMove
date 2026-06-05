// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverProfileEntity _$DriverProfileEntityFromJson(Map<String, dynamic> json) {
  return _DriverProfileEntity.fromJson(json);
}

/// @nodoc
mixin _$DriverProfileEntity {
  String get vehicleBrand => throw _privateConstructorUsedError;
  String get vehicleModel => throw _privateConstructorUsedError;
  String get plate => throw _privateConstructorUsedError;
  String get vehiclePhoto => throw _privateConstructorUsedError;
  int get totalSeats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverProfileEntityCopyWith<DriverProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverProfileEntityCopyWith<$Res> {
  factory $DriverProfileEntityCopyWith(
          DriverProfileEntity value, $Res Function(DriverProfileEntity) then) =
      _$DriverProfileEntityCopyWithImpl<$Res, DriverProfileEntity>;
  @useResult
  $Res call(
      {String vehicleBrand,
      String vehicleModel,
      String plate,
      String vehiclePhoto,
      int totalSeats});
}

/// @nodoc
class _$DriverProfileEntityCopyWithImpl<$Res, $Val extends DriverProfileEntity>
    implements $DriverProfileEntityCopyWith<$Res> {
  _$DriverProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleBrand = null,
    Object? vehicleModel = null,
    Object? plate = null,
    Object? vehiclePhoto = null,
    Object? totalSeats = null,
  }) {
    return _then(_value.copyWith(
      vehicleBrand: null == vehicleBrand
          ? _value.vehicleBrand
          : vehicleBrand // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String,
      plate: null == plate
          ? _value.plate
          : plate // ignore: cast_nullable_to_non_nullable
              as String,
      vehiclePhoto: null == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverProfileEntityImplCopyWith<$Res>
    implements $DriverProfileEntityCopyWith<$Res> {
  factory _$$DriverProfileEntityImplCopyWith(_$DriverProfileEntityImpl value,
          $Res Function(_$DriverProfileEntityImpl) then) =
      __$$DriverProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vehicleBrand,
      String vehicleModel,
      String plate,
      String vehiclePhoto,
      int totalSeats});
}

/// @nodoc
class __$$DriverProfileEntityImplCopyWithImpl<$Res>
    extends _$DriverProfileEntityCopyWithImpl<$Res, _$DriverProfileEntityImpl>
    implements _$$DriverProfileEntityImplCopyWith<$Res> {
  __$$DriverProfileEntityImplCopyWithImpl(_$DriverProfileEntityImpl _value,
      $Res Function(_$DriverProfileEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleBrand = null,
    Object? vehicleModel = null,
    Object? plate = null,
    Object? vehiclePhoto = null,
    Object? totalSeats = null,
  }) {
    return _then(_$DriverProfileEntityImpl(
      vehicleBrand: null == vehicleBrand
          ? _value.vehicleBrand
          : vehicleBrand // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String,
      plate: null == plate
          ? _value.plate
          : plate // ignore: cast_nullable_to_non_nullable
              as String,
      vehiclePhoto: null == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverProfileEntityImpl implements _DriverProfileEntity {
  const _$DriverProfileEntityImpl(
      {required this.vehicleBrand,
      required this.vehicleModel,
      required this.plate,
      required this.vehiclePhoto,
      required this.totalSeats});

  factory _$DriverProfileEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverProfileEntityImplFromJson(json);

  @override
  final String vehicleBrand;
  @override
  final String vehicleModel;
  @override
  final String plate;
  @override
  final String vehiclePhoto;
  @override
  final int totalSeats;

  @override
  String toString() {
    return 'DriverProfileEntity(vehicleBrand: $vehicleBrand, vehicleModel: $vehicleModel, plate: $plate, vehiclePhoto: $vehiclePhoto, totalSeats: $totalSeats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverProfileEntityImpl &&
            (identical(other.vehicleBrand, vehicleBrand) ||
                other.vehicleBrand == vehicleBrand) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.plate, plate) || other.plate == plate) &&
            (identical(other.vehiclePhoto, vehiclePhoto) ||
                other.vehiclePhoto == vehiclePhoto) &&
            (identical(other.totalSeats, totalSeats) ||
                other.totalSeats == totalSeats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, vehicleBrand, vehicleModel, plate, vehiclePhoto, totalSeats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverProfileEntityImplCopyWith<_$DriverProfileEntityImpl> get copyWith =>
      __$$DriverProfileEntityImplCopyWithImpl<_$DriverProfileEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverProfileEntityImplToJson(
      this,
    );
  }
}

abstract class _DriverProfileEntity implements DriverProfileEntity {
  const factory _DriverProfileEntity(
      {required final String vehicleBrand,
      required final String vehicleModel,
      required final String plate,
      required final String vehiclePhoto,
      required final int totalSeats}) = _$DriverProfileEntityImpl;

  factory _DriverProfileEntity.fromJson(Map<String, dynamic> json) =
      _$DriverProfileEntityImpl.fromJson;

  @override
  String get vehicleBrand;
  @override
  String get vehicleModel;
  @override
  String get plate;
  @override
  String get vehiclePhoto;
  @override
  int get totalSeats;
  @override
  @JsonKey(ignore: true)
  _$$DriverProfileEntityImplCopyWith<_$DriverProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
