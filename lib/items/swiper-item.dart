import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperItem extends StatefulWidget {
  @override
  _SwiperItemState createState() => _SwiperItemState();
}

class _SwiperItemState extends State<SwiperItem> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      height: 0.5 * w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          double radi = 10.0;
          return GestureDetector(
            onTap: (){print('taped on banner image');},
            child: ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.all(Radius.circular(radi)),
              child: Image.asset(
                'assets/images/swiper-banners/banner-${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: 5,
        autoplay: true,
        duration: 300,
        //viewportFraction: 1,
        //scale: 0.9,
        loop: true,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
