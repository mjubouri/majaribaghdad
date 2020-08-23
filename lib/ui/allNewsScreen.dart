import 'package:SewerBaghdad/bloc/allPostsBloc.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:SewerBaghdad/ui/ui_element/allNewsCard.dart';
import 'package:SewerBaghdad/ui/ui_element/bottomLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customWidget/circularProgress.dart';
import 'customWidget/networkError.dart';

class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AllPostsBloc(repo: PostsRepository())
          ..add(FetchAllPosts(p: 1, flage: false)),
        child: AllNewsChild());
  }
}

class AllNewsChild extends StatefulWidget {
  @override
  _AllNewsChildState createState() => new _AllNewsChildState();
}

class _AllNewsChildState extends State<AllNewsChild> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  AllPostsBloc _postBloc;
  int pageNum = 1;

  @override
  void initState() {
    super.initState();
    _postBloc = BlocProvider.of<AllPostsBloc>(context);
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            iconTheme: new IconThemeData(color: Colors.white),
            title: Directionality(
              child: Text(
                "الأخبار",
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
            padding: EdgeInsets.all(5),
            child: BlocBuilder<AllPostsBloc, AllPostsState>(
                // ignore: missing_return
                builder: (context, state) {
              if (state is AllPostsUninitialized) {
                return Center(
                  child: Container(
                      width: 40, height: 40, child: CircularProgress()),
                );
              }
              if (state is AllPostsNetworkError) {
                pageNum = 1;
                return NetworkError("لا يوجد اتصال");
              }
              if (state is AllPostsError) {
                pageNum = 1;
                return NetworkError(state.string);
              }
              if (state is AllPostsLoaded) {
                pageNum += 1;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.allPosts.length
                        ? Container(
                            child: state.allPosts.length < 5
                                ? Container()
                                : BottomLoader())
                        : NewsCard(data: state.allPosts[index], index: index);
                  },
                  itemCount: state.hasReachedMax
                      ? state.allPosts.length
                      : state.allPosts.length + 1,
                  controller: _scrollController,
                );
              } else {
                return Container(
                  child: Center(child: Text("something wrong")),
                );
              }
            })));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      print("p ui " + pageNum.toString());
      _postBloc.add(FetchAllPosts(p: pageNum, flage: false));
    }
  }
// bool handelScrollNotification(ScrollNotification scroll) {
//   if (scroll is ScrollEndNotification &&
//       _scrollController.position.extentAfter == 0) {
//     _postBloc.add(FetchAllPosts(p: 1, flage: false));
//   }
//   return false;
// }
}
