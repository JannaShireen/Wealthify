 
 
 
 
 
 
 
 
 import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/widgets/edit_transaction.dart/edit_expense_transaction.dart';
import 'package:cash_track/screens/widgets/edit_transaction.dart/edit_income_transaction.dart';
import 'package:cash_track/screens/widgets/list_view_all.dart';
import 'package:cash_track/screens/widgets/slidable/slidable_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../search_screens/search_screen.dart';

ValueNotifier<List<TransactionModel>> overViewListNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);
    class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    return ValueListenableBuilder(
      //here transaction list notifier used to notify the db transaction actions
      //,according to the date .,overview List notifier is used for the date filter
      valueListenable: overViewListNotifier,
      builder: (BuildContext context, newList, Widget? _) {
        //we need to filter the transaction according to the transaction type ,
        //so i added a value notifier for the category type called "showCategory" 
         return ValueListenableBuilder(
            valueListenable: showCategory,
            builder: (context, showCategoryList, child) {
              //here we building the list using displayList list
              var displayList = [];
              //here if the showCategory notifier value is income (which will be changed based on the changes in popMenuItem )
              if (showCategory.value == "Income") {
                //here i am creating an empty list for the transaction,
                //so i can pick the income only through the where function
                List<TransactionModel> incomeTransactionList = [];
                //here i converting the element into list using toList function
                incomeTransactionList = newList
                    .where((element) => element.type == CategoryType.income)
                    .toList();
                //assigning the list into displayList which is the list i declared above
                displayList = incomeTransactionList;
              } else if (showCategory.value == "Expense") {
                List<TransactionModel> expenseTransactionList = [];
                expenseTransactionList = newList
                    .where((element) => element.type == CategoryType.expense)
                    .toList();
                displayList = expenseTransactionList;
              } else {
                displayList = newList;
              }
 
 
             
   return displayList.isEmpty?
                            SingleChildScrollView(
                              child: Center(
                                child: Text(
                                  'No transactions added yet'),)) 
                                                        
                             :ListView.separated(
                            padding: const EdgeInsets.all(5),
                            itemBuilder: (ctx, index) {
                              final transaction= displayList[index];
     
                              return  SlidableTransaction(transaction: transaction);
                            },
                            
     
                            separatorBuilder: (ctx, index) {
                              return const Divider(height: 5,
                              thickness: 5,);
                            },
                            itemCount: displayList.length);
     
           
            });
      });
                

  }
    }
 