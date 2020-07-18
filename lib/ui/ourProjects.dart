import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class ourProjects extends StatefulWidget {
  String title;
  String body;
  String appTitle;
  bool flage = false;
  ourProjects(this.title, this.body, this.appTitle, [this.flage = false]);

  @override
  _ourProjectsState createState() => _ourProjectsState();
}

class _ourProjectsState extends State<ourProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: Directionality(
            child: Text(
              widget.appTitle,
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
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(widget.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Text(widget.body,
                          style: TextStyle(fontSize: 15, letterSpacing: 1)),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: widget.flage
                    ? Text("فديو تعريفي عن الدائرة ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                    : Container(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: widget.flage
                    ? Stack(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/majari.jpg",
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                                onTap: () async {
                                  var url =
                                      'https://www.youtube.com/watch?v=ULEFrRSPXFE&list=PL0dzCUj1L5JH5wDLTKAmzFgsuxum-_5K4';

                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      universalLinksOnly: true,
                                    );
                                  } else {
                                    throw 'There was a problem to open the url: $url';
                                  }
                                },
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: Colors.white,
                                  size: 50,
                                )),
                          )
                        ],
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
