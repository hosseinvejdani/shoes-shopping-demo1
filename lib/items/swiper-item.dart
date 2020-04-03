import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperItem extends StatefulWidget {
  @override
  _SwiperItemState createState() => _SwiperItemState();
}

class _SwiperItemState extends State<SwiperItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 220,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            "assets/images/swiper-banners/banner (${index + 1}).jpg",
            fit: BoxFit.fill,
          );
        },
        itemCount: 5,
        autoplay: true,
        duration: 300,
        loop: true,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
