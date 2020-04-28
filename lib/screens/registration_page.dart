import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:string_validator/string_validator.dart';
import '../env.dart';
import './drawer_design.dart';
import 'home_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String username;
  String email;
  String password;
  String passwordAgain;
  String mymutation = '''
  mutation CreateUser(\$username: String!, \$email: String!,\$password: String!){
  createUser(username: \$username, email:\$email ,password: \$password){
    user{
      id
      username
      email
    }
  }
}
  ''';

  void errMessage() {
    var snackbar = SnackBar(content: new Text("اطلاعات وارد شده غیر مجاز است"));
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
        body: Mutation(
          options: MutationOptions(
            documentNode: gql(mymutation),
            update: (Cache cache, QueryResult result) {
              return cache;
            },
            onCompleted: (dynamic resultData) {
              if (resultData == null) {
                errMessage();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterationCompleted(
                      username: username,
                      password: password,
                    ),
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
                  padding: EdgeInsets.all(30.0),
                  color: Colors.grey[200],
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Choose an appropriate Username',
                            labelText: 'UserName *',
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'لطفا نام کاربری را وارد کنید';
                            }
                            if (value.contains('@')) {
                              return 'از کاراکترهای مجاز استفاده کنید';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            username = trim(value);
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
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'لطفا ایمیل را وارد کنید';
                            }
                            if (!isEmail(value)) {
                              return 'فرمت ایمیل اشتباه است!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = trim(value);
                          },
                        ),
                        SizedBox(
                          height: 8.0,
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
                          validator: (String value) {
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
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'لطفا تکرار رمز عبور را وارد کنید';
                            }

                            return null;
                          },
                          onSaved: (value) {
                            passwordAgain = trim(value);
                          },
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        RaisedButton(
                          color: Colors.amber,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                runMutation({
                                  'username': username,
                                  'email': email,
                                  'password': password
                                });
                              }
                            });
                          },
                          child: Text(
                            'ثبت نام',
                            style: TextStyle(fontFamily: 'Yekan', fontSize: 18),
                          ),
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

class RegisterationCompleted extends StatefulWidget {
  final username;
  final password;

  const RegisterationCompleted({Key key, this.username, this.password})
      : super(key: key);

  @override
  _RegisterationCompletedState createState() => _RegisterationCompletedState();
}

class _RegisterationCompletedState extends State<RegisterationCompleted> {
  String mymutation = '''
  mutation TokenAuth(\$username: String!, \$password: String!){
    tokenAuth(username: \$username, password: \$password) {
      token
    }
  }
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Mutation(
        options: MutationOptions(
          documentNode: gql(mymutation),
          update: (Cache cache, QueryResult result) {
            return cache;
          },
          onCompleted: (dynamic resultData) {
            if (resultData == null) {
              print('null data');
            } else {
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
          return SafeArea(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ثبت نام با موفقیت انجام شد',
                      style: TextStyle(fontFamily: 'Yekan', fontSize: 22),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      color: Colors.amber,
                      onPressed: () {
                        runMutation({
                          'username': widget.username,
                          'password': widget.password
                        });
                      },
                      child: Text(
                        'ورود',
                        style: TextStyle(
                          fontFamily: 'Yekan',
                          fontSize: 18,
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
    );
  }
}
