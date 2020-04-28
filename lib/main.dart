import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'config/client.dart';
import 'screens/login_page.dart';
//import 'screens/product_details.dart';
//import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GraphQLProvider(
      client: Config.initailizeClient(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.grey[700]),
        ),
        //home: HomePage(),
        //home: ProductDetails(productID: 302),
        home: LoginPage(),
      ),
    );
  }
}
