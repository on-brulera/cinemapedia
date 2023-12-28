import 'package:flutter/material.dart';

class CustomButtomNavigation extends StatelessWidget {
  
  const CustomButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_max)
        ),
        BottomNavigationBarItem(
          label: 'Categoria',
          icon: Icon(Icons.label_off_outlined)
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(Icons.favorite_outline)
        ),
      ],
    );
  }
}