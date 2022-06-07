import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid/components/bodyhome.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class WaliMuridScreen extends StatelessWidget {
  static String routeName = "/walimurid_screen";

 const WaliMuridScreen({Key? key}) : super(key: key);
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
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 2),
                child: Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: const Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(icon: const Icon(Icons.notifications), color: Colors.grey, onPressed: () {}),
                )
            ),
          ],
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyHomeWaliMurid ());
  }
}
