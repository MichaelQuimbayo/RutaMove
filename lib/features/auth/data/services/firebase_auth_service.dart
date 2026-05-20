import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FirebaseAuthService {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCpnX3yU_p5IIIfSLqHGgBzeUuBi307WII';
  final _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode({
      'email': email, 'password': password, 'returnSecureToken': true
    }));
    return json.decode(resp.body);
  }

// Métodos para signUp, logout y readToken siguiendo el mismo patrón...
}