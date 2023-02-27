import 'package:cash_track/db/db_category_functions.dart';
import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:flutter/material.dart';


class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
       builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _){
          return ListView.separated(
      itemBuilder: (ctx,index){
          final category=newList[index];
            return Card(
              child: ListTile(
               title: Text(category.name),
               trailing: IconButton(
                highlightColor: Colors.red,
                onPressed: (){
                   showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Confirm"),
                  content: const Text("Are you sure you want to delete?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(category.id);
                        Navigator.of(ctx).pop();

                      },
                      child: Container(
                        color: const Color.fromARGB(255, 235, 248, 235),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Color.fromARGB(255, 240, 209, 230),
                        padding: const EdgeInsets.all(14),
                        child: const Text("No"),
                      ),
                    ),
                  ],
                ),
              );
                  // CategoryDB.instance.deleteCategory(category.id);
            
                }, 
                icon: const Icon(Icons.delete)),
              ),
            );

      }, 
      separatorBuilder: (ctx,index){
        return const SizedBox(height: 10,);
      }, 
      itemCount: newList.length,
    );



       },
       );
  }
}