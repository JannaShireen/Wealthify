import 'package:cash_track/db/models/category_model.dart/category_model.dart';

import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:cash_track/screens/widgets/list_view_all.dart';
import 'package:cash_track/screens/widgets/transaction.list.dart';
import 'package:flutter/material.dart';



class SearchField extends StatelessWidget {
  SearchField({super.key});
  final TextEditingController _searchQueryController = TextEditingController();
 // ValueNotifier<List<TransactionModel>> overViewListNotifier =
   // ValueNotifier(TransactionDB.instance.transactionListNotifier.value);
  @override
  Widget build(BuildContext context) {
    
     
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: _searchQueryController,
            onChanged: (query) {print(query);
              searchResult(query);
              // overViewListNotifier.notifyListeners();
            },
            decoration: InputDecoration(
                hintText: 'Search..',
                border: InputBorder.none,
                icon: const Icon(
                  Icons.search,
                  // color: textClr,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      overViewListNotifier.value =
                          TransactionDB.instance.transactionListNotifier.value;
                      _searchQueryController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      // color: Colors.black,
                    ))),
          ),
        ),
      ),
    );
  }

  searchResult(String query) {
    debugPrint(query);
    if (query.isEmpty) {
      overViewListNotifier.value =
          TransactionDB.instance.transactionListNotifier.value;
    } else {
     // overViewListNotifier.value.map((e) => debugPrint(e.purpose));
    
      overViewListNotifier.value = overViewListNotifier.value
          .where((element) =>
           element.category.name.toString()
              .toLowerCase()
              .contains(query.trim().toLowerCase()))
          .toList() ;
          
      

          //data.category.name.toString().toLowerCase().contains(query.toLowerCase()) || data.purpose.toLowerCase().contains(query.toLowerCase())
    }
  }
}