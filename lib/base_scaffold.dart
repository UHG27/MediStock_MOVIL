import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions;
  final int initialIndex;
  final bool isSearching;
  

  const BaseScaffold({
    super.key,
    required this.body,
    required this.title,
    this.actions,
    this.initialIndex = 0,
    this.isSearching = false,
  });

  @override
  BaseScaffoldState createState() => BaseScaffoldState();
}

class BaseScaffoldState extends State<BaseScaffold> {
  late int _selectedIndex;

  final List<String> _routes = [
    '/home',
    '/medical',
    '/settings',
  ];

@override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

void _onItemTapped(int index) {
  if (_selectedIndex != index) {
    Navigator.pushNamed(context, _routes[index]);
  }
}


   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/genericos.jpg', // Ruta de tu logo
                height: 30, // Tamaño del logo
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        automaticallyImplyLeading: !widget.isSearching,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 83, 74, 255),
                Color.fromARGB(255, 120, 94, 255),
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
            icon: Icon(Icons.medical_services, size: 35),
            label: 'medical',
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