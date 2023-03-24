import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class bottombarwidget extends StatelessWidget {
  const bottombarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child: BottomNavigationBar(
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 35,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: 'adds'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded),label: 'reels'),
        BottomNavigationBarItem(icon: CircleAvatar(),label: 'users'),
      ],
    ));
  }
}