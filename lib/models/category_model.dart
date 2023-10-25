import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String iconPath;
  Color color;
  CategoryModel({required this.name, required this.iconPath, required this.color});

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'Pie',
      iconPath: 'assets/icons/pie.svg',
      color: const Color.fromARGB(255, 203, 141, 214),	
    ));
    categories.add(CategoryModel(
      name: 'Salad',
      iconPath: 'assets/icons/salmon-nigiri.svg',
      color: const Color.fromARGB(255, 138, 244, 196),	
    ));
    categories.add(CategoryModel(
      name: 'Cake',
      iconPath: 'assets/icons/pancakes.svg',
      color: const Color.fromARGB(255, 252, 255, 174),	
    ));

    return categories;
  }
}