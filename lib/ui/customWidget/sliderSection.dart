import 'package:SewerBaghdad/models/bannerModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sliderSection extends StatefulWidget {
  sliderSection({
    Key key,
    @required int current,
    @required this.banners,
  })  : _current = current,
        super(key: key);

  int _current;
  BannerModel banners;

  @override
  _sliderSectionState createState() => _sliderSectionState();
}

class _sliderSectionState extends State<sliderSection> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        
        children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.banners.data.length,
          height: 200,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          autoPlay: true,
          aspectRatio: 2.0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 2),
          enlargeCenterPage: true,
          onPageChanged: (int index) {
            setState(() {
              widget._current = index;
            });
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int itemIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Stack(

                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 220,

                          imageUrl:
                          widget.banners.data[itemIndex].image,
                          placeholder: (context, url) =>
                              Image.asset("assets/images/logo.jpg"),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/logo.jpg"),
                        ),
                        // child: CachedNetworkImage(
                        //   fit: BoxFit.cover,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 240,

                        //   imageUrl:
                        //       images[widget._current],
                        //   placeholder: (context, url) =>
                        //       Image.asset("assets/images/placeholder.png"),
                        //   errorWidget: (context, url, error) =>
                        //       Image.asset("assets/images/placeholder.png"),
                        // ),
//                        FadeInImage(
//                          placeholder:
//                              AssetImage("assets/images/placeholder.png"),
//                          fit: BoxFit.cover,
//                          width: MediaQuery.of(context).size.width,
//                          height: 240,
//                          image: NetworkImage(
//                              baseUrlImage + widget.packages[itemIndex].file),
//                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10,left: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue[900].withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                              child: Directionality(
                                child: Text(

                                  widget.banners.data[itemIndex].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(

                                      fontSize: 20, color: Colors.white),
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Directionality(
                              child: Text(
                                  widget.banners.data[itemIndex].content,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24)),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [
                                  0.15,
                                  0.5
                                ],
                                colors: [
                                  Colors.black26.withOpacity(0.7),
                                  Colors.transparent
                                ])),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.banners.data.map((image) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget._current ==
                          widget.banners.data.indexOf(image)
                          ? Colors.deepOrange
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              }).toList(),
            ))
      ]),
    );
  }
}
