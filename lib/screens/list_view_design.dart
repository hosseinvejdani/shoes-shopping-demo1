import 'package:flutter/material.dart';

class ListViewDesign extends StatefulWidget {
  final List<String> urlList;
  final String categoryTitle;

  ListViewDesign({@required this.urlList, @required this.categoryTitle});

  @override
  _ListViewDesignState createState() => _ListViewDesignState();
}

class _ListViewDesignState extends State<ListViewDesign> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: (widget.urlList == null ? 0 : widget.urlList.length),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 1.5, 4.0, 1.5),
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                        topLeft: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0)),
                    child: Image.network(widget.urlList[index],),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
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
                        padding: const EdgeInsets.only(left: 3.0),
                        height: 0.25 * w,
                        child: Text(
                          'کفشی برای نسل امروز، مطابق با استاندارد های روز دنیا، طراحی زیبا و راحت، ساخته شده از بهترین مواد، ضد عرق و ضد بو و بسیار سبک می باشد',
                          maxLines: 4,
                          textDirection: TextDirection.rtl,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
