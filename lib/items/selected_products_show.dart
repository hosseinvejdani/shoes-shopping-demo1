import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_v00/env.dart';
import '../screens/product_details.dart';

class SelectedProductsShow extends StatefulWidget {
  static bool showCategoryMenu = true;

  @required
  final String title;
  @required
  final String messege;
  @required
  final Color backgroundColor;
  @required
  final List<dynamic> selectedProductsList;

  SelectedProductsShow(
      {this.title,
      this.messege,
      this.backgroundColor,
      this.selectedProductsList});

  @override
  _SelectedProductsShowState createState() => _SelectedProductsShowState();
}

class _SelectedProductsShowState extends State<SelectedProductsShow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.centerRight,
          child: Text(
            widget.title,
            style: TextStyle(fontFamily: 'Yekan', fontSize: 18.0),
          ),
        ),
        Container(
          color: widget.backgroundColor,
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.selectedProductsList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print(widget.messege);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        productID: widget.selectedProductsList[index]["id"],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
                  width: 190,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Image.network(
                            Env.mediaURL+widget.selectedProductsList[index]["imageURL"],
                          ),
                          width: 190,
                          height: 190,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            widget.selectedProductsList[index]["name"],
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            widget.selectedProductsList[index]["price"] + " تومان",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Yekan',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
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
