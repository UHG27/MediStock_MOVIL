import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> medicamento;

  // Recibimos los datos del medicamento a través del constructor
  const DetailScreen({super.key, required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 83, 74, 255), // Color personalizado
        title: Row(
          children: [
            Expanded(
              child: Text(
                medicamento['nombre']!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Título en blanco
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipOval( // Hacemos el logo circular
                child: Image.asset(
                  'assets/images/genericos.png', // Ruta del logo
                  fit: BoxFit.cover, // Asegura que la imagen cubra el círculo
                ),
              ),
            ),
          ],
        ),
        elevation: 0, // Eliminar la sombra de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Permite el desplazamiento en pantallas más pequeñas
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Nombre', medicamento['nombre']),
              _buildDetailRow('Descripción', medicamento['descripcion']),
              _buildDetailRow('Precio', '\$${medicamento['precio']}'),
              _buildDetailRow('Stock', medicamento['stock'].toString()),
              _buildDetailRow('Lote', medicamento['lote']),
              _buildDetailRow('Fecha de Caducidad', medicamento['fecha_caducidad']),
              _buildDetailRow('Presentación', medicamento['presentacion']),
              _buildDetailRow('Sustancia', medicamento['sustancia']),
            ],
          ),
        ),
      ),
    );
  }

  // Método para crear cada fila con un título y su respectivo dato dentro de una caja
  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120, // Ancho fijo para el título
            child: Text(
              '$title:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Color del título
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 193, 185, 231), // Color de fondo de la caja
                borderRadius: BorderRadius.circular(8), // Bordes redondeados
                border: Border.all(color: const Color.fromARGB(255, 196, 184, 226)), // Borde suave
              ),
              child: Text(
                value ?? '', // Si no hay valor, no se muestra nada
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87, // Color del texto
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Si el texto es muy largo, se corta
              ),
            ),
          ),
        ],
      ),
    );
  }
}
