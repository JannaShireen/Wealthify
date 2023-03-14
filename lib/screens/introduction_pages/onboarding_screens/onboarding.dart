import 'package:wealthify/screens/home/screen_root.dart';
import 'package:wealthify/screens/home/screen_transaction_home.dart';
import 'package:wealthify/screens/introduction_pages/onboarding_screens/widgets/splash2.dart';
import 'package:wealthify/screens/introduction_pages/onboarding_screens/widgets/splash3.dart';
import 'package:wealthify/screens/introduction_pages/onboarding_screens/widgets/splash4.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool isLastPage = false;

  bool isVisible = true;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              //to check whether last page is reached
              setState(() {
                isLastPage = (index == 2);
                isVisible = (index != 2);
              });
            },
            controller: _pageController,
            children: const [
              OnBoardingOne(),
              OnBoardingTwo(),
              OnBoardingThree(),
            ],
          ),

         Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: GestureDetector(
                        onTap: () {
                          _pageController.jumpToPage(2);
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0x992E49FB),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Skip',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.skip_next_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              
          
          
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
                      SmoothPageIndicator(
                                      onDotClicked: (index) => _pageController.animateToPage(index,
                                      duration: const Duration(milliseconds: 500),
                                       curve: Curves.easeIn),
                                       controller: _pageController,
                                      count: 3,
                                      effect: const WormEffect(),
                       ),
            
          
                    isLastPage
                      ? GestureDetector(
                             onTap: (() async {
                            //  final pref = await SharedPreferences.getInstance();
                            // pref.setBool('seen', true);
                            const HomeScreen();
                            //pref.setBool('seen', false);
                             }),
                        // child: Container(
                        //               height: 50,
                        //               width: 140,
                        //               decoration: const BoxDecoration(
                                              
                        //                           borderRadius: BorderRadius.all(Radius.circular(15)),
                        //                            color: Colors.transparent,
                        //                            image:  DecorationImage(
                        //                                      image:   AssetImage(
                        //                                              "assets/images/light-violet.png",
                        //                                             ),
                        //                                      fit: BoxFit.cover,
                        //                                   ),
                        //                            ),
                                child: Center(
                                        // child: Row(
                                            
                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              //  children: [

                                                          child : ElevatedButton(onPressed:() => Navigator.of(context)
                                                          .pushReplacement(MaterialPageRoute(builder: (context) => const RootPage(),)),

                            
                                               
                                                              style: ElevatedButton.styleFrom(
                                                                      foregroundColor: Colors.white,
                                                                     ),
                                                            child: const Text('Get Started'),
                                                    
                                                    ),

               
              
                                                // TextButton(
                                                //           style: TextButton.styleFrom(
                                                //           foregroundColor: Colors.blue,
                                                //            ),
                                                //            onPressed: () { },
                                                //             child: const Text('Get Started!'),
                                                //           ),
                                                        //  const Text(
                                                        //     'Get Started',
                                                        //     style: TextStyle(
                                                        //      color: Colors.white,
                                                        //     ),
                                                        // //     ),
                                                        //   Icon(
                                                        //     Icons.adaptive.arrow_forward,
                                                        //      color: Colors.blue,
                                                        //      )
                                                        //  ],
                                            ),
                                      )
                                // )
                      //  )
                      : GestureDetector(
                                       onTap: (() {
                                            _pageController.nextPage(
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.easeIn);
                                              }),
                        child: Center(
                                     child:
                                     Container(
                                      color: Colors.blue,
                                      padding: const EdgeInsets.all(2),
                                       child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                               children:const  [
                                                       Text(
                                                                'Next',
                                                                  style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                    ),
                                                                 ),
                                                       Icon(  
                                                             Icons.arrow_forward_sharp,
                                                            color: Colors.white,
                                                            size: 1.2,
                                                           ),
                                                       ],
                                               ),
                                     ),
                                    ),
                       )
        ],
      ),
    ],
  ),
),
],
),
);
    

}
}