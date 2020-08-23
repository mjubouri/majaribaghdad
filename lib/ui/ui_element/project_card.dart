import 'package:SewerBaghdad/models/PostModel.dart';
import 'package:SewerBaghdad/models/ProjectModel.dart';
import 'package:SewerBaghdad/ui/customWidget/strings.dart';
import 'package:SewerBaghdad/ui/newsDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final ProjectData data;
  final int index;

  ProjectCard({Key key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          data.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(2),
                            width: 85,
                            height: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                elevation: 5,
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                  return NewsDetailsScreen(
                                      null,
                                      true,
                                      PostData(
                                          title: data.title,
                                          id: data.id,
                                          content: data.content,
                                          image: data.image));
                                })),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text("التفاصيل",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
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
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .3,
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return NewsDetailsScreen(
                                    index,
                                    false,
                                    PostData(
                                        title: data.title,
                                        id: data.id,
                                        content: data.content,
                                        image: data.image));
                              })),
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: "image$index",
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      imageUrl: baseMediaUrl + data.image,
                      placeholder: (context, url) =>
                          Image.asset("assets/images/logo.jpg"),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/logo.jpg"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
