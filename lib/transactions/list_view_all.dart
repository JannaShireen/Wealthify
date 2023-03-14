
import 'package:wealthify/db/db_functions/transaction_functions.dart';
import 'package:wealthify/filter/date_filter/date_filter_transaction.dart';
import 'package:wealthify/filter/type_filter/type_filter_transaction.dart';
import 'package:wealthify/screens/search/search_field.dart';
import 'package:flutter/material.dart';
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