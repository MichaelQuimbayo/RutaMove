import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        // --- Fondo con patrón ---
        // DEBES AÑADIR una imagen en 'assets/images/background_pattern.png'
        // y declararla en tu pubspec.yaml
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),

                // --- Logo y Título ---
                // DEBES AÑADIR tu logo en 'assets/images/logo.png'
                Image.asset(
                  'assets/logo_rutaMove.png',
                  height: 100,
                  // O puedes usar un Icon como placeholder:
                  // const Icon(Icons.directions_car, size: 100),
                ),
                const SizedBox(height: 16),
                Text(
                  'RutaMove',
                  style: textTheme.headlineLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Viaja fácil entre ciudades',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                
                const Spacer(flex: 2),

                // --- Indicador de Página ---
                const _PageIndicator(),

                const Spacer(flex: 3),

                // --- Pie de Página ---
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PREMIUM MOBILITY',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.5),
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'EST. 2024',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.5),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 1 // Asumiendo que esta es la segunda página
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
