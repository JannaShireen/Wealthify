import 'package:cash_track/db/db_category_functions.dart';
import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';



class ScreenAddIncomeTransaction extends StatefulWidget {
  const ScreenAddIncomeTransaction({super.key});

  @override
  State<ScreenAddIncomeTransaction> createState() => _AddIncomeTransactionState();
}

class _AddIncomeTransactionState extends State<ScreenAddIncomeTransaction> {

  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

final _purposeTextEditingController= TextEditingController();
final _amountTextEditingController= TextEditingController();



  //  List<String> items=['Income','Expense'];
  // String? _selectedItem='Income';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 206, 235),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/IncomeImage.png'),
              SizedBox(height: 20,),
              TextFormField(
                controller: _purposeTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'How did you get it?',
                ),
              ),
              
              TextFormField(
                controller: _amountTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'How much?',
                  
                ),
                keyboardType: TextInputType.number,
              ),
             
              TextButton.icon(
                onPressed: () async{
                   final _selectedDateTemp  = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(), 
                      firstDate: DateTime.now().subtract(const Duration(days: 30)), 
                      lastDate: DateTime.now(),
                      );
              
                      if (_selectedDateTemp== null){
                        return;
                      }else {
                        print(_selectedDateTemp.toString());
                        setState(() {
                          _selectedDate= _selectedDateTemp;
                        });
                      }
              
              
                }, 
                icon: const Icon(Icons.calendar_today), 
                label: Text(_selectedDate==null ?'Select Date' : _selectedDate.toString()),
              ),
              
              
              DropdownButton<String>(
                hint: const Text('Select Income'),
                value: _categoryID,
               
                items: CategoryDB().incomeCategoryListListener.value.map((e) {
              
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                    onTap: (){
                      _selectedCategoryModel=e;
                    },
                    );
                }).toList(),
                onChanged: (selectedValue){
                  print(selectedValue);
                  setState(() {
                    _categoryID=selectedValue;
                  });
              
                },
              // items: items.map((item) => DropdownMenuItem<String>(
              //   value: item,
              //   child: Text(item,style: TextStyle(fontSize: 24)),
              //   ))
              //   .toList(),
              // value: _selectedItem,
              //  onChanged: (item)=>
              //  setState(() {
              //    _selectedItem=item;
              //  }),
              ),
              
              //submit
              
           ElevatedButton(
            onPressed: (){
              submitAddIncomeTransaction();
            },
            child: Text('Submit'),
           ) ,
            ],
          ),
        ),
      ),
      ),
    );
  }


Future<void> submitAddIncomeTransaction() async{
  
      final _purposeText= _purposeTextEditingController.text;
      final _amountText = _amountTextEditingController.text;
      
      if(_purposeText.isEmpty){
        return;
      }
      if(_amountText.isEmpty){
        return;
      }

      if(_categoryID==null){
        return;
      }

      if(_selectedDate==null){
        return;
      }
      final parsedAmount=double.tryParse(_amountText);
      if (parsedAmount==null){
        return;
      }

      if(_selectedCategoryModel==null){
        return;
      }

      final model= TransactionModel(
        purpose: _purposeText,
        amount: parsedAmount,
        date: _selectedDate!,
        type: CategoryType.income,
        category: _selectedCategoryModel!,
      );
      

     await TransactionDB.instance.addTransaction(model);
     Navigator.of(context).pop();
     
     TransactionDB.instance.refresh();


}
 
}