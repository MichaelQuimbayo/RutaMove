import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../shared/widgets/custom_text_form_field.dart';
import '../../../../shared/widgets/layout_app.dart';

class RegisterPassenger extends ConsumerStatefulWidget {
  const RegisterPassenger({super.key});

  @override
  ConsumerState<RegisterPassenger> createState() => _RegisterPassengerState();
}

class _RegisterPassengerState extends ConsumerState<RegisterPassenger> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para capturar los datos
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Las contraseñas no coinciden')),
      );
      return;
    }

    // Llamamos al register del AuthNotifier
    /*await ref.read(authNotifierProvider.notifier).register(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
        );*/
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    //final authState = ref.watch(authNotifierProvider);

    // Escuchamos cambios en el estado para mostrar errores o navegar
   /* ref.listen(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        },
        data: (_) {
          // Si el estado es data y no es nulo (éxito), navegamos
          // Navigator.of(context).pushReplacementNamed('/home');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Cuenta creada con éxito!')),
          );
        },
      );
    });*/

    return LayoutApp(
      isDrawer: false,
      title: 'Crear cuenta',
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.grey.withAlpha(100),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.onSecondaryFixedVariant.withAlpha(40),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ProfilePictureSelector(),
                    CustomTextFormField(
                      controller: _nameController,
                      label: 'Nombres Completos',
                      keyboardType: TextInputType.name,
                      icon: Icons.person_outline,
                      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      label: 'Correo Electrónico',
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || !value.contains('@')) return 'Email inválido';
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: _phoneController,
                      label: 'Número de teléfono',
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone_android_outlined,
                      validator: (value) => value == null || value.length < 7 ? 'Mínimo 7 dígitos' : null,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: 'Crear contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) => value == null || value.length < 6 ? 'Mínimo 6 caracteres' : null,
                    ),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      label: 'Confirmar contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      icon: Icons.lock_reset_outlined,
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                     // onPressed: authState.isLoading ? null : _onRegister,
                      onPressed: _onRegister,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                      ),
                      child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Crear Cuenta',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_rounded, size: 24),
                              ],
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePictureSelector extends StatefulWidget {
  const ProfilePictureSelector({super.key});

  @override
  State<ProfilePictureSelector> createState() => _ProfilePictureSelectorState();
}

class _ProfilePictureSelectorState extends State<ProfilePictureSelector> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _image = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        InkWell(
          onTap: _pickImage,
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(24),
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(File(_image!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _image == null
                    ? Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.grey[600],
                      )
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    _image == null ? Icons.add : Icons.edit,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Foto de perfil',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Ayuda a los conductores a reconocerte en el punto de recogida.',
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
