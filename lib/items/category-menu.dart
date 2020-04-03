import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  //
  Widget categoryFlatButton(String title) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontFamily: "Yekan"),
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
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10.0, top: 15.0,bottom: 3.0),
          child: Text(
            'انتخاب دسته بندی',
            style: TextStyle(color: Colors.grey[800], fontFamily: "Yekan",fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              categoryFlatButton('کفش روزمره مردانه'),
              SizedBox(
                width: 10.0,
              ),
              categoryFlatButton('کفش رسمی مردانه'),
              SizedBox(
                width: 10.0,
              ),
              categoryFlatButton('کفش روزمره زنانه'),
              SizedBox(
                width: 10.0,
              ),
              categoryFlatButton('کفش تخت زنانه'),
              SizedBox(
                width: 10.0,
              ),
              categoryFlatButton('کفش پسرانه'),
              SizedBox(
                width: 10.0,
              ),
              categoryFlatButton('کفش دخترانه'),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
