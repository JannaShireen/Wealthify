import 'package:cash_track/db/models/category_model.dart/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

const CATEGORY_DB_NAME= 'category-database';
// abstract class CategorydbFunctions
// {
//   Future<List<CategoryModel>>getCategories();
//   Future<void> insertCategory(CategoryModel value);
// }

class CategoryDB {

  CategoryDB._internal();

  static CategoryDB instance= CategoryDB._internal();
  factory CategoryDB(){
    return instance;

  }

    ValueNotifier<List<CategoryModel>> incomeCategoryListListener= ValueNotifier([]);
    ValueNotifier<List<CategoryModel>> expenseCategoryListListener= ValueNotifier([]);


  Future<void> insertCategory(CategoryModel value) async{

     final categoryDB= await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
     await  categoryDB.put(value.id,value);
     refreshUI();

  }

  static Future<List<CategoryModel>> getCategories()async{
    final categoryDB= await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return categoryDB.values.toList();
  }

  Future<void> refreshUI() async{
    final _allCategories= await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(_allCategories,
     (CategoryModel category) {
        if(category.type == CategoryType.income)
        {
          incomeCategoryListListener.value.add(category);
        }
        else
        {
          expenseCategoryListListener.value.add(category);
        }

     },
     );

     incomeCategoryListListener.notifyListeners();
     expenseCategoryListListener.notifyListeners();
  }

  Future<void> deleteCategory(String categoryID) async{

    final _categoryDB= await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.delete(categoryID);
    refreshUI();
  }
}