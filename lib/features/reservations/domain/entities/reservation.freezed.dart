// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReservationEntity _$ReservationEntityFromJson(Map<String, dynamic> json) {
  return _ReservationEntity.fromJson(json);
}

/// @nodoc
mixin _$ReservationEntity {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'trip_id')
  String get tripId => throw _privateConstructorUsedError;
  @JsonKey(name: 'passenger_id')
  String get passengerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'seats_reserved')
  int get seatsReserved => throw _privateConstructorUsedError;
  ReservationStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationEntityCopyWith<ReservationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationEntityCopyWith<$Res> {
  factory $ReservationEntityCopyWith(
          ReservationEntity value, $Res Function(ReservationEntity) then) =
      _$ReservationEntityCopyWithImpl<$Res, ReservationEntity>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'trip_id') String tripId,
      @JsonKey(name: 'passenger_id') String passengerId,
      @JsonKey(name: 'seats_reserved') int seatsReserved,
      ReservationStatus status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$ReservationEntityCopyWithImpl<$Res, $Val extends ReservationEntity>
    implements $ReservationEntityCopyWith<$Res> {
  _$ReservationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tripId = null,
    Object? passengerId = null,
    Object? seatsReserved = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      passengerId: null == passengerId
          ? _value.passengerId
          : passengerId // ignore: cast_nullable_to_non_nullable
              as String,
      seatsReserved: null == seatsReserved
          ? _value.seatsReserved
          : seatsReserved // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationEntityImplCopyWith<$Res>
    implements $ReservationEntityCopyWith<$Res> {
  factory _$$ReservationEntityImplCopyWith(_$ReservationEntityImpl value,
          $Res Function(_$ReservationEntityImpl) then) =
      __$$ReservationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'trip_id') String tripId,
      @JsonKey(name: 'passenger_id') String passengerId,
      @JsonKey(name: 'seats_reserved') int seatsReserved,
      ReservationStatus status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$ReservationEntityImplCopyWithImpl<$Res>
    extends _$ReservationEntityCopyWithImpl<$Res, _$ReservationEntityImpl>
    implements _$$ReservationEntityImplCopyWith<$Res> {
  __$$ReservationEntityImplCopyWithImpl(_$ReservationEntityImpl _value,
      $Res Function(_$ReservationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tripId = null,
    Object? passengerId = null,
    Object? seatsReserved = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReservationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      passengerId: null == passengerId
          ? _value.passengerId
          : passengerId // ignore: cast_nullable_to_non_nullable
              as String,
      seatsReserved: null == seatsReserved
          ? _value.seatsReserved
          : seatsReserved // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationEntityImpl implements _ReservationEntity {
  const _$ReservationEntityImpl(
      {required this.id,
      @JsonKey(name: 'trip_id') required this.tripId,
      @JsonKey(name: 'passenger_id') required this.passengerId,
      @JsonKey(name: 'seats_reserved') required this.seatsReserved,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ReservationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationEntityImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'trip_id')
  final String tripId;
  @override
  @JsonKey(name: 'passenger_id')
  final String passengerId;
  @override
  @JsonKey(name: 'seats_reserved')
  final int seatsReserved;
  @override
  final ReservationStatus status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReservationEntity(id: $id, tripId: $tripId, passengerId: $passengerId, seatsReserved: $seatsReserved, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.passengerId, passengerId) ||
                other.passengerId == passengerId) &&
            (identical(other.seatsReserved, seatsReserved) ||
                other.seatsReserved == seatsReserved) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tripId, passengerId, seatsReserved, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationEntityImplCopyWith<_$ReservationEntityImpl> get copyWith =>
      __$$ReservationEntityImplCopyWithImpl<_$ReservationEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationEntityImplToJson(
      this,
    );
  }
}

abstract class _ReservationEntity implements ReservationEntity {
  const factory _ReservationEntity(
          {required final String id,
          @JsonKey(name: 'trip_id') required final String tripId,
          @JsonKey(name: 'passenger_id') required final String passengerId,
          @JsonKey(name: 'seats_reserved') required final int seatsReserved,
          required final ReservationStatus status,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$ReservationEntityImpl;

  factory _ReservationEntity.fromJson(Map<String, dynamic> json) =
      _$ReservationEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'trip_id')
  String get tripId;
  @override
  @JsonKey(name: 'passenger_id')
  String get passengerId;
  @override
  @JsonKey(name: 'seats_reserved')
  int get seatsReserved;
  @override
  ReservationStatus get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReservationEntityImplCopyWith<_$ReservationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
