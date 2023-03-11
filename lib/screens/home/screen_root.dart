import 'package:cash_track/screens/category/screen_category.dart';
import 'package:cash_track/screens/home/screen_transaction_home.dart';
import 'package:cash_track/screens/widgets/bottom_navigation.dart';
import 'package:cash_track/Insights/insight_screen.dart';
import 'package:cash_track/settings/settings.dart';
import 'package:flutter/material.dart';


class RootPage extends StatelessWidget {
  const RootPage({super.key});
  static ValueNotifier<int>selectedIndexNotifier= ValueNotifier(0);
  final _pages=const [
      HomeScreen(),
      ScreenCategory(),
      InsightPage(),
      Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoneyManagerbottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
          )),
          );
    
  }
}