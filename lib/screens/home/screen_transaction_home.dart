import 'package:cash_track/db/db_category_functions.dart';
import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/category/screen_category.dart';
import 'package:cash_track/screens/widgets/add_transaction/add_expense_transaction.dart';
import 'package:cash_track/screens/widgets/add_transaction/add_income_transaction.dart';
import 'package:cash_track/screens/widgets/list_view_all.dart';
import 'package:cash_track/screens/search_screens/by_category.dart';


import 'package:cash_track/screens/search_screens/by_date.dart';
import 'package:cash_track/screens/search_screens/by_description.dart';
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
  SearchItems? selectedMenu;
  // int? _value = 1;

  List<String> items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'November',
    'December'
  ];
  String? selectedMonth = 'January';
  //bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    return Scaffold(
      backgroundColor: Color.fromARGB(208, 117, 44, 117),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: circularMenu(context),
     
      // FloatingActionButton(
      //   backgroundColor: Color.fromARGB(255, 99, 9, 81),
      //   onPressed: () {

      //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
      //       return AddTransaction();
      //     }
      //     ));
      //     const AddTransaction();

      //     // print('Add something');
      //   },
      //   child: const Icon(Icons.add),
      // ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 69, 8, 57),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<SearchItems>(
            initialValue: selectedMenu,
            onSelected: (value) {
              if (value == SearchItems.categories) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchbyCategory(),
                ));
              } else if (value == SearchItems.date) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchbyDate(),
                ));
              } else if (value == SearchItems.description) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchbyDescription(),
                ));
              }
            },
            icon: const Icon(Icons.search),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SearchItems.categories,
                child: Text('Categories'),
              ),
              const PopupMenuItem(
                value: SearchItems.date,
                child: Text('Date'),
              ),
              const PopupMenuItem(
                value: SearchItems.description,
                child: Text('Description'),
              ),
            ],
          ),
        ],
        title: const Text(
          'CashTrack',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        //  padding: const EdgeInsets.only(top:25,left: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 240, 207, 207),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: DropdownButton<String>(
                      value: selectedMonth,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ))
                          .toList(),
                      onChanged: (item) =>
                          setState(() => selectedMonth = item),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Account Balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 74, 73, 73),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    '₹9400',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            color: Colors.green,
                          ),
            
                          padding: const EdgeInsets.all(1.0),
                          margin: const EdgeInsets.only(
                            left: 10,
                            bottom: 20,
                          ),
                          height: 60,
                          width: 40,
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Income',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '₹5000',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.only(
                            left: 30,
                            bottom: 20,
                          ),
                          height: 60,
                          width: 50,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Expense',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹1200',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 2, thickness: 5,),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Transaction',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListViewAllTransactions()),
                              );
                            },
                            child: const Text('See All')),
                      ],
                    ),
                  ),
            
                 
                 
                ],
              ),
            ),
             Expanded(
                    child: Container(
                      color: Color.fromARGB(255, 244, 128, 166),
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
                               trailing: IconButton(
                onPressed: (){
        
          showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Confirm"),
                  content: const Text("Are you sure you want to delete?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                       
                        
        
                      },
                      child: Container(
                        color: Color.fromARGB(255, 232, 247, 232),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Color.fromARGB(255, 240, 209, 230),
                        padding: const EdgeInsets.all(14),
                        child: const Text("No"),
                      ),
                    ),
                  ],
                ),
              );
              }, 
                icon: const Icon(Icons.delete)), 
                             
                              ),
                            );
        
                        },
                          
                        
                        separatorBuilder: (ctx, index) {
                          return const Divider(height: 5,
                          thickness: 4,);
                        },
                        itemCount: newList.length > 3 ? 3 : newList.length,
                      );
                       }),
                    ),
                  )
          ],
        ),
      )),
    );
  }
  Widget circularMenu(BuildContext context ){
        return CircularMenu
        (alignment: Alignment.bottomCenter,
        
           toggleButtonColor: Color.fromARGB(255, 99, 9, 81),
          items: [
        CircularMenuItem(
            icon: Icons.arrow_upward_rounded,
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=> const ScreenAddIncomeTransaction()));
              // callback
            }),
        CircularMenuItem(
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
 return  '${_splitedDate.last}\n${_splitedDate.first}';
  //return '${date.day}\n${date.month}';
}
  
}


 

