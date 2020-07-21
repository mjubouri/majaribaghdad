import 'package:SewerBaghdad/models/allProjectsModel.dart';
import 'package:SewerBaghdad/models/posts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../newsDetails.dart';

class projectsCard extends StatelessWidget {
  RowDataProjects data;
  int index;
    projectsCard({
    Key key,
    this.data,this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                height: 130,
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: <Widget>[
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          data
                              .title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black),
                        )),
                   
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(2),
                            width: 85,
                            height: 30,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(20),
                              child: RaisedButton(
                                color: Theme.of(context)
                                    .primaryColor,
                                elevation: 5,
                                onPressed: () {  },
                                child: Directionality(
                                  textDirection:
                                      TextDirection.rtl,
                                  child: Text("التفاصيل",
                                      style: TextStyle(
                                          color:
                                              Colors.white,
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight
                                                  .bold)),
                                ),
                              
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                transitionOnUserGestures: true,
                tag: "image$index",
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                  imageUrl: data.image,
                  placeholder: (context, url) =>
                      Image.asset(
                          "assets/images/logo.jpg"),
                  errorWidget: (context, url, error) =>
                      Image.asset(
                          "assets/images/logo.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}