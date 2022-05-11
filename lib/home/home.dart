import 'package:flutter/material.dart';
import 'package:otomax/home/discover.dart';
import 'package:otomax/home/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  final screens = [
    Discover(),
    Profile()
  ];
  Widget build(BuildContext context) {
     return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index)=> setState(() => currentIndex = index),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
              ),
          ]),
    );
  }
}
