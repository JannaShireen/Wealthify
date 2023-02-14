import 'package:flutter/material.dart';


class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              
              padding: const EdgeInsets.only(left: 30,top: 40),
              child: Image.asset('assets/images/splash1.png',
              height: 250,
              ),
            ),

            const SizedBox(height: 40,),
           
            Text(
              'Gain total control of your money',
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(height: 10),
      
            Container(
              padding: const EdgeInsets.all(25),
              child: const Text(
                'Become your own money manager and make every cent count',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.normal),),
            ),
              const Spacer(),
      
          ],
      
        ),
      ),

        
    );
  }
}