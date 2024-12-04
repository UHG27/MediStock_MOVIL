import 'package:flutter/material.dart';
import 'package:medistock/medical_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Color.fromARGB(255, 83, 74, 255), 
        title: const Text('Bienvenido a MediStock'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 83, 74, 255),
              Color.fromARGB(255, 120, 94, 255), 
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              SizedBox(
                height: 120,
                width: 120,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/image.png', 
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        size: 60,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a MediStock',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MedicalScreen(), 
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 83, 74, 255),
                ),
                child: const Text(
                  'Ver Medicamentos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
     ),
);
}
}