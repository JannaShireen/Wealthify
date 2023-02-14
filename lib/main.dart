import 'package:cash_track/screens/introduction_pages/splash1.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CashTrack());
}

class CashTrack extends StatelessWidget {
  const CashTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const SplashScreen(),

     
    );
  }
}

