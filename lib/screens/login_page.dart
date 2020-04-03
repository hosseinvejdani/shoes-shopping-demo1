import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './drawer_design.dart';
import './registration_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'ورود به برنامه',
              style: TextStyle(fontFamily: 'Yekan'),
            ),
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          drawer: DrawerDesign(),
          body: Directionality(
            textDirection: TextDirection.ltr,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[200],
                padding: EdgeInsets.only(left: 60.0, right: 60.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      onSubmitted: (String value) {},
                      decoration: InputDecoration(
                        hintText: 'Enter UserName or E-Mail',
                        labelText: 'UserName',
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      maxLines: 1,
                      onSubmitted: (String value) {},
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    RaisedButton(
                      color: Colors.amber,
                      onPressed: () {},
                      child: Text(
                        'ورود',
                        style: TextStyle(fontFamily: 'Yekan', fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegistrationPage()),
                            );
                          },
                          child: Text(
                            'ثبت نام',
                            style: TextStyle(
                                fontFamily: 'Yekan',
                                fontSize: 18,
                                color: Colors.blue[800]),
                          ),
                        ),
                        Text(
                          'آیا حساب کاربری ندارید؟',
                          style: TextStyle(fontFamily: 'Yekan', fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
