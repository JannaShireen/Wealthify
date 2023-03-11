
import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/widgets/list_view_all.dart';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



              
class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    // TODO: implement buildResults

    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: ((BuildContext context, List<TransactionModel> transactionList,
          Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = transactionList[index];
          //  print('category name: ${data.category.name.toString().toLowerCase().contains(query.toLowerCase())}');
            //print('Purpose: ${data.purpose}');
         //   print('search keyword ${data.category.toString().toLowerCase().contains(query.toLowerCase()) || data.purpose.toLowerCase().contains(query.toLowerCase())}');
            if (data.category.name.toString().toLowerCase().contains(query.toLowerCase()) || data.purpose.toLowerCase().contains(query.toLowerCase()))
                {
                  
              
              return Column(
                children: [
                  ListTile(
                    
                    title: Text(data.amount.toString()),
                    leading: CircleAvatar(
                               radius: 50,
                                  
                               backgroundColor: data.type == CategoryType.income ? Colors.green : Colors.red,
                                child: Text(
                                    
                                   parseDate(data.date),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                    subtitle: Text(data.category.name),
                   
                    ),
                  
                  const Divider()
                ],
              );
             
              
            } else {
              return Container(
                child: Text('No results'),
              );
              
              }
          },
          itemCount: transactionList.length,
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: ((BuildContext context, List<TransactionModel> transactionList,
          Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = transactionList[index];
            if (data.category.toString().toLowerCase().contains(query.toLowerCase()) || data.purpose.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                   
                    title: Text(data.amount.toString()),
                    leading: CircleAvatar(
                               radius: 50,
                                  
                               backgroundColor: data.type == CategoryType.income ? Colors.green : Colors.red,
                                child: Text(
                                    
                                  parseDate(data.date),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                trailing: Text(data.purpose),
                   subtitle: Text(data.category.name),
                  ),
                  
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: transactionList.length,
        );
      }),
    );
    
  }
}
String parseDate(DateTime date){

  final _date= DateFormat.MMMd().format(date);
  final _splitedDate= _date.split(' ');
 return  '${_splitedDate.last}\n${_splitedDate.first}';
  //return '${date.day}\n${date.month}';
}

