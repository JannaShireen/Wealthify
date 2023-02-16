import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchbyDescription extends StatefulWidget {
  const SearchbyDescription({super.key});

  @override
  State<SearchbyDescription> createState() => _SearchbyDescriptionState();
}

class _SearchbyDescriptionState extends State<SearchbyDescription> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Search by description'))),
    );
  }
}