import 'package:SewerBaghdad/ui/customWidget/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Center(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(servicesTitle,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      Text(
                        servicesBody,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
