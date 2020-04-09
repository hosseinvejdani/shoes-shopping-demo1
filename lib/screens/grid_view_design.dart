import 'package:flutter/material.dart';

class GridViewDesign extends StatefulWidget {
  final List<String> urlList;
  final String categoryTitle;

  GridViewDesign({@required this.urlList, @required this.categoryTitle});

  @override
  _GridViewDesignState createState() => _GridViewDesignState();
}

class _GridViewDesignState extends State<GridViewDesign> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
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
    );
  }
}
