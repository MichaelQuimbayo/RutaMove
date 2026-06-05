import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:RutaMove/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Aquí puedes añadir configuración específica para PROD
  runApp(const ProviderScope(child: MyApp()));
}
