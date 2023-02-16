

import 'dart:async';

import 'package:cash_track/screens/introduction_pages/onboarding_screens/onboarding.dart';

import 'package:cash_track/screens/home_page.dart';
import 'package:cash_track/screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkWhereToGo();
    
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  const  Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
        child: Center(
        // heightFactor: 3,
        // widthFactor: 0.8,
       
            child:  Text(
            'CashTrack',
            textScaleFactor: 3,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              ),
          ),
        
      
      ),
      ),
      

      
      
        
        
    );
  }
  Future<void>checkWhereToGo() async{
    Future.delayed(const Duration(seconds: 5));
     SharedPreferences preferences= await SharedPreferences.getInstance();
     bool seen= preferences.getBool('seen') ?? false;
     seen ? goHome() : goToOnboardPage();

  
  }
    Future <void> goToOnboardPage() async{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) =>  const Onboarding()),),);

    }

    Future <void> goHome() async{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const RootPage()),),);
   }
}