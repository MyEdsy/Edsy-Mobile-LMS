import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../constants.dart';
import '../home_guru.dart';
import 'components/body.dart';

class SubMenuBahanajar extends StatefulWidget {
  static String routeName = "/sub_manu_bahan_ajar";
  @override
  _SubMenuBahanajar createState() => _SubMenuBahanajar();
}

class _SubMenuBahanajar extends State<SubMenuBahanajar> {
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
            title: HeadersForMenu('Bahan Mengajar'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: Body(),
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
