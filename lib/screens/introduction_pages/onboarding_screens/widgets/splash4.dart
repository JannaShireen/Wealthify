import 'package:flutter/material.dart';


class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              padding: const EdgeInsets.only(left: 30,top: 40),
              child: Image.asset('assets/images/splash3.png',
              height: 250,
              ),
              ),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.only(left: 65),
                child: Text('Planning ahead',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
              ),
                const SizedBox(height: 10),
                  Container(
                padding: const EdgeInsets.all(35),
                child: const Text(
                  'Setup your budget for each category so you in control',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),),
              ),
                const Spacer(),
            // const Text('Planning ahead',
            // style: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.bold,
            // ),),
            // Row(
            //   children: const [ Text('Setup your budget for each category so you in control',
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontWeight: FontWeight.normal),)],
            // )
      
          ],
      
        ),
      )

    );
  }
}