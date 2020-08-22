import 'package:SewerBaghdad/models/TickerPosts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class notificationSlider extends StatelessWidget {
  TickerPosts notifications;

  notificationSlider(
    this.notifications, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: notifications.data.length,
      height: 30,
      reverse: true,
      viewportFraction: 1.0,
      enableInfiniteScroll: true,
      autoPlay: true,
      aspectRatio: 2.0,
      autoPlayInterval: Duration(milliseconds: 3000),
      autoPlayAnimationDuration: Duration(milliseconds: 3000),
      autoPlayCurve: Curves.linear,
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      enlargeCenterPage: false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int itemIndex) => Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).accentColor,
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              notifications.data[itemIndex].content,
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
      ),
    );
  }
}
