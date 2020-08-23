import 'package:SewerBaghdad/bloc/postsBloc.dart';
import 'package:SewerBaghdad/models/bannerModel.dart';
import 'package:SewerBaghdad/ui/allProjects.dart';
import 'package:SewerBaghdad/ui/bottomPages/aboutUs.dart';
import 'package:SewerBaghdad/ui/customWidget/sliderSection.dart';
import 'package:SewerBaghdad/ui/customWidget/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../allNewsScreen.dart';
import '../displayPdf.dart';
import '../ourProjects.dart';
import 'main_body_card.dart';

class MainScreenBody extends StatelessWidget {
  MainScreenBody({
    Key key,
    @required this.refreshController,
    @required this.current,
    @required this.banners,
  }) : super(key: key);

  final RefreshController refreshController;
  final int current;

  // final String pdfPath;
  final BannerModel banners;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: true,
        header: WaterDropMaterialHeader(),
        controller: refreshController,
        onRefresh: () {
          BlocProvider.of<PostsBloc>(context).add(FetchPosts());

          refreshController.refreshCompleted();
        },
        onLoading: () {},
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
                    Widget>[
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Directionality(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return AllNews();
                              }));
                            },
                            child: Text("عرض الكل",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Directionality(
                        child: Text(
                          "أخر الأخبار",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
              SliderSection(current: current, banners: banners),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Directionality(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "معلومات عن الدائرة",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return OurProjects(
                                    servicesTitle, servicesBody, "خدماتنا");
                              }));
                            },
                            child: Cards("خدماتنا", Icons.room_service),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return AboutUsScreen();
                                }));
                              },
                              child: Cards("تواصل معنا", Icons.contact_phone)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return AllProjectsScreen();
                                }));
                              },
                              child: Cards(
                                  "مشاريع الدائرة", Icons.account_balance)),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return AboutUsScreen();
                                }));
                              },
                              child: Cards("أوقات الدوام", Icons.alarm)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return OurProjects(
                                      "علاقات الدائرة", relaitions, "علاقاتنا");
                                }));
                              },
                              child: Cards("علاقاتنا", Icons.people)),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PDFScreen(),
                                  ),
                                );
                              },
                              child:
                                  Cards("الهيكل التنظيمي", Icons.insert_chart)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return OurProjects("نبذة تعريفية", aboutUs,
                                      "عن الدائرة", true);
                                }));
                              },
                              child: Cards("نبذة تعريفية", Icons.info)),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return OurProjects(planTitle, planBody,
                                      "الخطة الأستراتيجية");
                                }));
                              },
                              child: Cards("الخطة الأستراتيجية",
                                  Icons.playlist_add_check)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
