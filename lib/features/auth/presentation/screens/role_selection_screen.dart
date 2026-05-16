import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_user/features/auth/presentation/screens/index.dart';

// TODO: Reemplazar con las rutas correctas a tus futuras pantallas de autenticación
// import 'package:rutamove/features/auth/presentation/screens/login_screen.dart'; 

class RoleSelectionScreen extends ConsumerWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // --- Sección de Título ---
              /*Icon(
                Icons.directions_car_filled_outlined,
                size: 64,
                color: colorScheme.primary,
              ),*/
              Image.asset(
                'assets/logo_rutaMove.png',
                height: 100,
                // O puedes usar un Icon como placeholder:
                // const Icon(Icons.directions_car, size: 100),
              ),
              //const SizedBox(height: 20),
              Text(
                'Bienvenido a RutaMove',
                style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              Text(
                'Conectando viajes, uniendo ciudades.',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),

              // --- Botones de Acción ---
              _RoleButton(
                title: 'Soy Pasajero',
                subtitle: 'Encuentra conductores confiables y viaja a tu ritmo',
                icon: Icons.drive_eta_outlined,
                isPrimary: false,
                onTap: () {
                  // TODO: Navegar a la pantalla de login/registro de conductor
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterPassenger()));
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LoginScreen(isDriver: true)));
                },
                titleNextPage: 'Comenzar viaje',
                textColorTravel: colorScheme.primary,
                imageTravel: 'assets/driveTravel.jpg',
              ),
              const SizedBox(height: 20),
              _RoleButton(
                title: 'Soy Conductor',
                subtitle: 'Gestiona tus rutas y aumenta tus ingresos diarios',
                icon: Icons.person_search_outlined,
                isPrimary: false,
                onTap: () {
                  // TODO: Navegar a la pantalla de login/registro de pasajero
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterDriver()));
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LoginScreen(isDriver: false)));
                },
                titleNextPage: 'Empezar a conducir',
                textColorTravel: colorScheme.onTertiaryContainer,
                imageTravel: 'assets/travelControl.jpg',
              ),
              //const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool isPrimary;
  final String titleNextPage;
  final String imageTravel;
  final Color textColorTravel;

  const _RoleButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.imageTravel,
    required this.textColorTravel,
    this.isPrimary = true,
    required this.titleNextPage,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final backgroundColor = isPrimary ? colorScheme.primary : colorScheme.surface;
    final foregroundColor = isPrimary ? colorScheme.onPrimary : colorScheme.primary;
    final borderColor = isPrimary ? Colors.transparent : colorScheme.outline;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [

          /// Imagen fondo
          Positioned.fill(
            child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: AssetImage(imageTravel),
              fit: BoxFit.cover,
            ),
          ),

          /// Overlay oscuro
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),

          /// Botón / contenido
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withAlpha(160),
                shadowColor: Colors.transparent,
                foregroundColor: foregroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                elevation: isPrimary ? 4 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: textColorTravel,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      icon,
                      size: 32,
                      color: colorScheme.onPrimary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: textColorTravel,
                          ),
                        ),

                        Text(
                          subtitle,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          children: [
                            Text(
                              titleNextPage,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: textColorTravel,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Icon(
                              Icons.arrow_right_alt_rounded,
                              color: textColorTravel,
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
