import 'package:flutter/material.dart';

class LayoutApp extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool scrollable;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool isDrawer;

  const LayoutApp({
    super.key,
    this.title,
    required this.body,
    this.scrollable = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    required this.isDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget content = scrollable
        ? SingleChildScrollView(child: body)
        : body;

    return Scaffold(
      appBar: title != null ? AppBar(title:
      Text(title!,
        style: textTheme.headlineLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      )) : null,

      // 👇 Drawer agregado
      drawer: isDrawer? _AppDrawer():null,


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: content,
        ),
      ),

      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Mike Dev'),
            accountEmail: Text('quiem.music.co@gmail.com'),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/home');
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}