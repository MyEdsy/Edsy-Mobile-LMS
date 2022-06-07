import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../constants.dart';
import '../home_guru.dart';
import 'components/body.dart';

class SubMenuUjian extends StatefulWidget {
  static String routeName = "/sub_menu_ujian";
  @override
  _SubMenuUjian createState() => _SubMenuUjian();
}

class _SubMenuUjian extends State<SubMenuUjian> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   color: Colors.blueGrey,
            //   onPressed: () {
            //     _onBackPressed();
            //   },
            // ),
            // automaticallyImplyLeading: false,
            title: HeadersForMenu('Ujian'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: SubmenuUjianBody(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeGuru()),
    // );
    Navigator.pushNamed(context, HomeGuru.routeName, arguments: {'to': 1});
    return Future.value(true);
  }
}
