import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'base_scaffold.dart'; 

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> medicamento;

  const DetailScreen({super.key, required this.medicamento});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');
    String fechaCaducidad = medicamento['fecha_caducidad'] != null
        ? formatter.format(medicamento['fecha_caducidad'].toDate())
        : 'No disponible';

    return BaseScaffold(
      title: medicamento['nombre']!,
      actions: const [],  // Usamos el nombre del medicamento como título
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Nombre', medicamento['nombre']),
              _buildDetailRow('Descripción', medicamento['descripcion']),
              _buildDetailRow('Precio', '\$${medicamento['precio']}'),
              _buildDetailRow('Stock', medicamento['stock'].toString()),
              _buildDetailRow('Lote', medicamento['lote']),
              _buildDetailRow('Fecha de Caducidad', fechaCaducidad),
              _buildDetailRow('Presentación', medicamento['presentacion']),
              _buildDetailRow('Sustancia', medicamento['sustancia']),
            ],
          ),
        ),
      ),
    );
  }

   Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$title:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 193, 185, 231),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color.fromARGB(255, 196, 184, 226)),
              ),
              child: Text(
                value ?? 'No disponible',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}