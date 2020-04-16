import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shopping_demo_v00/screens/list_view_design.dart';
import 'package:flutter_shopping_demo_v00/screens/searchScreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './drawer_design.dart';

class FilteredCategoryProducts extends StatefulWidget {
  final String categoryID;

  FilteredCategoryProducts({@required this.categoryID});

  @override
  _FilteredCategoryProductsState createState() =>
      _FilteredCategoryProductsState();
}

class _FilteredCategoryProductsState extends State<FilteredCategoryProducts> {
  String searchedWord = '';
  bool isSearching = false;
  bool showCategoryMenu = false;
  String query = '''
  query Products(\$categoryId: ID!) {
    products(categoryId: \$categoryId) {
      id
      name
      price
      descreption
      imageURL
    }
  }
  ''';

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
      ],
    );
  }

  Widget searchAppBar() {
    return AppBar(
      title: TextField(
        style:
            TextStyle(color: Colors.white, fontFamily: 'Yekan', fontSize: 18.0),
        maxLines: 1,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          hintText: 'جستجو',
          hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Yekan'),
        ),
        onChanged: (value) {
          setState(
            () {
              searchedWord = value;
            },
          );
        },
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
                searchedWord = '';
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
            child: isSearching ? searchAppBar() : mainAppBar(''),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        bottomNavigationBar: myBottomBar(),
        drawer: DrawerDesign(),
        body: Container(
          color: Colors.grey[100],
          child: Query(
            options: QueryOptions(
                // this is the query string you just created
                documentNode: gql(query),
                variables: {"categoryId": int.parse(widget.categoryID)}),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              return isSearching
                  ? SearchScreen(
                      searchedWord: searchedWord,
                    )
                  : ListViewDesign(
                      productList: result.data["products"],
                      showCategoryMenu: showCategoryMenu,
                    );
            },
          ),
        ),
      ),
    );
  }
}
