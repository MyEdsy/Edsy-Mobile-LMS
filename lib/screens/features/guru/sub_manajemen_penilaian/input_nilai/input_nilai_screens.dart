import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import '../sub_menu_penilaian_screen.dart';
import 'components/body.dart';

class ManajemenNilai extends StatefulWidget{
  static String routeName = "/manajemen_nilai";
  @override
  _ManajemenNilai createState() => _ManajemenNilai();
}

class _ManajemenNilai extends State<ManajemenNilai> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Manajemen Nilai'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: Body()
    ), onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, SubMenuManajemenPenilaian.routeName);
    return Future.value(true);
  }
}
