import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_v00/services/best-selling.dart';

class SelectedProductShow extends StatefulWidget {
  @override
  _SelectedProductShowState createState() => _SelectedProductShowState();
}

class _SelectedProductShowState extends State<SelectedProductShow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0,),
        Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.centerRight,
          child: Text(
            'پرفروش ترین محصولات',
            style: TextStyle(fontFamily: 'Yekan',fontSize: 20.0),
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
              return Container(
                margin: EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
                width: 190,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      Image.network(BestSelling.productList[index].imageURL),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          BestSelling.productList[index].title,
                          style: TextStyle(
                            fontFamily: 'Yekan',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
