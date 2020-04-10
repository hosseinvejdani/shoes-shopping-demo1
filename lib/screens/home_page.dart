import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shopping_demo_v00/screens/searchScreen.dart';
import '../items/selected_products_show.dart';
import '../services/best-selling.dart';
import '../services/latest_products.dart';
import '../services/most_popular.dart';
import '../services/special_sale.dart';
import '../items/category-menu.dart';
import '../items/swiper-item.dart';
import './drawer_design.dart';

class HomePage extends StatefulWidget {
  static bool showCategoryMenu = true;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchedTitle = '';
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
        style: TextStyle(color:Colors.white,fontFamily: 'Yekan',fontSize: 18.0 ),
        maxLines: 1,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          hintText: 'جستجو',
          hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Yekan'),
        ),
        onChanged: (value) {
          setState(
            () {
              searchedTitle = value;
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
                searchedTitle = '';
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

  Future<List<List<String>>> loadData(String searchedTitle) async {
    final myProductsData =
        await rootBundle.loadString("assets/data/products.csv");
    List<List<dynamic>> csvProductsTable =
        CsvToListConverter().convert(myProductsData);
    List<String> searchResultList = [];
    csvProductsTable.forEach((item) {
      if (searchedTitle != '' && item[0].toString().contains(searchedTitle)) {
        searchResultList.add(item[0]);
      }
    });
    //
    final myCategoryData =
        await rootBundle.loadString("assets/data/category.csv");
    List<List<dynamic>> csvCategoryTable =
        CsvToListConverter().convert(myCategoryData);
    List<String> categoryList = [];
    csvCategoryTable[0].forEach((value) {
      categoryList.add(value.toString());
    });
    List<List<String>> data = [searchResultList, categoryList];
    return data;
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
          child: FutureBuilder(
            future: loadData(searchedTitle),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return isSearching
                    ? SearchScreen(
                        searchResultList: snapshot.data[0],
                      )
                    : HomePageDesign(
                        categoryList: snapshot.data[1], //List<String>
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}

class HomePageDesign extends StatefulWidget {
  final List<String> categoryList;

  const HomePageDesign({Key key, this.categoryList}) : super(key: key);

  @override
  _HomePageDesignState createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  //

  //
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryMenu(
            categoryList: widget.categoryList,
            showCategoryMenu: HomePage.showCategoryMenu,
          ),
          SizedBox(
            height: 7.0,
          ),
          SwiperItem(),
          SelectedProductsShow(
            backgroundColor: Colors.redAccent,
            title: 'پرفروش ترین محصولات',
            messege: 'taped on of the best salling products',
            group: BestSelling.productList,
          ),
          SelectedProductsShow(
            backgroundColor: Colors.greenAccent,
            title: 'محبوب ترین محصولات',
            messege: 'taped on of the most popular products',
            group: MostPopular.productList,
          ),
          SelectedProductsShow(
            backgroundColor: Colors.blueAccent,
            title: 'جدید ترین محصولات',
            messege: 'taped on of latest products',
            group: LatestProducts.productList,
          ),
          SelectedProductsShow(
            backgroundColor: Colors.amberAccent,
            title: 'فروش ویژه',
            messege: 'taped on of the specialsales products',
            group: SpecialSale.productList,
          ),
        ],
      ),
    );
  }
}
