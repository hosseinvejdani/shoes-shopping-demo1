import 'package:flutter/material.dart';
import '../screens/filtered_category_products.dart';

class CategoryMenu extends StatefulWidget {
  final List<String> categoryList;
  final bool showCategoryMenu;

  const CategoryMenu({Key key, this.categoryList, this.showCategoryMenu})
      : super(key: key);

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
          MaterialPageRoute(
            builder: (context) => FilteredCategoryProducts(
              categoryTitle: title,
            ),
          ),
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

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: widget.showCategoryMenu ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      // The green box must be a child of the AnimatedOpacity widget.
      child: Visibility(
        visible: widget.showCategoryMenu,
        child: Column(
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
              margin: EdgeInsets.only(right: 3.0, left: 3.0),
              width: double.infinity,
              height: 35.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 3.0, right: 3.0, bottom: 5.0),
                    child: categoryFlatButton(widget.categoryList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
