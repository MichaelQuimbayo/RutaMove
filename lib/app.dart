import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_user/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_user/presentation/screens/welcome_screen.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'data/models/address_model.dart';
import 'data/models/user_model.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/user_list_screen.dart';
import 'presentation/providers/theme_provider.dart';

// Provider for Isar instance
final isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  
  if (Isar.instanceNames.isEmpty) {
    return await Isar.open(
      [UserModelSchema, AddressModelSchema],
      directory: dir.path,
      inspector: true,
    );
  }
  return Isar.getInstance()!;
});

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    super.initState();
    _removeSplash();
  }

  void _removeSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final isarAsyncValue = ref.watch(isarProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: isarAsyncValue.when(
        data: (isar) => const LoginScreen(),
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (err, stack) => Scaffold(
          body: Center(
            child: Text('Error al cargar Isar: $err'),
          ),
        ),
      ),
    );
  }
}
