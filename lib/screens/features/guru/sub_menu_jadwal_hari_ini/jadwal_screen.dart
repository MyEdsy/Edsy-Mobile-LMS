import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import '../home_guru.dart';
import 'component/body.dart';

class JadwalKelasGuru extends StatefulWidget {
  static String routeName = "/jadwal_kelas_guru";
  @override
  State createState() => _JadwalKelasGuru();
}
class _JadwalKelasGuru extends State<JadwalKelasGuru> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Jadwal'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: Body()
    ), onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeGuru()),
    // );
    // Navigator.pushNamedAndRemoveUntil(context, HomeGuru.routeName, (r)=>false);
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
