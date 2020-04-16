import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_v00/items/selected_products_show.dart';
import 'package:flutter_shopping_demo_v00/screens/searchScreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'drawer_design.dart';

class ProductDetails extends StatefulWidget {
  final productID;

  const ProductDetails({Key key, this.productID}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
              Icons.arrow_forward,
              size: 28,
            ),
            onPressed: () {
              Navigator.pop(context);
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
          child: isSearching
              ? SearchScreen(
                  searchedWord: searchedWord,
                )
              : ProductDetailsPageDesign(
                  productID: widget.productID,
                ),
        ),
      ),
    );
  }
}

class ProductDetailsPageDesign extends StatefulWidget {
  final productID;

  const ProductDetailsPageDesign({Key key, this.productID}) : super(key: key);

  @override
  _ProductDetailsPageDesignState createState() =>
      _ProductDetailsPageDesignState();
}

class _ProductDetailsPageDesignState extends State<ProductDetailsPageDesign> {
  String query = '''
  query Product(\$productID: ID!) {
    products{
      id
      name
      imageURL
      price
    }
    product(productId: \$productID) {
      id
      name
      price
      descreption
      imageURL
      category{
        name
      }
    }
  }
  ''';

  bool isFavor = false;

  List<dynamic> makeRandomLits(List<dynamic> products) {
    List<dynamic> randomList = [];
    var num = new Random();
    for (int i = 0; i < 7; i++) {
      var randomIndex = num.nextInt(products.length);
      randomList.add(products[randomIndex]);
    }
    return randomList;
  }

  @override
  Widget build(BuildContext context) {
    //final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Query(
      options: QueryOptions(
        // this is the query string you just created
        documentNode: gql(query),
        variables: {"productID": int.parse(widget.productID)},
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  width: w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: 0.9*w,
                            color: Color(0xFF0F4C81),
                            child: Text(
                              result.data["product"]["name"],
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Image.network(result.data["product"]["imageURL"]),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, right: 8.0, left: 8.0),
                        child: Text(
                          result.data["product"]["descreption"],
                          style: TextStyle(fontFamily: 'Yekan', fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.add_shopping_cart,
                                size: 32,
                                color: Color(0xFF77202F),
                              ),
                              onPressed: () {
                                print('add to cart');
                              },
                            ),
                            Text(
                              result.data["product"]["price"] + " تومان",
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  fontSize: 25.0,
                                  color: Color(0xFF0F4C81)),
                            ),
                            IconButton(
                              icon: Icon(
                                isFavor ? Icons.favorite : Icons.favorite_border,
                                size: 32,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFavor = !isFavor;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SelectedProductsShow(
                  backgroundColor: Color(0xFF0F4C81),
                  title: 'محصولات مشابه',
                  messege: 'taped on similar products',
                  selectedProductsList: makeRandomLits(result.data["products"]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
