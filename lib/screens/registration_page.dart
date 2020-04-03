import 'package:flutter/material.dart';
import './drawer_design.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'فرم ثبت نام',
              style: TextStyle(fontFamily: 'Yekan'),
            ),
            leading: IconButton(
              onPressed: () {
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
                  padding: EdgeInsets.all(30.0),
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        maxLines: 1,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'What do people call you?',
                          labelText: 'Name *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'What is Valid E-Mail Address?',
                          labelText: 'Email *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: 'What Is Your Phone Number?',
                          labelText: 'Phone Number *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        maxLines: 1,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: 'Enter a Password',
                          labelText: 'Password *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: 'Re-Enter Your Password',
                          labelText: 'Repet Password *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      RaisedButton(
                        color: Colors.amber,
                        onPressed: () {},
                        child: Text(
                          'ثبت نام',
                          style: TextStyle(fontFamily: 'Yekan', fontSize: 18),
                        ),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
