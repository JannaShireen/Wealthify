import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/home/screen_transaction_home.dart';
import 'package:cash_track/screens/widgets/view_detailed_transaction.dart';
import 'package:flutter/material.dart';
import 'package:cash_track/screens/category/screen_category.dart';
import 'package:intl/intl.dart';


class ListViewAllTransactions extends StatelessWidget {
  const ListViewAllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 69, 8, 57),
                 title: const Text('Transactions',
                          style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                ),
                          ),
),
     body: SafeArea(child:  ValueListenableBuilder(
                        valueListenable: TransactionDB.instance.transactionListNotifier,
                       builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _){
                        // return newList.length==0? Center(child: Text('NO VALUE'),) :
                        return newList.isEmpty?
                        Center(child: Text('No transactions added yet'),) :                        
                          ListView.separated(
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (ctx, index) {
                          final _value= newList[index];
                          return  Card(
                            elevation: 0,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 50,
                                
                                backgroundColor: _value.type == CategoryType.income ? Colors.green : Colors.red,
                                child: Text(
                                  parseDate(_value.date),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              title: Text('RS ${_value.amount}'),
                              subtitle: Text(_value.category.name),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider(height: 5,
                          thickness: 5,);
                        },
                        itemCount: newList.length,
                      );
                       }
                       )
                       )
    );
  }
  String parseDate(DateTime date){

  final _date= DateFormat.MMMd().format(date);
  final _splitedDate= _date.split(' ');
 return  '${_splitedDate.last}\n${_splitedDate.first}';
  //return '${date.day}\n${date.month}';
}
}
//       ListView(
//                                          children: [
//                                                ListTile(
//                                                            leading: CircleAvatar(child: Icon(Icons.arrow_downward_outlined,),
//                                                            backgroundColor:Colors.red,), 
//                                                            onTap: (){
//                                                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DetailedTransaction()),
//             );
//                                                            }, 
//                                                   //  leading: Container(
                                                                                                  
//                                                   //       width: 50,
//                                                   //       height: 50,
//                                                   //       color: Colors.red,
//                                                   //       padding: const EdgeInsets.all(9),
//                                                   //       child: const Text('17 Feb'),
//                                                   //       ),
//                                                     title: const Text('Shopping',style: TextStyle(fontWeight: FontWeight.w400),),
//                                                     subtitle: const Text('17 Feb'),
//                                                     trailing: Column( 
//                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                    children: const [
//                                                                                 Text('-₹180', 
//                                                                                        style: TextStyle(
//                                                                                               color: Colors.red,
//                                                                                                 fontSize: 18,
//                                                                                                 ),
//                                                                                                 ),
//                                                                                Text('10:00 AM',
//                                                                                         style: TextStyle(
//                                                                                               color: Colors.grey,
//                                                                                                 fontSize: 12,
//                                                                                                    ),
//                                                                                  ),
//                                                                                  ],
//                                                               ),
//                                                ),
//                                               Divider(height: 0.5,
//                                               thickness: 1,),
//                                              ListTile(
//                                               onTap: (){
//                                                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DetailedTransaction()),
//             );
//                                                            }, 
//                                               leading: CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.arrow_upward_outlined),),
//                                                 // leading: Container(
                                        
//                                                 //            width: 50,
//                                                 //            height: 50,
//                                                 //            color: Colors.green,
//                                                 //             padding: const EdgeInsets.all(9),
//                                                 //            child: const Text('15 Feb'),
//                                                 //        ),
//                                                 title: const Text('Salary',style: TextStyle(fontWeight: FontWeight.w400),),
//                                                 subtitle: const Text('15 Feb'),
//                                                  trailing: Column( 
//                                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                 children: const [
//                                                                           Text('+₹45000', 
//                                                                              style: TextStyle(
//                                                                                      color: Colors.green,
//                                                                                     fontSize: 18,
//                                                                                     ),
//                                                                               ),
//                                                                            Text('12:00 PM',
//                                                                                  style: TextStyle(
//                                                                                      color: Colors.grey,
//                                                                                     fontSize: 12,
//                                                                                    ),
//                                                                               ),

                               
//                                                                             ],
//                                                            ),
//                                                          ),
//                   const Divider(height: 0.5,thickness: 1,),
// ListTile(
//                  leading: const CircleAvatar(child: Icon(Icons.arrow_downward_outlined,),
//                                                            backgroundColor:Colors.red,),                                         
//       // leading: Container(
                                        
//       //                    width: 50,
//       //                    height: 50,
//       //                    color: Colors.red,
//       //                    padding: const EdgeInsets.all(9),
//       //                   child: const Text('13 Feb'),
//       //                   ),
//       onTap: (){
//                                                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DetailedTransaction()),
//             );
//                                                            }, 
//       title: const Text('fuel',style: TextStyle(fontWeight: FontWeight.w400),),
//       subtitle:const Text('13 Feb'),
//       trailing: Column( 
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: const [
//                                       Text('+₹500', 
//                                             style: TextStyle(
//                                                             color: Colors.red,
//                                                             fontSize: 18,
//                                                             ),
//                                           ),
//                                       Text('12:00 PM',
//                                              style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 12,
//                                                             ),
//                                           ),
                               
                               
//                                       ],
//                        ),
//   ),

//   const Divider(height: 0.5,thickness: 1,),
//   ListTile(
//     onTap: (){
//                                                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DetailedTransaction()),
//             );
//                                                            }, 
//                 leading: CircleAvatar(child: Icon(Icons.arrow_downward_outlined,),
//                                                            backgroundColor:Colors.red,),                                           
//       // leading: Container(
                                        
//       //                    width: 50,
//       //                    height: 50,
//       //                    color: Colors.red,
//       //                    padding: const EdgeInsets.all(9),
//       //                   child: const Text('13 Feb'),
//       //                   ),
//       title: const Text('fuel',style: TextStyle(fontWeight: FontWeight.w400),),
//       subtitle: const Text('11 Feb'),
//       trailing: Column( 
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: const [
//                                       Text('+₹500', 
//                                             style: TextStyle(
//                                                             color: Colors.red,
//                                                             fontSize: 18,
//                                                             ),
//                                           ),
//                                       Text('12:00 PM',
//                                              style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 12,
//                                                             ),
//                                           ),
                               
                               
//                                       ],
//                        ),
//   ),

//   const Divider(height: 0.5,thickness: 1,),
//   ListTile(
//     onTap: (){
//                                                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DetailedTransaction()),
//             );
//                                                            }, 
//                        leading: CircleAvatar(child: Icon(Icons.arrow_downward_outlined,),
//                                                            backgroundColor:Colors.red,),                                    
//       // leading: Container(
                                        
//       //                    width: 50,
//       //                    height: 50,
//       //                    color: Colors.red,
//       //                    padding: const EdgeInsets.all(9),
//       //                   child: const Text('13 Feb'),
//       //                   ),
//       title: const Text('fuel',style: TextStyle(fontWeight: FontWeight.w400),),
//       subtitle: const Text('10 Feb'),
//       trailing: Column( 
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: const [
//                                       Text('+₹500', 
//                                             style: TextStyle(
//                                                             color: Colors.red,
//                                                             fontSize: 18,
//                                                             ),
//                                           ),
//                                       Text('12:00 PM',
//                                              style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 12,
//                                                             ),
//                                           ),
                               
                               
//                                       ],
//                        ),
//   ),
//   const Divider(height: 0.5,thickness: 1,),
//   ListTile(
//     onTap: (){
//                                                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DetailedTransaction()),
//             );
//                                                            }, 

//                    leading: CircleAvatar(child: Icon(Icons.arrow_downward_outlined,),
//                                                            backgroundColor:Colors.red,),                                        
      // leading: Container(
                                        
      //                    width: 50,
      //                    height: 50,
      //                    color: Colors.red,
      //                    padding: const EdgeInsets.all(9),
      //                   child: const Text('13 Feb'),
      //                   ),
//       title: const Text('fuel',style: TextStyle(fontWeight: FontWeight.w400),),
//       subtitle: const Text('8 Feb'),
//       trailing: Column( 
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: const [
//                                       Text('+₹500', 
//                                             style: TextStyle(
//                                                             color: Colors.red,
//                                                             fontSize: 18,
//                                                             ),
//                                           ),
//                                       Text('12:00 PM',
//                                              style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 12,
//                                                             ),
//                                           ),
                               
                               
//                                       ],
//                        ),
//   ),

// ],   
// )
     
//      ),
//     );
  