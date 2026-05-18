import 'dart:io';
import '../../../../presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/presentation/widgets/layouts/layout_app.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPassenger extends StatefulWidget {
  const RegisterPassenger({super.key});

  @override
  State<RegisterPassenger> createState() => _RegisterPassengerState();
}

class _RegisterPassengerState extends State<RegisterPassenger> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return LayoutApp(
      isDrawer: false,
      title: 'Crear cuenta',
      body: SingleChildScrollView(
      child:  Container(
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
          children: [
            Form(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    const ProfilePictureSelector(),
                    CustomTextFormField(
                      label: 'Nombres Completos',
                      keyboardType: TextInputType.name,
                      icon: Icons.person,
                      onChanged: (value){},
                    ),
                    CustomTextFormField(
                      label: 'Correo Electrónico',
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      onChanged: (value){},
                    ),
                    CustomTextFormField(
                    label: 'Numero de telefono',
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone,
                    onChanged: (value){},
                  ),CustomTextFormField(
                    label: 'Crear contraseña',
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock_outline,
                    onChanged: (value){},
                  ),
                    CustomTextFormField(
                    label: 'Confirmar contraseña',
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock_reset_outlined,
                    onChanged: (value){},
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Lógica para iniciar sesión con correo y contraseña
                    },
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
                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
              ],
            )

            )
          ],
        ),
      ),
      )
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
        /*TextButton(
          onPressed: _pickImage,
          child: Text(
            _image == null ? 'Subir foto' : 'Cambiar foto',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),*/
      ],
    );
  }
}
