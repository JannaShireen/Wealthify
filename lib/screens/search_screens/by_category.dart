import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchbyCategory extends StatefulWidget {
  const SearchbyCategory({super.key});

  @override
  State<SearchbyCategory> createState() => _SearchbyCategoryState();
}

class _SearchbyCategoryState extends State<SearchbyCategory> {
  List<String> items=['Income','Expense'];
  String? _selectedItem='Income';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
     appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 69, 8, 57),
          leading: const Icon(Icons.search),
              title: const Text('Search by Category',style: TextStyle(color: Colors.white),),
              centerTitle: true,
     ),

     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [Center(
           child: DropdownButton<String>(
            items: items.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item,style: TextStyle(fontSize: 24)),
              ))
              .toList(),
            value: _selectedItem,
             onChanged: (item)=>
             setState(() {
               _selectedItem=item;
             }),
             ),
         ),
         ]
       )
       ,
        
       ),
     );
    
  }
 
}