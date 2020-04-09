import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/filtered_category_products.dart';

class CategoryMenu extends StatefulWidget {
  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  //
  Widget categoryFlatButton(String title) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FilteredCategoryProducts(categoryTitle: title,)),
        );
      },
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        title,
        style:
            TextStyle(color: Colors.white, fontFamily: "Yekan", fontSize: 16.0),
      ),
      color: Color(0xff7d3cff),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
    );
  }

  //

  List<List<dynamic>> data;
  loadAsset() async {
    final myData = await rootBundle.loadString("assets/data/category.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    setState(() {
      data = csvTable;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10.0, top: 15.0, bottom: 5.0),
          child: Text(
            'انتخاب دسته بندی',
            style: TextStyle(
                color: Colors.grey[800], fontFamily: "Yekan", fontSize: 18),
          ),
        ),
        Container(
          width: double.infinity,
          height: 35.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (data == null ? 0 : data[0].length),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 5.0),
                child: categoryFlatButton(data[0][index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
