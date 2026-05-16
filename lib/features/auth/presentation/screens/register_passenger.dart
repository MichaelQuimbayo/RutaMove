import 'Package:flutter/material.dart';
import 'package:flutter_user/presentation/widgets/layouts/layout_app.dart';

class RegisterPassenger extends StatefulWidget {
  const RegisterPassenger({super.key});

  @override
  State<RegisterPassenger> createState() => _RegisterPassengerState();
}

class _RegisterPassengerState extends State<RegisterPassenger> {
  @override
  Widget build(BuildContext context) {
    return const LayoutApp(
      title: 'Registro pasajero',
      body: Center(
      child: Text('Registro pasajero')
      )
    );
  }
}
