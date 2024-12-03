import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Función para manejar el cierre de sesión
  void _signOut(BuildContext context) {
    // Aquí puedes implementar la lógica de cierre de sesión (Firebase, shared_preferences, etc.)
    // Ejemplo:
    // await FirebaseAuth.instance.signOut();

    // Redirigir a la pantalla de login después de cerrar sesión
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
        backgroundColor: const Color.fromARGB(255, 83, 74, 255), // Azul
        elevation: 0, // Elimina la sombra si lo prefieres
      ),
      body: ListView(
        children: [
          // Cerrar sesión
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              _signOut(context);  // Llama a la función para cerrar sesión
            },
          ),
          const Divider(),

          // Política de privacidad
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Política de privacidad'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Redirigiendo a la política de privacidad...')),
              );
              // Aquí puedes abrir un enlace a la política de privacidad si lo deseas
            },
          ),
          const Divider(),

          // Información del sistema
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
