import 'package:SewerBaghdad/ui/bottomPages/reportsScreen.dart';
import 'package:SewerBaghdad/ui/bottomPages/serveces.dart';
import 'package:SewerBaghdad/ui/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: "Regular",
        primaryColor: Colors.lightBlue[900],
        accentColor: Colors.amber[600]),
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
//Remove this method to stop OneSignal Debugging

  int _selectedIndex = 0;
  String barCode = "";

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.init("5f0a5368-692a-48b4-8420-95fae35c1ef6", iOSSettings: {
      OSiOSSettings.autoPrompt: true,
      OSiOSSettings.inAppLaunchUrl: true
    });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission

    void _onItemTapped(int index) {
      setState(() {
        _page = index;
      });
    }

    String getTitle(int index) {
      if (index == 0) {
        return "الرئيسية";
      } else if (index == 1) {
        return "الشكاوي";
      } else if (index == 2) {
        return "الخدمات";
      }
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            iconTheme: new IconThemeData(color: Colors.white),
            title: Directionality(
              child: Text(
                getTitle(_page),
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
        bottomNavigationBar: BottomNavigationBar(
            // backgroundColor: Colors.white,
            // color: Colors.lightBlue,
            // buttonBackgroundColor: Colors.lightBlue,
            // height: 57,
            // animationDuration: Duration(
            //   milliseconds: 200,
            // ),
            // index: 0,
            // animationCurve: Curves.bounceInOut,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("الرئيسية"),
                  ),
                  icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  title: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("الشكاوي"),
                  ),
                  icon: Icon(Icons.supervisor_account)),
              BottomNavigationBarItem(
                  title: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("الخدمات"),
                  ),
                  icon: Icon(
                    Icons.toc,
                  )),
            ],
            onTap: (index) {
              _onItemTapped(index);
            },
            elevation: 10,
            unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).primaryColor),
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _page,
            backgroundColor: Colors.white),
        body: selectedWidget(_page));
  }

  Widget selectedWidget(int index) {
    if (index == 0) {
      return mainScreen();
    } else if (index == 1) {
      return reportScreen();
    } else if (index == 2) {
      return servecesScreen();
    }
  }
  // Future scan() async {
  //   try {
  //     String barcode = await BarcodeScanner.scan();
  //     setState(() => barCode = barcode);
  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.CameraAccessDenied) {
  //       setState(() {
  //         barCode = 'The user did not grant the camera permission!';
  //       });
  //     } else {
  //       setState(() => this.barCode = 'Unknown error: $e');
  //     }
  //   } on FormatException {
  //     setState(() => this.barCode =
  //         'null (User returned using the "back"-button before scanning anything. Result)');
  //   } catch (e) {
  //     setState(() => this.barCode = 'Unknown error: $e');
  //   }
  // }
}
