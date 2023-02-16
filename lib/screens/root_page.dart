import 'package:cash_track/screens/category_page.dart';
import 'package:cash_track/screens/home_page.dart';
import 'package:cash_track/screens/insight_page.dart';

import 'package:cash_track/settings_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentSelectedIndex=0;
  final _pages=[
      HomeScreen(),
      CategoryPage(),
      InsightPage(),
      SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex){
         setState(() {
            _currentSelectedIndex=newIndex;
         });
        },
                            items:const [
                              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                              BottomNavigationBarItem(icon: Icon(Icons.category),label:'Category'),
                              BottomNavigationBarItem(icon: Icon(Icons.pie_chart),label: 'Insights'),
                              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),



                            ]),
    );
  }
}