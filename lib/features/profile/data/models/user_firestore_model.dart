import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/driver_profile.dart';

class UserFirestoreModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String activeRole;
  final Map<String, bool> roles;
  final DriverProfileEntity? driverProfile;
  final DateTime createdAt;

  UserFirestoreModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.activeRole,
    required this.roles,
    this.driverProfile,
    required this.createdAt,
  });

  factory UserFirestoreModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserFirestoreModel(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      activeRole: data['active_role'] ?? 'passenger',
      roles: Map<String, bool>.from(data['roles'] ?? {'passenger': true, 'driver': false}),
      driverProfile: data['driver_profile'] != null 
          ? DriverProfileEntity.fromJson(Map<String, dynamic>.from(data['driver_profile']))
          : null,
      createdAt: (data['created_at'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'active_role': activeRole,
      'roles': roles,
      'driver_profile': driverProfile?.toJson(),
      'created_at': FieldValue.serverTimestamp(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      activeRole: activeRole,
      roles: roles,
      driverProfile: driverProfile,
      createdAt: createdAt,
    );
  }
}
