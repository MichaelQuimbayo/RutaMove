import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider que maneja el modo de tema (Light/Dark) para toda la aplicación
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
