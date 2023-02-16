import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchbyCategory extends StatefulWidget {
  const SearchbyCategory({super.key});

  @override
  State<SearchbyCategory> createState() => _SearchbyCategoryState();
}

class _SearchbyCategoryState extends State<SearchbyCategory> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    
     body: SafeArea(
      child: Center(child: Text('Search by category'))),
    );
  }
}