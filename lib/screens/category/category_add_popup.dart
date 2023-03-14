import 'package:wealthify/db/db_functions/db_category_functions.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../db/models/category_model/category_model.dart/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier = ValueNotifier(CategoryType.income);

Future<void> showCategoryPopup(BuildContext context) async{
 final _nameEditingController= TextEditingController();
  showDialog(
    context: context, 
    builder: (ctx){
        return SimpleDialog(
          title: const Text('Add Category'),
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                                  controller: _nameEditingController,
                                    decoration: const InputDecoration(
                                     border: OutlineInputBorder(),
                                     hintText: 'Category Name',
                                         ),
                                     ),
                     ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [

                    RadioButton(title: 'Income', type: CategoryType.income),
                    RadioButton(title: 'Expense', type: CategoryType.expense),

                  ],
                )
                
                ),
              // Padding(padding: EdgeInsets.all(8.0),
              //          child: Row(children: [
              //                       Radio(value: 1, groupValue: _value, onChanged: (value){
              //                                _value=value;
              //                                    }, 
              //                            ),
              //                       const SizedBox(width: 10.0,),
              //                       const Text('Income'),

              //                       const SizedBox(width: 15.0,),
              //                       Radio(value: 2, groupValue: _value, onChanged: (value){
              //                            _value=value;
              //                        },
              //                            ),
              //                       const SizedBox(width: 10.0,),
              //                      const Text('Expense'),

              //                      ],

              //                ),
              //                ),
              Padding(padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){

                                final _name= _nameEditingController.text;
                                if(_name.isEmpty)
                                {
                                  return;
                                }
                                final _type=selectedCategoryNotifier.value;
                                final _category= CategoryModel(
                                  id: DateTime.now().millisecondsSinceEpoch.toString(), 
                                  name: _name, 
                                  type: _type);

                                  CategoryDB.instance.insertCategory(_category);
                                  Navigator.of(ctx).pop();

                                   }, 
                                    child:const  Text('Add')),)
             
          ],
        );
  },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  
  const RadioButton({super.key,
  required this.title,
  required this.type,
  });

  @override
 


  Widget build(BuildContext context) {
    return Row(

      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryNotifier, 
          builder: (BuildContext ctx, CategoryType newCategory, Widget? _){
             return Radio<CategoryType>(
                   value: type,
                    groupValue: newCategory, 
                   onChanged: (value){
                   if (value == null){
                          return;
                       }
              selectedCategoryNotifier.value=value;
              selectedCategoryNotifier.notifyListeners();
             

           },
           );
          },

          ),
       
        Text(title),
      ],
    );
  }
}

// class RadioButton extends StatelessWidget {
//   final String title;
//   final CategoryType type;

//   const RadioButton({
//     key? key,

//   })
  
  

//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//       children: [
//         Radio<CategoryType>(value: value, groupValue: groupValue, onChanged: onChanged),
//         Text(title),
//       ],
//     );
//   }
// }