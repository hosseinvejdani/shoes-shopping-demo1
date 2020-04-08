import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CategoryList {
  //
  static loadData() async {
    final myData = await rootBundle.loadString("assets/data/category.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    return csvTable[0];
  }
}
