import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TRANSACTION_DB_NAME= 'transaction-db';

abstract class TransactiondbFunctions{
  void addTransaction(TransactionModel obj);
  Future<List<TransactionModel>>getAllTransactions();
}

class TransactionDB implements TransactiondbFunctions {

   TransactionDB._internal();
  static TransactionDB instance=TransactionDB._internal();

  factory TransactionDB(){
    return instance;
  }

  ValueNotifier<List<TransactionModel>>transactionListNotifier= ValueNotifier([]);
 @override
  Future<void> addTransaction(TransactionModel obj) async {

    final _db= await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id , obj);
    // TODO: implement addTransaction
  }
  
Future<void> refresh() async{
  final _list=await getAllTransactions();
  _list.sort((first,second)=>second.date.compareTo(first.date));
  transactionListNotifier.value.clear();
  transactionListNotifier.value.addAll(_list);
  transactionListNotifier.notifyListeners();
}

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    
     final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
     return _db.values.toList(); 

  }
}
 