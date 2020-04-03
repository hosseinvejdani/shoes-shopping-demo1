import 'package:flutter/material.dart';

class GridViewDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(4.0),
      color: Colors.grey[250],
      child: GridView.builder(
        itemCount: 11,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 0.52
        ),
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
                  child: Image.asset('assets/images/drSasy.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 3.0,left: 3.0,right: 6.0),
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
                  padding: const EdgeInsets.only(left: 6.0,right: 6),
                  height: 0.25*w,
                  child: Text(
                    'هم اکنون می توانید آهنگ جدید ، فوق العاده شاد و بسیار بترکون دکتر از ساسی مانکن را با بهترین کیفیت های ممکن یعنی کیفیت عالی ۳۲۰ و کیفیت کم حجم خیلی خوب ۱۲۸ همراه با متن آهنگ دکتر ساسی مانکن از رسانه موزیکیشو دانلود کنید.سلام همراه با متن آهنگ دکتر ساسی مانکن از رسانه موزیکیشو دانلود کنید.سلام',
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