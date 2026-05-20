import '../../domain/entities/authenticated_user.dart';

class AuthUserModel {
  final String localId;
  final String email;
  final String? idToken;

  AuthUserModel({
    required this.localId,
    required this.email,
    this.idToken,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      localId: json['localId'] ?? '',
      email: json['email'] ?? '',
      idToken: json['idToken'],
    );
  }

  AuthenticatedUser toEntity() {
    return AuthenticatedUser(
      id: localId,
      email: email,
      token: idToken,
    );
  }
}
