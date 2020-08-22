import 'dart:async';

import 'package:SewerBaghdad/models/PostModel.dart';
import 'package:SewerBaghdad/models/bannerModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class newsDetailsScreen extends StatefulWidget {
  int index;
  bool flage = false;
  PostData item;
  
  newsDetailsScreen([this.index, this.flage, this.item]);

  @override
  _newsDetailsScreenState createState() => new _newsDetailsScreenState();
}

class _newsDetailsScreenState extends State<newsDetailsScreen> {

  double pos=700;

@override
  void initState() {
    
   Timer(Duration(milliseconds: 400), () {
     setState(() {
       pos=260;
     }
     );
  
});
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: new IconThemeData(color: Colors.white),
            title: Directionality(
              child: Text(
                "تفاصيل الخبر",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              textDirection: TextDirection.rtl,
            ),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Hero(
                    tag: widget.flage
                        ? "hero${widget.index}"
                        : "image${widget.index}",
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      imageUrl: widget.item.image,
                      placeholder: (context, url) =>
                          Image.asset("assets/images/logo.jpg"),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/logo.jpg"),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top:pos,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 400),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 260,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20, bottom: 10, top: 10, left: 10),
                            child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  widget.item.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, bottom: 15),
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      "تاريخ النشر",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[800]),
                                    )),
                              )
                            ],
                          ),
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Expanded(
                                flex: 1,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 10),
                                    child: Text(
                                      widget.item.content,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[800]),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
