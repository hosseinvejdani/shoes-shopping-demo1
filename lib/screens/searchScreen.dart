import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'product_details.dart';

class SearchScreen extends StatefulWidget {
  final String searchedWord;
  // call query based on searched title if (searchTitle != '')

  const SearchScreen({Key key, this.searchedWord}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '''
  query Products(\$name: String!) {
    products(name:\$name) {
      id
      name
      price
    }
  }
  ''';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Query(
        options: QueryOptions(
            // this is the query string you just created
            documentNode: gql(query),
            variables: {
              "name": widget.searchedWord,
            }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: EdgeInsets.only(right: 8.0, left: 8.0),
            child: ListView.builder(
              itemCount: result.data["products"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          productID: result.data["products"][index]["id"],
                        ),
                      ),
                    );
                  },
                  title: Container(
                    padding: EdgeInsets.all(5.0),
                    height: 35.0,
                    child: Text(
                      result.data["products"][index]["name"],
                      style: TextStyle(
                          color: Colors.grey[850],
                          fontFamily: 'Yekan',
                          fontSize: 18.0),
                    ),
                  ),
                  subtitle: Text(
                    result.data["products"][index]["price"],
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'Yekan',
                        fontSize: 15.0),
                  ),
                  trailing: Icon(Icons.arrow_right),
                  contentPadding: EdgeInsets.only(top: 3.5, bottom: 3.5),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
