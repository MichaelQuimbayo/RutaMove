import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

enum TripStatus { active, full, finished }

@freezed
class TripEntity with _$TripEntity {
  const factory TripEntity({
    required String id,
    @JsonKey(name: 'driver_id') required String driverId,
    required String origin,
    required String destination,
    @JsonKey(name: 'departure_time') required DateTime departureTime,
    @JsonKey(name: 'total_seats') required int totalSeats,
    @JsonKey(name: 'available_seats') required int availableSeats,
    required TripStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _TripEntity;

  factory TripEntity.fromJson(Map<String, dynamic> json) => _$TripEntityFromJson(json);
}
