import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/screens/features/guru/home/components/body.dart';

import '../../../../constants.dart';


class GuruScreen extends StatefulWidget {
  static String routeName = "/home_guru";

  @override
  State createState() => _GuruScreen();
}

class _GuruScreen extends State<GuruScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getEffect();
  }

  @override
  Widget build(BuildContext context) {
    // getEffect();
    return Scaffold(
        // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          automaticallyImplyLeading: false,
          title: HeadersForHome(''),
          actions: [
            Container(
              child: Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: Icon(Icons.notifications), color: Colors.grey, onPressed: () {}),
              )
            ),
          ],
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        // body: isLoading ? buildEffect() : Body()
        body: Body()
    );
  }
}
