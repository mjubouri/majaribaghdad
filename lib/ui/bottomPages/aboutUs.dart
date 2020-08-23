import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: Directionality(
            child: Text(
              "عن الدائرة",
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
      body: new Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Directionality(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 5),
                                    child:
                                        Image.asset("assets/images/call.png")),
                              ),
                              Text(
                                "07901194886",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Directionality(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 5),
                                    child:
                                        Image.asset("assets/images/gmail.png")),
                              ),
                              Text(
                                "mmpwswrbag@gmail.com",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Directionality(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 5),
                                    child: Image.asset(
                                        "assets/images/facebook.png")),
                              ),
                              Text(
                                "مديرية مجاري محافظة بغداد",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Directionality(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 5),
                                    child:
                                        Image.asset("assets/images/clock.png")),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    "أوقات الدوام الرسمي: من الساعة الثامنة صباحا حتى الساعة الثالثة بعد الظهر",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
