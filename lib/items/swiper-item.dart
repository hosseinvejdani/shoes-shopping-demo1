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
      width: double.infinity,
      height: 210,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          double radi = 10.0;
          return ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(radi),
                topRight: Radius.circular(radi),
                topLeft: Radius.circular(radi),
                bottomLeft: Radius.circular(radi)),
            child: Image.asset(
              'assets/images/swiper-banners/banner-${index+1}.jpggg',
            ),
          );
        },
        itemCount: 5,
        autoplay: true,
        duration: 300,
        viewportFraction: 0.85,
        scale: 0.9,
        loop: true,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
