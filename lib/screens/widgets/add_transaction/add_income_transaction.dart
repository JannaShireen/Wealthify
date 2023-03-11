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
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 205, 204, 204),
      appBar: AppBar(
        title: Text('Add Income'),
        backgroundColor:  Color.fromARGB(255, 11, 6, 6),
      ),
     
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/IncomeImage.png'),
                SizedBox(height: 20,),
               
               
                Form(
                  key: _formKey,
                   child: Column(
                    children: [
                TextFormField(
                  style: TextStyle(color:Colors.black),
                   decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black26,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'How did you get it?',
                   ),
                   validator: (value){
                      if(value==null || value.isEmpty){
                        return 'Field required';
                      }
                      else{
                          return null;
                      }
                  
                    },
                  controller: _purposeTextEditingController,
                 
                ),
                SizedBox(height: 5,),
                
                TextFormField(
                    style: TextStyle(color:Colors.black),
                   decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black26,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'How much?',
                   ),
                   validator: (value){
                      if(value==null || value.isEmpty){
                        return 'Field required';
                      }
                      else{
                          return null;
                      }
                  
                    },
                  controller: _amountTextEditingController,
                  
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
                
                
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value==null || value.isEmpty)
                    {
                      return "Select category";
                    }
                    return null;
                  },
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
                
                ),
                
                //submit
                
             ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Transaction Added Successfully')),
                    );
                }
                submitAddIncomeTransaction();
              },
              child: Text('Submit'),
             ) ,
          
             
              ],
            ),
                ),
              ],
                ),
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
        id: DateTime.now().microsecondsSinceEpoch.toString(),
      );
      

     await TransactionDB.instance.addTransaction(model);
     Navigator.of(context).pop();
     
     TransactionDB.instance.refresh();


}
 
}