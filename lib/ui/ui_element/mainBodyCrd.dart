
import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  String s;
  IconData icon;
  cards(
    this.s, this.icon) ;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Directionality(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [
                              0.15,
                              1.0
                            ],
                            colors: [
                            Theme.of(context).primaryColor,
                             Theme.of(context).primaryColor,
                            ])),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    )),
                Text(
                  s,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
          ),
          textDirection: TextDirection.rtl,
        ));
  }
}