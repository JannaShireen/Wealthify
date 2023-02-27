import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
class Data {
  String label;
  Color color;

  Data(this.label, this.color);
}
class InsightPage extends StatefulWidget {
  const InsightPage({super.key});

  @override
  State<InsightPage> createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
   
      List<Widget> chips = [];
      int? _curIndex=0;
  //  int _selectedIndex=0;
      final List<Data> _choiceChipsList = [
       Data("All", Colors.lightBlue),
      Data("Income", Colors.red),
      Data("Expense", Colors.red),
   
  ];
 @override
  // void initState() {
  //   _tabController=
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      
      length: 3,
       child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 69, 8, 57),
              title: const Text('Insights',style: TextStyle(color: Colors.white),),
              centerTitle: true,
              bottom:  TabBar(
                dividerColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                onTap:(value) {
                  _curIndex=value;
                  // print(value);
                },
               
                
                tabs: const  [
                  Tab(
                    
                    text: 'All',
                  ),
                  Tab(
                    
                    text: 'Income',
                  ),
                   Tab(
                    
                    text: 'Expense',
                  ),
                ]
              ),
        ),
       
            

        body:  const TabBarView(children: [
          MaterialApp(debugShowCheckedModeBanner: false, home: Center(child: Text('Pie Chart of All'),),),
          MaterialApp(debugShowCheckedModeBanner: false,home: Center(child: Text('Pie Chart of Income '),),),
          MaterialApp(debugShowCheckedModeBanner: false,home: Center(child: Text('Pie Chart of Expense'),),),
          


        ]),
       ),

    );
    // 
    // 
    // Scaffold(
    //         appBar: AppBar(
    //               backgroundColor: const Color.fromARGB(255, 69, 8, 57),
    //               title: const Text('Categories',style: TextStyle(color: Colors.white),),
    //               centerTitle: true,
                  
    //         ),
    //         body:
    
        
    //           // Row(
    //           //   children: [
    //           //     ChoiceChip(label: Text('Expense'),labelPadding: const EdgeInsets.all(2),labelStyle: TextStyle(color: Colors.black), selected: ),
    //           //   ],
    //           // ),
            
    // );
  }
}
  
 