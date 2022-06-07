import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/components/body.dart';

import '../../../../../constants.dart';
import '../home_guru.dart';

class SubMenuManajemenPenilaian extends StatefulWidget {
  static String routeName = "/sub_manajemen_nilai";
  @override
  _SubMenuManajemenPenilaian createState() => _SubMenuManajemenPenilaian();
}

class _SubMenuManajemenPenilaian extends State<SubMenuManajemenPenilaian> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blueGrey,
          onPressed: () {
            _onBackPressed();
          },
        ),
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Manajemen Nilai'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: Body(),
    ), onWillPop: _onBackPressed);
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
