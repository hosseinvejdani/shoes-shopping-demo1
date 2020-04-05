import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shopping_demo_v00/items/latest_products_show.dart';
import 'package:flutter_shopping_demo_v00/items/most_popular_products_show.dart';
import 'package:flutter_shopping_demo_v00/items/selected_products_show.dart';
import 'package:flutter_shopping_demo_v00/services/best-selling.dart';
import 'package:flutter_shopping_demo_v00/services/latest_products.dart';
import 'package:flutter_shopping_demo_v00/services/most_popular.dart';
import 'package:flutter_shopping_demo_v00/services/special_sale.dart';
import '../items/best_selling_products_show.dart';
import '../items/category-menu.dart';
import '../items/swiper-item.dart';
import './drawer_design.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  bool isListViewItems = true;

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
            child: isSearching ? searchAppBar() : mainAppBar('خانه'),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        bottomNavigationBar: myBottomBar(),
        drawer: DrawerDesign(),
        body: Container(
          color: Colors.grey[100],
          child: HomePageDesign(),
        ),
      ),
    );
  }
}

class HomePageDesign extends StatefulWidget {
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
          CategoryMenu(),
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
