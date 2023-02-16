import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchbyDate extends StatelessWidget {
  const SearchbyDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold (
      body: SafeArea(
        child: Center(child: Text('Search by date'))),
    );
  }
}