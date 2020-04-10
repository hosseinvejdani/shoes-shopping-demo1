import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shopping_demo_v00/items/category-menu.dart';

class GridViewDesign extends StatefulWidget {
  final List<String> urlList;
  final String categoryTitle;
  final bool showCategoryMenu;

  GridViewDesign(
      {@required this.urlList,
      @required this.categoryTitle,
      @required this.showCategoryMenu});

  @override
  _GridViewDesignState createState() => _GridViewDesignState();
}

class _GridViewDesignState extends State<GridViewDesign> {
  Future<List<String>> loadAsset() async {
    final myData = await rootBundle.loadString("assets/data/category.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    List<String> categoryList = [];
    csvTable[0].forEach((value) {
      categoryList.add(value.toString());
    });

    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
                FutureBuilder(
          future: loadAsset(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CategoryMenu(
                categoryList: snapshot.data,
                showCategoryMenu: widget.showCategoryMenu,
              );
            }
          },
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.grey[250],
            child: GridView.builder(
              itemCount: (widget.urlList == null ? 0 : widget.urlList.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                  childAspectRatio: 0.52),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                            topLeft: Radius.circular(4.0),
                            bottomLeft: Radius.circular(4.0)),
                        child: Image.network(widget.urlList[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 3.0, left: 3.0, right: 6.0),
                        child: Text(
                          widget.categoryTitle,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Yekan'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        height: 0.25 * w,
                        child: Text(
                          'کفشی برای نسل امروز، مطابق با استاندارد های روز دنیا، طراحی زیبا و راحت، ساخته شده از بهترین مواد، ضد عرق و ضد بو و بسیار سبک می باشد',
                          maxLines: 4,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Center(
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('مشاهده جزئیات'),
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
