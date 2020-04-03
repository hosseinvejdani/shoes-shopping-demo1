import 'package:flutter/material.dart';

import 'drawer_design.dart';
import 'grid_view_design.dart';
import 'list_view_design.dart';


class FilteredProducts extends StatefulWidget {
  @override
  _FilteredProductsState createState() => _FilteredProductsState();
}

class _FilteredProductsState extends State<FilteredProducts> {

  bool isSearching = false;
  bool isListViewItems = true;

  Widget mainAppBar() {
    return AppBar(
      title: Text(
        'لیست محصولات',
        style: TextStyle(fontFamily: 'Yekan'),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.category,
              size: 26,
            ),
            onPressed: () {}),
        IconButton(
          onPressed: () {
            setState(() {
              isListViewItems = !isListViewItems;
            });
          },
          icon: isListViewItems
              ? Icon(
                  Icons.apps,
                  size: 26,
                )
              : Icon(
                  Icons.list,
                  size: 26,
                ),
        ),
      ],
    );
  }

  Widget searchAppBar() {
    return AppBar(
      title: TextField(
        maxLines: 1,
        decoration: InputDecoration(
            alignLabelWithHint: false,
            hintText: 'جستجو',
            hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Yekan')),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.cancel,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            }),
      ],
    );
  }

  Widget myBottomBar() {
    return BottomAppBar(
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.grey[800],
                size: 28,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            child: isSearching ? searchAppBar() : mainAppBar(),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        bottomNavigationBar: myBottomBar(),
        drawer: DrawerDesign(),
        body: Container(
          color: Colors.grey[200],
          child: isListViewItems ? ListViewDesign() : GridViewDesign(),
        ),
      ),
    );
  }
}