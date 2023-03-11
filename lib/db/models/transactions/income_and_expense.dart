import 'package:cash_track/Insights/widgets/screen_all.dart';
import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';

ValueNotifier expenseTotal = ValueNotifier(0.0);
ValueNotifier incomeTotal = ValueNotifier(0.0);

ValueNotifier totalBalance = ValueNotifier(0.0);
void incomeAndExpense() {
  incomeTotal.value = 0;
  expenseTotal.value = 0;
  totalBalance.value = 0;
  final List<TransactionModel> value =
      TransactionDB.instance.transactionListNotifier.value;

  for (int i = 0; i < value.length; i++) {
    if (CategoryType.income == value[i].category.type) {
      incomeTotal.value = incomeTotal.value + value[i].amount;
    } else {
      expenseTotal.value = expenseTotal.value + value[i].amount;
    }
  }
  totalBalance.value = incomeTotal.value - expenseTotal.value;
  overViewGraphNotifier.notifyListeners();
}
