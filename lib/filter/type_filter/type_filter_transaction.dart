import 'package:wealthify/transactions/list_view_all.dart';
import 'package:flutter/material.dart';

class TypeFilterClass extends StatelessWidget {
  const TypeFilterClass({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        itemBuilder: ((context) => [
              PopupMenuItem(
                value: 1,
                onTap: () => showCategory.value = "All",
                child: const Text("All"),
              ),
              PopupMenuItem(
                value: 2,
                onTap: () => showCategory.value = "Income",
                child: const Text("Income"),
              ),
              PopupMenuItem(
                value: 3,
                onTap: () => showCategory.value = "Expense",
                child: const Text("Expense"),
              ),
            ]),
        child: const Icon(
          Icons.filter_list_sharp,
          size: 30,
          // shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
        ));
  }
}