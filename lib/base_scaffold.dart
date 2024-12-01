import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions;

  const BaseScaffold({
    super.key,
    required this.body,
    required this.title,
    this.actions,
  });

  @override
  BaseScaffoldState createState() => BaseScaffoldState();
}

class BaseScaffoldState extends State<BaseScaffold> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/edit_profile',
    '/notifications',
    '/settings',
  ];

  void _onItemTapped(int index) {
    // Si la ruta seleccionada es la misma que la actual, no hacer nada
    if (ModalRoute.of(context)?.settings.name == _routes[index]) return;

    // Cambiar al índice seleccionado
    setState(() {
      _selectedIndex = index;
    });

    // Navegar a la ruta correspondiente, eliminando todas las pantallas previas
    Navigator.pushNamedAndRemoveUntil(
      context,
      _routes[index],
      (Route<dynamic> route) => false, // Elimina todas las pantallas anteriores
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent, // Lo dejamos transparente para el gradiente
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 101, 166, 231), // Azul
                Color.fromARGB(255, 101, 204, 204), // Verde agua
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: widget.actions,
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 35),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 35),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 70, 69, 69).withOpacity(0.5),
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 45,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}