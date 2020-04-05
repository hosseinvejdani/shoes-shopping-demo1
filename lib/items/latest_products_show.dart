import 'package:flutter/material.dart';
import '../services/latest_products.dart';

class LatestProductsShow extends StatefulWidget {
  @override
  _LatestProductsShowState createState() => _LatestProductsShowState();
}

class _LatestProductsShowState extends State<LatestProductsShow> {
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
            'جدید ترین محصولات',
            style: TextStyle(fontFamily: 'Yekan', fontSize: 18.0),
          ),
        ),
        Container(
          color: Colors.blue[400],
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('one of latest products taped');
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
                              LatestProducts.productList[index].imageURL),
                          width: 190,
                          height: 190,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            LatestProducts.productList[index].title,
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            LatestProducts.productList[index].price,
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
