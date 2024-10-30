import 'package:flutter/material.dart';

class CustomBottom extends StatefulWidget{
  @override
  State<CustomBottom> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  int _selectedBottomNavIndex = 0;

  // Function to switch between pages
  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings, color: Colors.white),
          label: '',
        ),
      ],
      currentIndex: _selectedBottomNavIndex,
      onTap: _onBottomNavItemTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.brown[900],
    );

  }
}