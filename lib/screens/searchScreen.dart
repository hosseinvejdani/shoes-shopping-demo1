import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final List<String> searchResultList;

  const SearchScreen({Key key, @required this.searchResultList})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.only(right: 8.0, left: 8.0),
        child: ListView.builder(
          itemCount: widget.searchResultList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(widget.searchResultList[index],style: TextStyle(color:Colors.grey[850],fontFamily: 'Yekan',fontSize: 18.0 ),),
              subtitle: Text('15,000',style: TextStyle(color:Colors.redAccent,fontFamily: 'Yekan',fontSize: 15.0 ),),
              trailing: Icon(Icons.arrow_right),
              contentPadding: EdgeInsets.only(top: 3.5, bottom: 3.5),
            );
          },
        ),
      ),
    );
  }
}
