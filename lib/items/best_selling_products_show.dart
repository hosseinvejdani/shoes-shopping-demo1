import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_v00/services/best-selling.dart';

class BestSellingProductsShow extends StatefulWidget {
  @override
  _BestSellingProductsShowState createState() => _BestSellingProductsShowState();
}

class _BestSellingProductsShowState extends State<BestSellingProductsShow> {
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
            'پرفروش ترین محصولات',
            style: TextStyle(fontFamily: 'Yekan', fontSize: 18.0),
          ),
        ),
        Container(
          color: Colors.red[400],
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('one of best selling products taped');
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
                              BestSelling.productList[index].imageURL),
                          width: 190,
                          height: 190,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            BestSelling.productList[index].title,
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            BestSelling.productList[index].price,
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
