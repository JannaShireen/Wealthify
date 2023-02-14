import 'package:flutter/material.dart';



class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

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
                child: Image.asset('assets/images/splash2.png',
                height: 250),
                ),
      
                const SizedBox(height: 40),
                Text('Know where your money goes',
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
                  'Track your transaction easily, with categories and financial report',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),),
              ),
                const Spacer(),
            
            // Text('Track your transaction easily, with categories and financial report',
            // style: TextStyle(
            //   color: Colors.grey,
            //   fontWeight: FontWeight.normal),)
      
          ],
      
        ),
      ),

    );
  }
}