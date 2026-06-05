import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

enum ReservationStatus { reserved, confirmed, cancelled }

@freezed
class ReservationEntity with _$ReservationEntity {
  const factory ReservationEntity({
    required String id,
    @JsonKey(name: 'trip_id') required String tripId,
    @JsonKey(name: 'passenger_id') required String passengerId,
    @JsonKey(name: 'seats_reserved') required int seatsReserved,
    required ReservationStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ReservationEntity;

  factory ReservationEntity.fromJson(Map<String, dynamic> json) => _$ReservationEntityFromJson(json);
}
