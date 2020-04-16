import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_shopping_demo_v00/screens/searchScreen.dart';
import '../items/selected_products_show.dart';
import '../items/category-menu.dart';
import '../items/swiper-item.dart';
import './drawer_design.dart';

class HomePage extends StatefulWidget {
  static bool showCategoryMenu = true;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchedWord = '';
  bool isSearching = false;

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
              size: 28,
            ),
            onPressed: () {
              setState(() {
                HomePage.showCategoryMenu = !HomePage.showCategoryMenu;
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
            child: isSearching ? searchAppBar() : mainAppBar('خانه'),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        bottomNavigationBar: myBottomBar(),
        drawer: DrawerDesign(),
        body: Container(
          color: Colors.grey[100],
          child: isSearching
              ? SearchScreen(
                  searchedWord: searchedWord,
                )
              : HomePageDesign(),
        ),
      ),
    );
  }
}

class HomePageDesign extends StatefulWidget {
  final Map<String, dynamic> queryResult;

  const HomePageDesign({Key key, this.queryResult}) : super(key: key);

  @override
  _HomePageDesignState createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  String query = '''
  {
    products {
      id
      name
      price
      imageURL
    }
  }
  ''';
  //
  List<dynamic> makeRandomLits(List<dynamic> products) {
    List<dynamic> randomList = [];
    var num = new Random();
    for (int i = 0; i < 7; i++) {
      var randomIndex = num.nextInt(products.length);
      randomList.add(products[randomIndex]);
    }
    return randomList;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        // this is the query string you just created
        documentNode: gql(query),
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CategoryMenu(
                showCategoryMenu: HomePage.showCategoryMenu,
              ),
              SizedBox(
                height: 7.0,
              ),
              SwiperItem(),
              SelectedProductsShow(
                backgroundColor: Color(0xFFC0D725) ,
                title: 'پرفروش ترین محصولات',
                messege: 'taped on of the best salling products',
                selectedProductsList: makeRandomLits(result.data["products"]),
              ),
              SelectedProductsShow(
                backgroundColor:  Color(0xFFF26B5B),
                title: 'محبوب ترین محصولات',
                messege: 'taped on of the most popular products',
                selectedProductsList: makeRandomLits(result.data["products"]),
              ),
              SelectedProductsShow(
                backgroundColor: Color(0xFF7FC844)  ,
                title: 'جدید ترین محصولات',
                messege: 'taped on of latest products',
                selectedProductsList: makeRandomLits(result.data["products"]),
              ),
              SelectedProductsShow(
                backgroundColor: Color(0xFF0F4C81),
                title: 'فروش ویژه',
                messege: 'taped on of the specialsales products',
                selectedProductsList: makeRandomLits(result.data["products"]),
              ),
            ],
          ),
        );
      },
    );
  }
}
