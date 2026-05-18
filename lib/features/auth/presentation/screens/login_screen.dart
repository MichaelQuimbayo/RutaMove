import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_user/features/auth/presentation/screens/register_passenger.dart';
import 'package:flutter_user/features/auth/presentation/screens/role_selection_screen.dart';

import '../../../../presentation/widgets/custom_text_form_field.dart';

// TODO: Importar el provider de autenticación
// import 'package:rutamove/features/auth/presentation/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- Logo y Título ---
                Image.asset(
                  'assets/logo_rutaMove.png',
                  height:90,
                  // O puedes usar un Icon como placeholder:
                  // const Icon(Icons.directions_car, size: 100),
                ),
                const SizedBox(height: 10),
                /*Text(
                  'RutaMove',
                  style: textTheme.headlineLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),*/

                Text(
                  'Iniciar Sesión',
                  style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Ingresa tus credenciales para continuar tu viaje.',
                  style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),


                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border:
                      Border.all(
                        color: Colors.grey.withAlpha(100),
                        width: 1.0,),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.onSecondaryFixedVariant.withAlpha(40),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ]
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // --- Formulario ---
                      CustomTextFormField(
                        label: 'Correo Electrónico',
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        onChanged: (value){},
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        label: 'Contraseña',
                        //obscureText: true,
                        icon: Icons.lock_outline,
                        onChanged: (value){},
                      ),
                      const SizedBox(height: 14),

                      // --- Botón Iniciar Sesión ---
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Lógica para iniciar sesión con correo y contraseña
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RoleSelectionScreen()));
                          // ref.read(authProvider.notifier).loginWithEmail(...);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                        child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: Navegar a la pantalla de recuperación de contraseña
                          },
                          child: const Text('¿Olvidó su contraseña?'),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // --- Divisor ---
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('O CONTINÚA CON'),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // --- Botón de Google ---
                      OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Lógica para iniciar sesión con Google
                          // ref.read(authProvider.notifier).loginWithGoogle();
                        },
                        icon: Image.asset('assets/google.png', height: 24), // Asegúrate de tener este asset
                        label: const Text('Iniciar Sesión con Google'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // --- Botón Crear Cuenta ---
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿No tienes una cuenta?"),
                          TextButton(
                            onPressed: () {
                              // TODO: Navegar a la pantalla de registro
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterPassenger()));
                            },
                            child: const Text('Crear una cuenta'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
