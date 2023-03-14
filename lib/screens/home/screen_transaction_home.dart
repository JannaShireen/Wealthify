import 'dart:ffi';

import 'package:wealthify/db/db_functions/income_and_expense.dart';
import 'package:wealthify/db/db_functions/transaction_functions.dart';
import 'package:wealthify/db/models/category_model/category_model.dart/category_model.dart';
import 'package:wealthify/db/models/transaction_model/transaction_model.dart';
import 'package:wealthify/insights/widgets/screen_all.dart';
import 'package:wealthify/db/db_functions/db_category_functions.dart';
import 'package:wealthify/screens/category/screen_category.dart';
import 'package:wealthify/screens/widgets/add_transaction/add_expense_transaction.dart';
import 'package:wealthify/screens/widgets/add_transaction/add_income_transaction.dart';
import 'package:wealthify/transactions/list_view_all.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum SearchItems { categories, date, description }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      incomeAndExpense();
      overViewGraphNotifier.value =
          TransactionDB.instance.transactionListNotifier.value;
          //incomeTotal.notifyListeners(); 
  //          expenseTotal.notifyListeners();
  // incomeTotal.notifyListeners();
  // totalBalance.notifyListeners();

    });
  }
 double? expenseTotal;
 double? incomeTotal;
double? totalBalance;
  
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
   
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 204, 204),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: circularMenu(context),
     
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 6, 6),
        automaticallyImplyLeading: false,
        centerTitle: true,
       
        
        title: const Text(
          'Wealthify',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
            children: [
             SizedBox(
            width: double.infinity,
            height: 280,
            child:
        ValueListenableBuilder(valueListenable:   TransactionDB.instance.transactionListNotifier,
         builder: (context,List<TransactionModel> value, _) {
          incomeTotal=0;
          expenseTotal=0;
          totalBalance=0;
          TransactionDB.instance.transactionListNotifier.value.forEach((element) 
          {if(element.type==CategoryType.income)
          {incomeTotal=incomeTotal!+element.amount;
          }
          else{
             {expenseTotal=expenseTotal!+element.amount;
          }
          }});
          totalBalance=incomeTotal!-expenseTotal!;


          return  Stack(
              children: [
                Container(
                  
                  padding: const EdgeInsets.only(right: 15),
                  decoration: const BoxDecoration(
                    
                     borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    //color: Color.fromARGB(255, 240, 207, 207),
                  ),
                  
                  width: double.infinity,
                  height: 150,
                ),
                Positioned(
                  top: 20,
                  left: 30,
                  right: 30,
                  child: Card(
                    color: Colors.black26,
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: 250,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        border: Border.all(color: Colors.transparent),
                       
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                  
             Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                      
                         Text(
                           totalBalance! < 0 ? 'Lose' : 'Total',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 74, 73, 73),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                         Text(
                        '₹${totalBalance!.abs().toString()}' ,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                        children: [
                          Expanded(
                            child: Container(
                              
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                color: Colors.green,
                              ),
                
                              padding: const EdgeInsets.all(1.0),
                              margin: const EdgeInsets.only(
                                left: 10,
                                bottom: 20,
                                right: 10
                              ),
                              height: 60,
                              width: 30,
                              // color: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  [
                                  const Text(
                                    'Income',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${incomeTotal!}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              padding: const EdgeInsets.all(1.0),
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 20,
                              ),
                              height: 60,
                              width: 30,
                              // color: Colors.red,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    const Text(
                                      'Expense',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '₹${expenseTotal!.toString()}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
         );
          
        },),
             ),



                        
                SizedBox(height: 15,),
                      Divider(height: 2, thickness: 3,),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Transactions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             ListViewAllTransactions()),
                                  );
                                },
                                child: const Text('See All',
                                style: TextStyle(color: Colors.blue),)),
                          ],
                        ),
                      ),
                
                     
                     
                    
                
                
            
          
             Expanded(
                    child: Container(
                      color: Colors.black26,
                      height: 80,
                      child: ValueListenableBuilder(
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
                            color: Colors.black26,
                                    
                            elevation: 0,
                            child: ListTile(
                              leading: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 50,
          
            child: Icon(
              _value.type == CategoryType.income
                  ? Icons.arrow_upward_outlined
                  : Icons.arrow_downward_outlined,
              color: _value.type == CategoryType.income
                  ? Color.fromARGB(255, 2, 155, 43)
                  : Color.fromARGB(255, 195, 0, 0),
            ),
          ),
                              // CircleAvatar(
                              //   radius: 50,
                                
                              //   backgroundColor: _value.type == CategoryType.income ? Colors.green : Colors.red,
                              //   child: Text(
                              //     parseDate(_value.date),
                              //     textAlign: TextAlign.center,
                              //   ),
                              // ),
                              title: Text('RS ${_value.amount}'),
                              subtitle: Text(_value.category.name),
                               trailing: Text(
            parseDate(_value.date),
          ),
                              // 
                             
                              ),
                            );
        
                        },
                          
                        
                        separatorBuilder: (ctx, index) {
                          return const Divider(height: 4,
                          thickness: 2,);
                        },
                        itemCount: newList.length > 4 ? 4 : newList.length,
                      );
                       }),
                    ),
                  )
          ],
        ),
      ),
      );
    
  }
  Widget circularMenu(BuildContext context ){
        return CircularMenu
        (
          
          alignment: Alignment.bottomCenter,
        
           toggleButtonColor: Colors.black,
          items: [
        CircularMenuItem(
          color: Colors.black,
            icon: Icons.arrow_upward_rounded,
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=> const ScreenAddIncomeTransaction()));
              // callback
            }),
        CircularMenuItem(
          color: Colors.black,
            icon: Icons.arrow_downward_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ScreenAddExpenseTransaction()),
              );
              //callback
            }),
        CircularMenuItem(
          color: Colors.black,
            icon: Icons.category_rounded,
            onTap: () {
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => const ScreenCategory()));
              //callback
            }),
            ]
            );
 }

String parseDate(DateTime date){

  final _date= DateFormat.MMMd().format(date);
  final _splitedDate= _date.split(' ');
 return  '${_splitedDate.last} ${_splitedDate.first}';
  //return '${date.day}\n${date.month}';
}
  
}


 

