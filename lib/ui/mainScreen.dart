import 'dart:async';
import 'dart:io';
import 'package:SewerBaghdad/bloc/postsBloc.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:SewerBaghdad/ui/ui_element/mainScreenBody.dart';
import 'package:SewerBaghdad/ui/ui_element/notificationSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'customWidget/circularProgress.dart';
import 'customWidget/networkError.dart';
import 'customWidget/networkError2.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => new _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int _current = 0;

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  String pdfPath = "";
  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdf.pdf', 'pdf.pdf').then((f) {
      setState(() {
        pdfPath = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) {
        return PostsBloc(Repo: PostsRepository())..add(FetchPosts());
      },
      child: Container(
          child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is PostsLoading) {
          return Center(
            child: Container(width: 40, height: 40, child: circularProgress()),
          );
        }
        if (state is PostsNetworkError) {
          return networkError2("لا يوجد اتصال");
        }
        if (state is PostsError) {
          return networkError2("حدث خطأ ما");
        }
        if (state is PostsLoaded) {
          return Column(
            children: <Widget>[
              notificationSlider(state.notifications),
              mainScreenBody(
                current: _current,
                refreshController: _refreshController,
                banners: state.banners,
              )
            ],
          );
        }
      })),
    ));
  }
}
