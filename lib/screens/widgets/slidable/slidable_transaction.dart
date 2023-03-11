import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/category_model.dart/category_model.dart';

import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/widgets/edit_transaction.dart/edit_expense_transaction.dart';
import 'package:cash_track/screens/widgets/edit_transaction.dart/edit_income_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

import '../../../db/models/category_model.dart/category_model.dart';

class SlidableTransaction extends StatelessWidget {
  const SlidableTransaction({super.key,required this.transaction});

  final TransactionModel transaction;

    String parseDateTime(DateTime date) {
    final dateFormatted = DateFormat.MMMMd().format(date);
    //using split we split the date into two parts
    final splitedDate = dateFormatted.split(' ');
    //here _splitedDate.last is second word that is month name and other one is the first word
    return "${splitedDate.last}  ${splitedDate.first} ";
  }
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: ((context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) {
                  if (transaction.type==CategoryType.expense){
                          return EditExpenseTransaction(
                          obj: transaction,
                  );
                  }
                  else
                   {
                     return EditIncomeTransaction(
                    obj: transaction,
                  );
                   }
                 
                }),
              ),
            );
          }),
          icon: Icons.edit,
          foregroundColor: const Color(0xFF2E49FB),
        ),
        SlidableAction(
          onPressed: ((context) {
            showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    content: const Text(
                      'Do you want to Delete.',
                    ),
                    actions: [
                      TextButton(
                          onPressed: (() {
                            TransactionDB.instance
                                .deleteTransaction(transaction);
                            Navigator.of(context).pop();
                          }),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                      TextButton(
                        onPressed: (() {
                          Navigator.of(context).pop();
                        }),
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  );
                }));
          }),
          icon: Icons.delete,
          foregroundColor: Colors.red,
        ),
      ]),
      child: Card(
        color: Colors.black26,
        elevation: 3,
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          // side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          
          onLongPress: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 50,
          
            child: Icon(
              transaction.type == CategoryType.income
                  ? Icons.arrow_upward_outlined
                  : Icons.arrow_downward_outlined,
              color: transaction.type == CategoryType.income
                  ? Color.fromARGB(255, 2, 155, 43)
                  : Color.fromARGB(255, 195, 0, 0),
            ),
          ),
          title: Text(
            '₹ ${transaction.amount}',
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            transaction.category.name,
          ),
          trailing: Text(
            parseDateTime(transaction.date),
          ),
        ),
      ),
    );
  }
}

  