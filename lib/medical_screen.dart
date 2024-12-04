import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medistock/base_scaffold.dart';
import 'package:medistock/detail_screen.dart';

class MedicalScreen extends StatefulWidget {
  const MedicalScreen({super.key});

  @override
  State<MedicalScreen> createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _medicamentos = [];
  List<Map<String, dynamic>> _filteredMedicamentos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMedicamentos();
  }

  @override
  void dispose() {
    _searchController.dispose(); // Limpiar el controlador al desmontar el widget
    super.dispose();
  }

  void _loadMedicamentos() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('inventario_producto')
          .get();

      if (!mounted) return; // Verifica si el widget sigue montado antes de setState

      setState(() {
        _medicamentos = snapshot.docs.map((doc) {
          return {
            'nombre': doc['nombre'],
            'descripcion': doc['descripcion'],
            'precio': doc['precio'],
            'lote': doc['lote'],
            'fecha_caducidad': doc['fecha_caducidad'],
            'stock': doc['stock'],
            'presentacion': doc['presentacion'],
            'sustancia': doc['sustancia'],
          };
        }).toList();
        _filteredMedicamentos = _medicamentos;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar datos: $e')),
      );
    }
  }

  void _filterMedicamentos(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMedicamentos = _medicamentos;
      } else {
        _filteredMedicamentos = _medicamentos
            .where((medicamento) =>
                medicamento['nombre']!
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: _isSearching ? '' : 'Medicamentos',
      actions: [
        if (_isSearching)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Buscar medicamentos...',
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Colors.white
                ),
                onChanged: _filterMedicamentos,
              ),
            ),
          ),
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _isSearching = false;
                _searchController.clear();
                _filteredMedicamentos = _medicamentos;
              } else {
                _isSearching = true;
              }
            });
          },
        ),
      ],
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _filteredMedicamentos.isEmpty
              ? const Center(
                  child: Text(
                    'No se encontraron medicamentos.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : _buildMedicamentosList(),
      initialIndex: 1,
      isSearching: _isSearching,
    );
  }

  Widget _buildMedicamentosList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _filteredMedicamentos.length,
      itemBuilder: (context, index) {
        final medicamento = _filteredMedicamentos[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(
              medicamento['nombre']!,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(medicamento['descripcion']!),
            leading: const Icon(Icons.medical_services_outlined),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(medicamento: medicamento),
                ),
              );
            },
          ),
        );
      },
    );
  }
}