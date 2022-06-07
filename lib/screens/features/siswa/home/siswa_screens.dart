import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'components/body.dart';

class SiswaScreen extends StatelessWidget {
  static String routeName = "/home_siswa";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          automaticallyImplyLeading: false,
          title: HeadersForHome('EDSY'),
          actions: [
            Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 2),
                child: Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(icon: Icon(Icons.notifications), color: Colors.grey, onPressed: () {}),
                )
            ),
            // Container(
            //   // padding: EdgeInsets.all(5),
            //   // margin: EdgeInsets.only(right: 2),
            //   child: IconButton(
            //       onPressed: () => {},
            //       icon: Icon(Icons.person, color: Colors.grey, size: 30,)),
            // ),
          ],
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: Body());
  }
}
