import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isAuthenticating = false; // Para mostrar estado de carga

  // Simulación de autenticación
  Future<bool> _authenticate(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simula un delay
    return username == "admin" && password == "1234"; // Usuario y contraseña válidos
  }

void _login() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isAuthenticating = true; // Mostrar indicador de carga
    });

    // Simula autenticación
    bool isValidUser = await _authenticate(
      _usernameController.text,
      _passwordController.text,
    );

    if (!mounted) return; // Verificar si el widget sigue montado

    setState(() {
      _isAuthenticating = false; // Ocultar indicador de carga
    });

    if (isValidUser) {
      // Navegar a la ruta '/home'
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Mostrar error si no es válido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu usuario';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu contraseña';
                  } else if (value.length < 4) {
                    return 'La contraseña debe tener al menos 4 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _isAuthenticating
                  ? const CircularProgressIndicator() // Indicador de carga
                  : ElevatedButton(
                      onPressed: _login, // Llamamos al método _login
                      child: const Text('Iniciar sesión'),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}