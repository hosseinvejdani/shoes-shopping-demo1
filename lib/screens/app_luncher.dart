import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class AppLuncher extends StatefulWidget {
  @override
  _AppLuncherState createState() => _AppLuncherState();
}

class _AppLuncherState extends State<AppLuncher> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: const SpinKitThreeBounce(color: Colors.white),),
      
    );
  }
}