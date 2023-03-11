import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/filter/date_filter/date_filter_transaction.dart';
import 'package:cash_track/db/models/transactions/filter/type_filter/type_filter_transaction.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';


import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/home/screen_transaction_home.dart';
import 'package:cash_track/screens/search_screens/search_field.dart';
import 'package:cash_track/screens/widgets/edit_transaction.dart/edit_expense_transaction.dart';
import 'package:cash_track/screens/widgets/edit_transaction.dart/edit_income_transaction.dart';
import 'package:cash_track/screens/widgets/view_detailed_transaction.dart';
import 'package:flutter/material.dart';
import 'package:cash_track/screens/category/screen_category.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../db/models/transactions/transaction_db.dart';
import 'transaction.list.dart';

ValueNotifier showCategory = ValueNotifier('All');
class ListViewAllTransactions extends StatefulWidget {
  const ListViewAllTransactions({

    super.key});

  @override
  State<ListViewAllTransactions> createState() => _ListViewAllTransactionsState();
}

class _ListViewAllTransactionsState extends State<ListViewAllTransactions> {
  ValueNotifier showCategory = ValueNotifier('All');
   double expenseTotal = 0;
  double incomeTotal = 0;
  
  @override
  void initState() {
     overViewListNotifier.value =
        TransactionDB.instance.transactionListNotifier.value;
   //ValueNotifier<List<TransactionModel>> overViewListNotifier =
   // ValueNotifier(TransactionDB.instance.transactionListNotifier.value);
    
    super.initState();
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 204, 204),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 6, 6),
        centerTitle: true,
        title: const Text(
          'All Transactions',
        ),
        actions: const [
          DAteFilterTransaction(),
          SizedBox(
            width: 10,
          ),
          TypeFilterClass(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          SearchField(),
          const Expanded(
            child: TransactionList(),
          ),
        ],
      ),
    );
  }
}
 
//       