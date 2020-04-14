import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_v00/items/category-menu.dart';

class GridViewDesign extends StatefulWidget {
  final List<dynamic> productList;
  final bool showCategoryMenu;

  GridViewDesign({@required this.showCategoryMenu, this.productList});

  @override
  _GridViewDesignState createState() => _GridViewDesignState();
}

class _GridViewDesignState extends State<GridViewDesign> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        CategoryMenu(
          showCategoryMenu: widget.showCategoryMenu,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.grey[250],
            child: GridView.builder(
              itemCount: widget.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                  childAspectRatio: 0.52),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                            topLeft: Radius.circular(4.0),
                            bottomLeft: Radius.circular(4.0)),
                        child: Image.network(
                            widget.productList[index]["imageURL"]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 3.0, left: 3.0, right: 6.0),
                        child: Text(
                          widget.productList[index]["name"],
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Yekan'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        height: 0.15 * w,
                        child: Text(
                          widget.productList[index]["descreption"],
                          maxLines: 3,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text('مشاهده جزئیات'),
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
