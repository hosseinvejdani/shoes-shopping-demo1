import 'package:flutter/material.dart';

class ListViewDesign extends StatefulWidget {
  @override
  _ListViewDesignState createState() => _ListViewDesignState();
}

class _ListViewDesignState extends State<ListViewDesign> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: 10,
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
                    child: Image.asset('assets/images/drSasy.jpg'),
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
                          'آهنگ دکتر ساسی',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Yekan'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 3.0),
                        height: 0.25*w,
                        child: Text(
                          'هم اکنون می توانید آهنگ جدید ، فوق العاده شاد و بسیار بترکون دکتر از ساسی مانکن را با بهترین کیفیت های ممکن یعنی کیفیت عالی ۳۲۰ و کیفیت کم حجم خیلی خوب ۱۲۸ همراه با متن آهنگ دکتر ساسی مانکن از رسانه موزیکیشو دانلود کنید.سلام همراه با متن آهنگ دکتر ساسی مانکن از رسانه موزیکیشو دانلود کنید.سلام',
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