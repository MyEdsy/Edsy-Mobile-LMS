import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/components/body.dart';

import '../../../../../constants.dart';
import '../home_guru.dart';

class SubMenuPresensiKelas extends StatefulWidget {
  static String routeName = "/sub_presensi_kelas";
  @override
  _SubMenuPresensiKelas createState() => _SubMenuPresensiKelas();
}

class _SubMenuPresensiKelas extends State<SubMenuPresensiKelas> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            // Setting up AppBar
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              // automaticallyImplyLeading: false,
              title: HeadersForMenu('Presensi Kelas'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: Body()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeGuru()),
    // );
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: HomeGuru(),
      ),
    );
    return Future.value(true);
  }
}
