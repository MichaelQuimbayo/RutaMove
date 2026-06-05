import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/trip.dart';

class TripModel {
  final String id;
  final String driverId;
  final String origin;
  final String destination;
  final DateTime departureTime;
  final int totalSeats;
  final int availableSeats;
  final String status;
  final DateTime createdAt;

  TripModel({
    required this.id,
    required this.driverId,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.totalSeats,
    required this.availableSeats,
    required this.status,
    required this.createdAt,
  });

  factory TripModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TripModel(
      id: doc.id,
      driverId: data['driver_id'] ?? '',
      origin: data['origin'] ?? '',
      destination: data['destination'] ?? '',
      departureTime: (data['departure_time'] as Timestamp).toDate(),
      totalSeats: data['total_seats'] ?? 0,
      availableSeats: data['available_seats'] ?? 0,
      status: data['status'] ?? 'active',
      createdAt: (data['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'driver_id': driverId,
      'origin': origin,
      'destination': destination,
      'departure_time': Timestamp.fromDate(departureTime),
      'total_seats': totalSeats,
      'available_seats': availableSeats,
      'status': status,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }

  TripEntity toEntity() {
    return TripEntity(
      id: id,
      driverId: driverId,
      origin: origin,
      destination: destination,
      departureTime: departureTime,
      totalSeats: totalSeats,
      availableSeats: availableSeats,
      status: _parseStatus(status),
      createdAt: createdAt,
    );
  }

  static TripStatus _parseStatus(String status) {
    return TripStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => TripStatus.active,
    );
  }
}
