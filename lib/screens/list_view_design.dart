import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_v00/items/category-menu.dart';

class ListViewDesign extends StatefulWidget {
  final List<dynamic> productList;
  final bool showCategoryMenu;

  ListViewDesign({@required this.showCategoryMenu, this.productList});

  @override
  _ListViewDesignState createState() => _ListViewDesignState();
}

class _ListViewDesignState extends State<ListViewDesign> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        CategoryMenu(
          showCategoryMenu: widget.showCategoryMenu,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 1.5, 4.0, 1.5),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                              topLeft: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0)),
                          child: Image.network(
                            widget.productList[index]["imageURL"],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 3.0, bottom: 3.0),
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
                              padding: const EdgeInsets.only(left: 3.0),
                              height: 0.25 * w,
                              child: Text(
                                widget.productList[index]["descreption"],
                                maxLines: 4,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Center(
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text('مشاهده جزئیات'),
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
