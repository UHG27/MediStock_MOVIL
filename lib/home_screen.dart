import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart'; // Asegúrate de que esta clase esté correctamente implementada.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false; // Controla si estamos en modo búsqueda
  final TextEditingController _searchController = TextEditingController();

  // Lista predefinida de medicamentos
  final List<Map<String, String>> _medicamentos = [
    {'nombre': 'Paracetamol', 'descripcion': 'Analgésico y antipirético'},
    {'nombre': 'Ibuprofeno', 'descripcion': 'Antiinflamatorio y analgésico'},
    {'nombre': 'Amoxicilina', 'descripcion': 'Antibiótico'},
    {'nombre': 'Omeprazol', 'descripcion': 'Inhibidor de la bomba de protones'},
    {'nombre': 'Losartán', 'descripcion': 'Antihipertensivo'},
    {'nombre': 'Metformina', 'descripcion': 'Antidiabético oral'},
    {'nombre': 'Cetirizina', 'descripcion': 'Antihistamínico'},
    {'nombre': 'Diclofenaco', 'descripcion': 'Analgésico y antiinflamatorio'},
    {'nombre': 'Ranitidina', 'descripcion': 'Bloqueador de ácido estomacal'},
  ];

  List<Map<String, String>> _filteredMedicamentos = []; // Lista filtrada
  bool _isLoading = true; // Controla si estamos cargando datos

  @override
  void initState() {
    super.initState();
    _initializeMedicamentos(); // Inicializa los datos
  }

  void _initializeMedicamentos() {
    setState(() {
      _filteredMedicamentos = _medicamentos; // Inicializar lista filtrada
      _isLoading = false; // Finaliza el estado de carga
    });
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
                _filteredMedicamentos = _medicamentos; // Restablecer lista completa
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Seleccionaste: ${medicamento['nombre']}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}