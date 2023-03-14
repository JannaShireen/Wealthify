

import 'package:wealthify/db/db_functions/transaction_functions.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:wealthify/transactions/list_view_all.dart';

import '../../transactions/transaction.list.dart';

class DAteFilterTransaction extends StatefulWidget {
  const DAteFilterTransaction({
    Key? key,
  }) : super(key: key);

  @override
  State<DAteFilterTransaction> createState() => _DAteFilterTransactionState();
}

class _DAteFilterTransactionState extends State<DAteFilterTransaction> {
  DateTime? startDate,endDate;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: const Icon(
        Icons.calendar_view_day_rounded,
        // size: 0,
        // shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
      ),
      itemBuilder: (ctx) => [
        PopupMenuItem(
          value: 1,
          child: const Text(
            "All",
          ),
          onTap: () {
            overViewListNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Today",
          ),
          onTap: () {
            overViewListNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
            overViewListNotifier.value = overViewListNotifier.value
                .where((element) =>
                    element.date.day == DateTime.now().day &&
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          },
        ),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Yesterday",
            ),
            onTap: () {
              overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.date.day == DateTime.now().day - 1 &&
                      element.date.month == DateTime.now().month &&
                      element.date.year == DateTime.now().year)
                  .toList();
            }),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Month",
            ),
            onTap: () {
              overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.date.month == DateTime.now().month &&
                      element.date.year == DateTime.now().year)
                  .toList();
            }),
            PopupMenuItem(
            value: 2,
            child: const Text(
              "Date Range",
            ),
            onTap: () {
               showCustomDateRangePicker(
                    context,
                    dismissible: true,
                    minimumDate: DateTime(2010),
                    maximumDate: DateTime.now(),
                    endDate: endDate,
                    startDate: startDate,
                    onApplyClick: (start, end) {
                      setState(() {
                        endDate = end;
                        startDate = start;
                      });
                    },
                    onCancelClick: () {
                      setState(() {
                        endDate = null;
                        startDate = null;
                      });
                    },
                  );
                  //print('start date $startDate , end date $endDate');

                  overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.date.isAfter(startDate!) && element.date.isBefore(endDate!))
                  .toList();
                  startDate=null;
                  endDate=null;

            }),
            
      ],
    );
  }
}