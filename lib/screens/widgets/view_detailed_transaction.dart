import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailedTransaction extends StatelessWidget {
  const DetailedTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 69, 8, 57),
                 title: const Text(' Transaction Details',
                          style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                ),
                          ),
      ),

    body: SafeArea(child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const[
          Text('Shopping',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
           Text('Date: 17 Feb'),
           Text('Description:  Weekend Shopping'),
           Text('Amount:  -₹180', 
                    style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                        ),
                      ),
           Text('Time: 10:00 AM',
                   style: TextStyle(
                          color: Colors.black,
                              fontSize: 18,
                              ),
                            ),
    
    
        ],
      ),
    )),
    );
  }
}