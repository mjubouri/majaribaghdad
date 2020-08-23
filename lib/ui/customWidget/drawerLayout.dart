import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../allNewsScreen.dart';
import '../mainScreen.dart';

class MyDrawer extends StatefulWidget {
  final int index;

  // int notifNum=0;
  //  int cartNum=0;
  MyDrawer({Key key, @required this.index}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String name = "";

  String image = "";

  int notifNum = 0;
  int cartNum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (cont) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              height: 160,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 5, top: 5),
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "الأقسام",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: () {
                    Scaffold.of(cont).openDrawer();
                    if (widget.index == 6) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return AllNews();
                      }));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return AllNews();
                      }));
                    }
                  },
                  selected: widget.index == 6 ? true : false,
                  title: Text("الأخبار", style: TextStyle(fontSize: 16)),
                  leading: Icon(Icons.playlist_add_check),
                )),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                onTap: () {
                  Scaffold.of(cont).openDrawer();
                  if (widget.index == 1) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  }
                },
                selected: widget.index == 1 ? true : false,
                title: Text("عن الدائرة", style: TextStyle(fontSize: 16)),
                leading: Icon(Icons.notifications),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                onTap: () {
                  Scaffold.of(cont).openDrawer();
                  if (widget.index == 2) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  }
                },
                selected: widget.index == 2 ? true : false,
                title: Text("نبذة تعريفية", style: TextStyle(fontSize: 16)),
                leading: Icon(Icons.local_offer),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                onTap: () {
                  Scaffold.of(cont).openDrawer();
                  if (widget.index == 3) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  }
                },
                selected: widget.index == 3 ? true : false,
                title: Text(
                  "الرسالة",
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(Icons.category),
              ),
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: () {
                    Scaffold.of(cont).openDrawer();
                    if (widget.index == 4) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    }
                  },
                  selected: widget.index == 4 ? true : false,
                  title: Text("الأهداف", style: TextStyle(fontSize: 16)),
                  leading: Icon(
                    Icons.card_giftcard,
                  ),
                )),
            Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: () {
                    Scaffold.of(cont).openDrawer();
                    if (widget.index == 5) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    }
                  },
                  selected: widget.index == 5 ? true : false,
                  title:
                      Text("المشاريع والخدمات", style: TextStyle(fontSize: 16)),
                  leading: Icon(
                    Icons.card_travel,
                  ),
                )),
            Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: () {
                    Scaffold.of(cont).openDrawer();
                    if (widget.index == 6) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    }
                  },
                  selected: widget.index == 6 ? true : false,
                  title:
                      Text("الهيكل التنظيمي", style: TextStyle(fontSize: 16)),
                  leading: Icon(Icons.playlist_add_check),
                )),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                onTap: () {
                  Scaffold.of(cont).openDrawer();
                  if (widget.index == 6) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  }
                },
                selected: widget.index == 7 ? true : false,
                title: Text("أوقات الدوام", style: TextStyle(fontSize: 16)),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                onTap: () {
                  Scaffold.of(cont).openDrawer();
                  if (widget.index == 6) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MainScreen();
                    }));
                  }
                },
                selected: widget.index == 8 ? true : false,
                title:
                    Text("الخطة الاستراتيجية", style: TextStyle(fontSize: 16)),
                leading: Icon(Icons.settings),
              ),
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: () {
                    Scaffold.of(cont).openDrawer();
                    if (widget.index == 6) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MainScreen();
                      }));
                    }
                  },
                  selected: widget.index == 6 ? true : false,
                  title:
                      Text("معلومات التواصل", style: TextStyle(fontSize: 16)),
                  leading: Icon(Icons.mail_outline),
                )),
          ],
        ),
      );
    });
  }
}
