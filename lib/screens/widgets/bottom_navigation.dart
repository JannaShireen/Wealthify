import 'package:cash_track/screens/home/screen_root.dart';
import 'package:cash_track/screens/home/screen_transaction_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MoneyManagerbottomNavigation extends StatelessWidget {
  const MoneyManagerbottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: RootPage.selectedIndexNotifier,
      builder:(BuildContext ctx, int updatedIndex, Widget? _){
        return BottomNavigationBar(
        currentIndex: updatedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (newIndex){
          RootPage.selectedIndexNotifier.value=newIndex;
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category),label:'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart),label: 'Insights'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      ]);
      } 
    );
  }
}