import 'package:cash_track/db/db_category_functions.dart';
import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:cash_track/db/models/transactions/transaction_db.dart';
import 'package:cash_track/db/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class EditExpenseTransaction extends StatefulWidget {

  

  const EditExpenseTransaction({
    Key? key,
    required this.obj,
    this.id,
   
    }): super(key: key);

    final String? id;
    final TransactionModel obj;


    
  @override
  State<EditExpenseTransaction> createState() => _EditExpenseTransactionState();
}

class _EditExpenseTransactionState extends State<EditExpenseTransaction> {
   DateTime? _selectedDateTime;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;
  String? _categoryID;
  int _value=0;
  TextEditingController _amountTextEditingController= TextEditingController();
  TextEditingController _purposeTextEditingController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _value= widget.obj.type.index;
    _amountTextEditingController = TextEditingController(text: widget.obj.amount.toString());
    _purposeTextEditingController = TextEditingController(text: widget.obj.purpose);
      _selectedDateTime = widget.obj.date;
      _selectedCategorytype = CategoryType.expense;
      _selectedCategoryModel = widget.obj.category;
  }



final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 204, 204),
      appBar: AppBar(
        title: Text('EDIT EXPENSE'),
        backgroundColor: Color.fromARGB(255, 11, 6, 6),
      ),
      
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/ExpenseImage.png'),
              SizedBox(height: 20,),
              
              
              Form(
                key: _formKey,
                 child: Column(
                  children: [
                    TextFormField(
                      
                controller: _purposeTextEditingController,
                validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Field required';
                    }
                    else{
                        return null;
                    }
                
                  },
                decoration: const InputDecoration(
                  hintText: 'Purpose',
                ),
              ),
                 TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Field required';
                    }
                  },
                controller: _amountTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                  
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
                          _selectedDateTime= _selectedDateTemp;
                        });
                      }
        
        
                }, 
                icon: const Icon(Icons.calendar_today), 
                label: Text(_selectedDateTime==null ?'Select Date' : DateFormat("dd/MMMM/yyyy").format(_selectedDateTime!)),
              ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value==null || value.isEmpty)
                  {
                    return "Select category";
                  }
                  return null;
                },
                
                hint: const Text('Select Expense'),
                value: _categoryID,
               
                items: CategoryDB().expenseCategoryListListener.value.map((e) {
        
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
              // 
              ),
        
        //submit
        
           ElevatedButton(
            onPressed: (){

              if(_formKey.currentState!.validate()){
                  submitEditIncomeTransaction();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Transaction Edited Successfully')),
                  );
                  
                }
            
                
            },
            child: Text('Submit'),
           ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
  Future<void> submitEditIncomeTransaction() async{
  
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

      if(_selectedDateTime==null){
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
        date: _selectedDateTime!,
        type: CategoryType.expense,
        category: _selectedCategoryModel!,
        id: widget.obj.id
      );
      

     await TransactionDB.instance.editTransaction(model);
     Navigator.of(context).pop();
     
     TransactionDB.instance.refresh();



}
}