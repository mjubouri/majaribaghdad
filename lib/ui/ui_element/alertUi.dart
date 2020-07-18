import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


showAlert(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromBottom,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Color(0xffFFB300),
      ),
    );
    Alert(
      context: context,
      type: AlertType.success,
      title: "شكرا لتواصلك معنا",
      desc: "سوف يتم مراجعة طلبك",
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "تم",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            //   return OrderScreen();
            // }));
          },
          color: Theme.of(context).primaryColor,
        ),
        // DialogButton(
        //   child: Text(
        //     "GRADIENT",
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        //   gradient: LinearGradient(colors: [
        //     Color.fromRGBO(116, 116, 191, 1.0),
        //     Color.fromRGBO(52, 138, 199, 1.0)
        //   ]),
        // )
      ],
    ).show();
  }