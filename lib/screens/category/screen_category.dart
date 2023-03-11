import 'package:cash_track/db/db_category_functions.dart';
import 'package:cash_track/screens/category/category_add_popup.dart';
import 'package:cash_track/screens/category/expense_category_list.dart';
import 'package:cash_track/screens/category/income_category_list.dart';
import 'package:flutter/material.dart';
class Data {
  String label;
  Color color;

  Data(this.label, this.color);
}


class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<ScreenCategory> with SingleTickerProviderStateMixin{
 // bool isGridView=true;
  List<Widget> chips = [];
 int? _curIndex=0;
  //  int _selectedIndex=0;
   final List<Data> _choiceChipsList = [
    Data("Income", Colors.green),
    Data("Expense", Colors.red),
   
  ];
 @override
   void initState() {
    
    CategoryDB().refreshUI();
    
  //   _tabController=
  //   // TODO: implement initState
      super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      
      length: 2,
       child: Scaffold(
        backgroundColor: Color.fromARGB(255, 205, 204, 204),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 11, 6, 6),
              title: const Text('Categories',style: TextStyle(color: Colors.white),),
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
                    icon: Icon(Icons.arrow_upward),
                    text: 'Income',
                  ),
                  Tab(
                    icon: Icon(Icons.arrow_downward),
                    text: 'Expense',
                  )
                ]
              ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(

                backgroundColor: Colors.black,
                
                onPressed: (){
                 showCategoryPopup(context);

                              // print('Add something');
                      },
                 child: const Icon(Icons.add),
                                      ) ,
         
         

        body:  const TabBarView(children: [
          IncomeCategoryList(),
          ExpenseCategoryList(),



        ]),
       ),

    );
  
  }
}