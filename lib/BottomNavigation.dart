import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:happy_cooking/Presentation/StartScreens/Account.dart';
import 'package:happy_cooking/Presentation/StartScreens/Category.dart';
import 'package:happy_cooking/Presentation/StartScreens/Home.dart';
import 'package:happy_cooking/Presentation/StartScreens/Saved.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Category(),
    Saved(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Color(0xFF89C35C),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.category),
            title: Text(
              'CATEGORY',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Color(0xFF89C35C),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/save_for _later.png'),
            ),
            title: Text(
              'SAVED',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Color(0xFF89C35C),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'ACCOUNT',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Color(0xFF89C35C),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
