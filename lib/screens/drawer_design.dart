import 'package:flutter/material.dart';

import './home_page.dart';
import './login_page.dart';

class DrawerDesign extends StatefulWidget {
  @override
  _DrawerDesignState createState() => _DrawerDesignState();
}

class _DrawerDesignState extends State<DrawerDesign> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
              color: Colors.grey[700],
              height: 0.40 * w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,),
                    child: CircleAvatar(radius: 35.0,backgroundColor: Colors.amberAccent,),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'ورود یا ثبت نام',
                      style: TextStyle(
                          fontFamily: 'Yekan',
                          color: Colors.grey[100],
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                dense: true,
                title: Text(
                  'خانه',
                  style: TextStyle(
                      fontFamily: 'Yekan',
                      color: Colors.grey[800],
                      fontSize: 18),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.grey[800],
                  size: 27.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ListTile(
                dense: true,
                title: Text(
                  'لیست سفارشات',
                  style: TextStyle(
                      fontFamily: 'Yekan',
                      color: Colors.grey[800],
                      fontSize: 18),
                ),
                leading: Icon(
                  Icons.list,
                  color: Colors.grey[800],
                  size: 27.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ListTile(
                dense: true,
                title: Text(
                  'ویرایش اطلاعات کاربری',
                  style: TextStyle(
                      fontFamily: 'Yekan',
                      color: Colors.grey[800],
                      fontSize: 16),
                ),
                leading: Icon(
                  Icons.edit,
                  color: Colors.grey[800],
                  size: 27.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}