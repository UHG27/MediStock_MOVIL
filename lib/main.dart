import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa Firestore
import 'package:flutter/material.dart';
import 'package:medistock/home_screen.dart';
import 'package:medistock/login_screen.dart'; // Asegúrate de tener esta pantalla
import 'firebase_options.dart'; // Para inicializar Firebase
 // Asegúrate de tener esta pantalla

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Verificar conexión a Firestore
  try {
    final snapshot = await FirebaseFirestore.instance.collection('test').get();
    print('Firestore conectado: ${snapshot.docs.length} documentos encontrados');
  } catch (e) {
    print('Error conectando a Firestore: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediStock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      initialRoute: '/', // Cambia la ruta inicial
      routes: {
        '/': (context) => const LoginScreen(), // Pantalla de login
        '/home': (context) => const HomeScreen(), // Pantalla principal después de login
      },
    );
  }
}

