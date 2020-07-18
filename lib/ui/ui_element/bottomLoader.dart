import 'package:flutter/material.dart';


class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 35,
          height: 35,
          child: Theme(
                      data: ThemeData(accentColor: Colors.white),
                      child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }
}