import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:RutaMove/app.dart';
import 'firebase_options.dart'; // Asegúrate de que este archivo existe

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicialización correcta con await
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}
