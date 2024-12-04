import 'package:flutter/material.dart';
import 'package:medistock/base_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Función para manejar el cierre de sesión
  void _signOut(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Configuraciones', // Título de la pantalla
      actions: const [],
      body: ListView(
        children: [
          // Cerrar sesión
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              _signOut(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Política de privacidad'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Redirigiendo a la política de privacidad...')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Información del sistema'),
            subtitle: const Text('Versión: 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'MediStock',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.local_pharmacy),
                children: [
                  const Text('Aplicación para la gestión de inventarios farmacéuticos.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}