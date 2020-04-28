import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import '../env.dart';
import './registration_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int loginErrCounter = 0;
  String username;
  String password;
  String mymutation = '''
  mutation TokenAuth(\$username: String!, \$password: String!){
    tokenAuth(username: \$username, password: \$password) {
      token
    }
  }
  ''';

  void errMessage() {
    var snackbar;
    loginErrCounter++;
    if (loginErrCounter < 4) {
      snackbar =
          SnackBar(content: new Text("نام کاربری یا رمز عبور اشتباه است"));
    } else {
      snackbar =
          SnackBar(content: new Text("در صورتی که عضو نیستید، ثبت نام کنید!"));
    }
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'ورود به برنامه',
            style: TextStyle(fontFamily: 'Yekan'),
          ),
        ),
        body: Mutation(
          options: MutationOptions(
            documentNode: gql(mymutation),
            // variables: {'username': username, 'password': password},
            update: (Cache cache, QueryResult result) {
              return cache;
            },
            onCompleted: (dynamic resultData) {
              if (resultData == null) {
                errMessage();
              } else {
                loginErrCounter = 0;
                Env.jwtToken = resultData["tokenAuth"]["token"];
                print(resultData["tokenAuth"]["token"]);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
          ),
          builder: (
            RunMutation runMutation,
            QueryResult result,
          ) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey[200],
                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter UserName',
                            labelText: 'UserName',
                            suffixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'لطفا نام کاربری را وارد کنید';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            username = trim(value);
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'لطفا رمز عبور را وارد کنید';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = trim(value);
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        RaisedButton(
                          color: Colors.amber,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            });
                            runMutation(
                                {'username': username, 'password': password});
                          },
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
                                  MaterialPageRoute(
                                      builder: (context) => RegistrationPage()),
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
                              style:
                                  TextStyle(fontFamily: 'Yekan', fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
