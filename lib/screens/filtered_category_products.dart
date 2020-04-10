import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shopping_demo_v00/screens/grid_view_design.dart';
import 'package:flutter_shopping_demo_v00/screens/list_view_design.dart';
import './drawer_design.dart';

class FilteredCategoryProducts extends StatefulWidget {
  final String categoryTitle;

  FilteredCategoryProducts({@required this.categoryTitle});

  @override
  _FilteredCategoryProductsState createState() =>
      _FilteredCategoryProductsState();
}

class _FilteredCategoryProductsState extends State<FilteredCategoryProducts> {
  bool isSearching = false;
  bool showCategoryMenu = false;
  bool isListViewItems;
  


  Widget mainAppBar(String title) {
    return AppBar(
      title: Text(
        title,
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
            onPressed: () {
              setState(() {
                showCategoryMenu = !showCategoryMenu;
              });
            }),
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

  Future<List<String>> loadProductsData() async {
    final myData = await rootBundle.loadString("assets/data/products.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    List<String> productsImageURL = [];
    //
    csvTable.forEach((item) {
      if (item[0] == widget.categoryTitle) productsImageURL.add(item[1]);
    });
    //
    return productsImageURL;
  }


  @override
  void initState() {
    super.initState();
    isListViewItems = true;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            child: isSearching ? searchAppBar() : mainAppBar('دسته '),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        bottomNavigationBar: myBottomBar(),
        drawer: DrawerDesign(),
        body: Container(
          color: Colors.grey[100],
          child: FutureBuilder(
            future: loadProductsData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return isListViewItems
                    ? ListViewDesign(
                        urlList: snapshot.data,
                        categoryTitle: widget.categoryTitle,
                        showCategoryMenu: showCategoryMenu,
                      )
                    : GridViewDesign(
                        urlList: snapshot.data,
                        categoryTitle: widget.categoryTitle,
                        showCategoryMenu: showCategoryMenu,
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}
