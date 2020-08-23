import 'package:SewerBaghdad/bloc/allPostsBloc.dart';
import 'package:SewerBaghdad/bloc/projectsBloc.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:SewerBaghdad/ui/ui_element/bottomLoader.dart';
import 'package:SewerBaghdad/ui/ui_element/project_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customWidget/circularProgress.dart';
import 'customWidget/networkError.dart';

class AllProjectsScreen extends StatefulWidget {
  @override
  _AllProjectsScreenState createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProjectsBloc(repo: PostsRepository())
          ..add(FetchAllProjects(p: 1, flage: false)),
        child: AllProjectsChild());
  }
}

class AllProjectsChild extends StatefulWidget {
  @override
  _AllProjectsChildState createState() => new _AllProjectsChildState();
}

class _AllProjectsChildState extends State<AllProjectsChild> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ProjectsBloc _postBloc;
  int pageNum = 1;

  @override
  void initState() {
    super.initState();
    _postBloc = BlocProvider.of<ProjectsBloc>(context);
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
                "المشاريع",
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
            child: BlocBuilder<ProjectsBloc, ProjectsState>(
                builder: (context, state) {
              if (state is ProjectsUninitialized) {
                return Center(
                  child: Container(
                      width: 40, height: 40, child: CircularProgress()),
                );
              }
              if (state is AllPostsNetworkError) {
                pageNum = 1;
                return NetworkError("لا يوجد اتصال");
              }
              if (state is ProjectsError) {
                pageNum = 1;
                return NetworkError(state.string);
              }
              if (state is ProjectsLoaded) {
                pageNum += 1;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.allPosts.length
                        ? Container(
                            child: state.allPosts.length < 5
                                ? Container()
                                : BottomLoader())
                        : ProjectCard(
                            data: state.allPosts[index], index: index);
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
      _postBloc.add(FetchAllProjects(p: pageNum, flage: false));
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
