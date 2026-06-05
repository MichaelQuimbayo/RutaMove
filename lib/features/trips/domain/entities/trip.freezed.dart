// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripEntity _$TripEntityFromJson(Map<String, dynamic> json) {
  return _TripEntity.fromJson(json);
}

/// @nodoc
mixin _$TripEntity {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_time')
  DateTime get departureTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_seats')
  int get totalSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_seats')
  int get availableSeats => throw _privateConstructorUsedError;
  TripStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripEntityCopyWith<TripEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripEntityCopyWith<$Res> {
  factory $TripEntityCopyWith(
          TripEntity value, $Res Function(TripEntity) then) =
      _$TripEntityCopyWithImpl<$Res, TripEntity>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driver_id') String driverId,
      String origin,
      String destination,
      @JsonKey(name: 'departure_time') DateTime departureTime,
      @JsonKey(name: 'total_seats') int totalSeats,
      @JsonKey(name: 'available_seats') int availableSeats,
      TripStatus status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$TripEntityCopyWithImpl<$Res, $Val extends TripEntity>
    implements $TripEntityCopyWith<$Res> {
  _$TripEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? origin = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? totalSeats = null,
    Object? availableSeats = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
      availableSeats: null == availableSeats
          ? _value.availableSeats
          : availableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripEntityImplCopyWith<$Res>
    implements $TripEntityCopyWith<$Res> {
  factory _$$TripEntityImplCopyWith(
          _$TripEntityImpl value, $Res Function(_$TripEntityImpl) then) =
      __$$TripEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driver_id') String driverId,
      String origin,
      String destination,
      @JsonKey(name: 'departure_time') DateTime departureTime,
      @JsonKey(name: 'total_seats') int totalSeats,
      @JsonKey(name: 'available_seats') int availableSeats,
      TripStatus status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$TripEntityImplCopyWithImpl<$Res>
    extends _$TripEntityCopyWithImpl<$Res, _$TripEntityImpl>
    implements _$$TripEntityImplCopyWith<$Res> {
  __$$TripEntityImplCopyWithImpl(
      _$TripEntityImpl _value, $Res Function(_$TripEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? origin = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? totalSeats = null,
    Object? availableSeats = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$TripEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
      availableSeats: null == availableSeats
          ? _value.availableSeats
          : availableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripEntityImpl implements _TripEntity {
  const _$TripEntityImpl(
      {required this.id,
      @JsonKey(name: 'driver_id') required this.driverId,
      required this.origin,
      required this.destination,
      @JsonKey(name: 'departure_time') required this.departureTime,
      @JsonKey(name: 'total_seats') required this.totalSeats,
      @JsonKey(name: 'available_seats') required this.availableSeats,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$TripEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripEntityImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'driver_id')
  final String driverId;
  @override
  final String origin;
  @override
  final String destination;
  @override
  @JsonKey(name: 'departure_time')
  final DateTime departureTime;
  @override
  @JsonKey(name: 'total_seats')
  final int totalSeats;
  @override
  @JsonKey(name: 'available_seats')
  final int availableSeats;
  @override
  final TripStatus status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'TripEntity(id: $id, driverId: $driverId, origin: $origin, destination: $destination, departureTime: $departureTime, totalSeats: $totalSeats, availableSeats: $availableSeats, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.totalSeats, totalSeats) ||
                other.totalSeats == totalSeats) &&
            (identical(other.availableSeats, availableSeats) ||
                other.availableSeats == availableSeats) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      driverId,
      origin,
      destination,
      departureTime,
      totalSeats,
      availableSeats,
      status,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripEntityImplCopyWith<_$TripEntityImpl> get copyWith =>
      __$$TripEntityImplCopyWithImpl<_$TripEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripEntityImplToJson(
      this,
    );
  }
}

abstract class _TripEntity implements TripEntity {
  const factory _TripEntity(
      {required final String id,
      @JsonKey(name: 'driver_id') required final String driverId,
      required final String origin,
      required final String destination,
      @JsonKey(name: 'departure_time') required final DateTime departureTime,
      @JsonKey(name: 'total_seats') required final int totalSeats,
      @JsonKey(name: 'available_seats') required final int availableSeats,
      required final TripStatus status,
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$TripEntityImpl;

  factory _TripEntity.fromJson(Map<String, dynamic> json) =
      _$TripEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'driver_id')
  String get driverId;
  @override
  String get origin;
  @override
  String get destination;
  @override
  @JsonKey(name: 'departure_time')
  DateTime get departureTime;
  @override
  @JsonKey(name: 'total_seats')
  int get totalSeats;
  @override
  @JsonKey(name: 'available_seats')
  int get availableSeats;
  @override
  TripStatus get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TripEntityImplCopyWith<_$TripEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
