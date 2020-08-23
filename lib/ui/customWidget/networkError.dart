import 'package:SewerBaghdad/bloc/allPostsBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkError extends StatelessWidget {
  final msg;
//  bool flage;

  NetworkError(this.msg);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/no_wifi.png",
            width: 150,
          ),
          Text(msg),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 20, left: 60, right: 60),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  elevation: 5,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("اعادة المحاوله",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  onPressed: () {
                    print("ui pressed");
                    BlocProvider.of<AllPostsBloc>(context)
                        .add(FetchAllPosts(p: 1, flage: true));
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
