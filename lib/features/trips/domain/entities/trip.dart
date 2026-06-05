import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

enum TripStatus { active, full, finished }

@freezed
class TripEntity with _$TripEntity {
  const factory TripEntity({
    required String id,
    required String driverId,
    required String origin,
    required String destination,
    required DateTime departureTime,
    required int totalSeats,
    required int availableSeats,
    required TripStatus status,
    required DateTime createdAt,
  }) = _TripEntity;

  factory TripEntity.fromJson(Map<String, dynamic> json) => _$TripEntityFromJson(json);
}
