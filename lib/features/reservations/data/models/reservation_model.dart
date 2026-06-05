import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/reservation.dart';

class ReservationModel {
  final String id;
  final String tripId;
  final String passengerId;
  final int seatsReserved;
  final String status;
  final DateTime createdAt;

  ReservationModel({
    required this.id,
    required this.tripId,
    required this.passengerId,
    required this.seatsReserved,
    required this.status,
    required this.createdAt,
  });

  factory ReservationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReservationModel(
      id: doc.id,
      tripId: data['trip_id'] ?? '',
      passengerId: data['passenger_id'] ?? '',
      seatsReserved: data['seats_reserved'] ?? 0,
      status: data['status'] ?? 'reserved',
      createdAt: (data['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'trip_id': tripId,
      'passenger_id': passengerId,
      'seats_reserved': seatsReserved,
      'status': status,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }

  ReservationEntity toEntity() {
    return ReservationEntity(
      id: id,
      tripId: tripId,
      passengerId: passengerId,
      seatsReserved: seatsReserved,
      status: _parseStatus(status),
      createdAt: createdAt,
    );
  }

  static ReservationStatus _parseStatus(String status) {
    return ReservationStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => ReservationStatus.reserved,
    );
  }
}
