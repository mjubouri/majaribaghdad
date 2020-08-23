import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: Directionality(
            child: Text(
              "أهداف الدائرة",
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
      body: Container(
        child: Center(
          child: Text("1"),
        ),
      ),
    );
  }
}
