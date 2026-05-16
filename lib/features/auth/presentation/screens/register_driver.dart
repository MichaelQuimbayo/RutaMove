import 'Package:flutter/material.dart';

class RegisterDriver extends StatefulWidget {
  const RegisterDriver({super.key});

  @override
  State<RegisterDriver> createState() => _RegisterPassengerState();
}

class _RegisterPassengerState extends State<RegisterDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Registro Conductores')
      ),
    );
  }
}
