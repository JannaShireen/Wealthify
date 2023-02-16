import 'package:cash_track/screens/search_screens/by_category.dart';
import 'package:cash_track/screens/search_screens/by_date.dart';
import 'package:cash_track/screens/search_screens/by_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum SearchItems  {categories,date,description}

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchItems? selectedMenu;
  int? _value = 1;

  List<String> items= ['January','February','March','April','May','June','July','August','September','November','December'];
  String? selectedMonth = 'January';
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(208, 184, 146, 183),
      appBar: AppBar(
                 backgroundColor: Color.fromARGB(255, 69, 8, 57),
                 actions: [
                  PopupMenuButton<SearchItems>(
                    
                    initialValue: selectedMenu,
                    onSelected: (value) {
                      if (value == SearchItems.categories){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SearchbyCategory(),
                        ));
                      } else if (value == SearchItems.date){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SearchbyDate(),
                          ));
                      } else if (value == SearchItems.description){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchbyDescription(),
                          ));
                      }
                      },
                    icon: const Icon(Icons.search),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: SearchItems.categories,
                        child: Text('Categories'),
                        ),
                       const  PopupMenuItem(
                        value: SearchItems.date,
                          child: Text('Date'),
                          ),
                       const  PopupMenuItem(
                        value: SearchItems.description,
                          child: Text('Description'),
                          ),

                    ],
                  ),
                 ],
                 title: const Text('CashTrack',
                          style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                ),
                          ),
                     ),
      body: SafeArea(
                child: Padding(
                               padding: const EdgeInsets.all(10),
                               child: Column(
                                      children: [
                                              Container(
                                                width: double.infinity,
                                                
                                                
                                                
                                                color: Color.fromARGB(255, 187, 162, 162),
                                                child: Column(
                                                  children: [
                                              
                                                    Center(
                                                      child: DropdownButton<String>(
                                                        value: selectedMonth,
                                                        items: items
                                                        .map((item) => DropdownMenuItem<String>(
                                                          value: item,
                                                          child: Text(item, style: const TextStyle(fontSize: 14,
                                                          fontWeight: FontWeight.w600,)),
                                                          ))
                                                          .toList(),
                                                        onChanged: (item) => setState(() => selectedMonth=item),
                                                        
                                                      ),
                                                    ),
                                                   const SizedBox(height: 10,),
                               
                                                   const Text('Account Balance',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12, 
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.w400),
                                                          ),
                                                    const Text('₹9400',
                                                       textAlign: TextAlign.center,
                                                       style: TextStyle(fontSize: 25,
                                                                  fontWeight: FontWeight.w300,
                                                                  color: Colors.black),
                                                                  ),
                               
                                                    const SizedBox(height: 5,),
                                                     Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,   
                                                         children: 
                                                          [
                                                            Container(
                                                              decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(7),),
                                                                color: Colors.green,
                               
                                                              ),
                                       
                                                                 
                                                                     
                                                              padding: const EdgeInsets.all(1.0),
                                                              margin: const EdgeInsets.only(left: 10,bottom: 20,),
                                                              height: 60,
                                                              width: 90,
                                                              // color: Colors.green,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: const [
                                                                        
                                                                        Text('Income',
                                                                        style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.white,
                                                                        ),),
                                                                        Text('₹5000',
                                                                        style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.white,
                                                                        ),),
                                                                        
                                                                ],
                                                              ),
                                                              
                                                            ),
                               
                                                            Container(
                                                              decoration: const BoxDecoration(
                                                                color: Colors.red,
                                                                borderRadius: BorderRadius.all(Radius.circular(7),),
                                                              ),
                                                              padding: const EdgeInsets.all(1.0),
                                                              margin: const EdgeInsets.only(left: 30,bottom: 20,),
                                                              height: 60,
                                                              width: 90,
                                                              // color: Colors.red,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: const [
                                                                        
                                                                        Text('Expense',
                                                                        style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.white,
                                                                        ),),
                                                                        Text('₹1200',
                                                                        style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.white,
                                                                        ),),
                                                                        
                                                                ],
                                                              ),
                                                              
                                                            ),
                               
                               
                                                                   
                               
                                                                   
                                                                 ],
                                                     )
                                                  ],
                                                    
                                                ),
                               
                                              ),
                               
                                                         const SizedBox(height: 4,),
                                                         Container(
                                                           width: double.infinity,
                                                           color: const Color.fromARGB(255, 187, 162, 162),
                                                           child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:   [
                                            const Padding(
                                              
                                             padding: EdgeInsets.only(left:5),
                                             child: Text('Spend frequency',
                                                  style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                  ),
                                              ),
                                           ),
                                            Image.asset('assets/images/Graph.png',
                                                    width: double.infinity,),
                                                    
                                            Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                    ChoiceChip(
                                                      label: const Text('Today'), 
                                                      selected: _isSelected,
                                                      backgroundColor: Color.fromARGB(255, 166, 212, 250),
                                                     
                                                      selectedColor: Colors.green,
                                                      onSelected:(newBooleanValue) {
                                                        setState(() {
                                                          _isSelected=newBooleanValue;
                                                          
                                                        });
                                                      },
                                                      ),
                                                      ChoiceChip(
                                                      label: const Text('Week'), 
                                                      selected: _isSelected,
                                                      backgroundColor: Color.fromARGB(255, 166, 212, 250),
                                                     
                                                      selectedColor: Colors.green,
                                                      onSelected:(newBooleanValue) {
                                                        setState(() {
                                                          _isSelected=newBooleanValue;
                                                          
                                                        });
                                                      },
                                                      ),
                                                      ChoiceChip(
                                                      label: const Text('Month'), 
                                                      backgroundColor: Color.fromARGB(255, 166, 212, 250),
                                                      selected: _isSelected,
                                                     
                                                      selectedColor: Colors.green,
                                                      onSelected:(newBooleanValue) {
                                                        setState(() {
                                                          _isSelected=newBooleanValue;
                                                          
                                                        });
                                                      },
                                                      ),
                                                      ChoiceChip(
                                                      label: const Text('Year'), 
                                                      selected: _isSelected,
                                                      backgroundColor: Color.fromARGB(255, 166, 212, 250),
                                                     
                                                      selectedColor: Colors.green,
                                                      onSelected:(newBooleanValue) {
                                                        setState(() {
                                                          _isSelected=newBooleanValue;
                                                          
                                                        });
                                                      },
                                                      ),
                                              ],
                                            )
                               
                                            
                                          ],
                               
                                                           ),
                               
                                                         ),
                               
                                                         Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                           children: [
                                const Text('Recent Transaction',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                                         
                                   ChoiceChip(
                                                      label: const Text('See All',
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                    color: Color.fromARGB(255, 90, 1, 163)),), 
                                                      selected: _isSelected,
                                                      backgroundColor: Color.fromARGB(255, 101, 158, 215),
                                                     
                                                      selectedColor: Colors.green,
                                                      onSelected:(newBooleanValue) {
                                                        setState(() {
                                                          _isSelected=newBooleanValue;
                                                          
                                                        });
                                                      },
                                                      ),
                               
                                                   ],
                                                         ),
                                                         Expanded(child: Container(child:                          
                                 ListView(
                                         children: [
                                               ListTile(
                                                             
                                                   leading: Container(
                                                                                                  
                                                        width: 50,
                                                        height: 50,
                                                        color: Colors.red,
                                                        padding: const EdgeInsets.all(9),
                                                        child: const Text('17 Feb'),
                                                        ),
                                                    title: const Text('Shopping',style: TextStyle(fontWeight: FontWeight.w400),),
                                                    subtitle: const Text('Buy Some Grocery'),
                                                    trailing: Column( 
                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                   children: const [
                                                                                Text('-₹180', 
                                                                                       style: TextStyle(
                                                                                              color: Colors.red,
                                                                                                fontSize: 18,
                                                                                                ),
                                                                                                ),
                                                                               Text('10:00 AM',
                                                                                        style: TextStyle(
                                                                                              color: Colors.grey,
                                                                                                fontSize: 12,
                                                                                                   ),
                                                                                 ),
                                                                                 ],
                                                              ),
                                               ),
                                              Divider(height: 0.5,),
                                             ListTile(
                                                leading: Container(
                                        
                                                           width: 50,
                                                           height: 50,
                                                           color: Colors.green,
                                                            padding: const EdgeInsets.all(9),
                                                           child: const Text('15 Feb'),
                                                       ),
                                                title: const Text('Salary',style: TextStyle(fontWeight: FontWeight.w400),),
                                                subtitle: const Text('Pay day'),
                                                 trailing: Column( 
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: const [
                                                                          Text('+₹45000', 
                                                                             style: TextStyle(
                                                                                     color: Colors.green,
                                                                                    fontSize: 18,
                                                                                    ),
                                                                              ),
                                                                           Text('12:00 PM',
                                                                                 style: TextStyle(
                                                                                     color: Colors.grey,
                                                                                    fontSize: 12,
                                                                                   ),
                                                                              ),

                               
                                                                            ],
                                                           ),
                                                         ),
                  const Divider(height: 0.5,),
ListTile(
                                                           
      leading: Container(
                                        
                         width: 50,
                         height: 50,
                         color: Colors.red,
                         padding: const EdgeInsets.all(9),
                        child: const Text('13 Feb'),
                        ),
      title: const Text('fuel',style: TextStyle(fontWeight: FontWeight.w400),),
      subtitle: const Text('diesel for car'),
      trailing: Column( 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                                      Text('+₹500', 
                                            style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            ),
                                          ),
                                      Text('12:00 PM',
                                             style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                            ),
                                          ),
                               
                               
                                      ],
                       ),
  ),

],   
), ))
                                                          
                                
],),
                ),
      ),
    );




                                                                                         
                                                                                         
                                                             
                                                             
                                                                                                                   
                                                     
                               
                                   
                   
     }
}