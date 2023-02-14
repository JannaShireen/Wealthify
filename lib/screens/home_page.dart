import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(208, 187, 116, 186),
      appBar: AppBar(
                 backgroundColor: Color.fromARGB(255, 11, 107, 156),
                 title: const Center(
                 child: Text('CashTrack',
                          style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                          ),
                     ),
      body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                  child: Column(
                  
                    
                          children: 
                                    const [
                                      Text('Total'),
                                  Center(
                                    child: Text("₹9400",
                                      style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                      ),
                                      ),
                                  )
                          ],
                        ),
                ),
           ),
          );
    
     }
 }