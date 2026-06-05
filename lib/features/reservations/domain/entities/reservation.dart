import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

enum ReservationStatus { reserved, confirmed, cancelled }

@freezed
class ReservationEntity with _$ReservationEntity {
  const factory ReservationEntity({
    required String id,
    required String tripId,
    required String passengerId,
    required int seatsReserved,
    required ReservationStatus status,
    required DateTime createdAt,
  }) = _ReservationEntity;

  factory ReservationEntity.fromJson(Map<String, dynamic> json) => _$ReservationEntityFromJson(json);
}
