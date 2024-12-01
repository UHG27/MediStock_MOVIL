import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> medicamento;

  // Recibimos los datos del medicamento a través del constructor
  const DetailScreen({super.key, required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicamento['nombre']!), // Mostrar nombre del medicamento
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${medicamento['nombre']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Descripción: ${medicamento['descripcion']}'),
            const SizedBox(height: 10),
            Text('Precio: \$${medicamento['precio']}'),
            const SizedBox(height: 10),
            Text('Stock: ${medicamento['stock']}'),
            const SizedBox(height: 10),
            Text('Lote: ${medicamento['lote']}'),
            const SizedBox(height: 10),
            Text('Fecha de Caducidad: ${medicamento['fecha_caducidad']}'),
            const SizedBox(height: 10),
            Text('Presentación: ${medicamento['presentacion']}'),
            const SizedBox(height: 10),
            Text('Sustancia: ${medicamento['sustancia']}'),
          ],
        ),
      ),
    );
  }
}
