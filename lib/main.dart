import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa Firestore
import 'package:flutter/material.dart';
import 'package:medistock/detail_screen.dart';
import 'package:medistock/home_screen.dart';
import 'package:medistock/login_screen.dart'; // Asegúrate de tener esta pantalla
import 'package:medistock/settings_screen.dart';
import 'package:medistock/medical_screen.dart';
import 'firebase_options.dart'; // Para inicializar Firebase
import 'package:medistock/notifications_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    final snapshot = await FirebaseFirestore.instance.collection('test').get();
    print(
        'Firestore conectado: ${snapshot.docs.length} documentos encontrados');
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
      ),
      initialRoute: '/login', // Pantalla inicial
      routes: {

        '/login': (context) => const LoginScreen(), // Pantalla de inicio de sesión
        '/home': (context) => HomeScreen(), // Pantalla principal
        '/settings': (context) => const SettingsScreen(), // Pantalla de configuracionesla de login
        '/medical': (context) => const MedicalScreen(),
        '/detail': (context) {
          final medicamento = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return DetailScreen(medicamento: medicamento);
        },
        // Pantalla principal después de login
        '/notifications': (context) => const NotificationsScreen(),
      },
    );
  }
}

