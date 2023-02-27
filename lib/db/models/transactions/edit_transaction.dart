import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditTransaction extends StatefulWidget {
  const EditTransaction({
     Key? key,
    required this.obj,
    this.id,
  }) :
    super(key: key});

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}