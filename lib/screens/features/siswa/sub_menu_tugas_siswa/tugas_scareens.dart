import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/home_siswa.dart';

import '../../../../constants.dart';
import 'components/body.dart';

class SubMenuTugasSiswa extends StatefulWidget {
  static String routeName = "/sub_menu_tugas_siswa";
  @override
  _SubMenuTugasSiswa createState() => _SubMenuTugasSiswa();
}

class _SubMenuTugasSiswa extends State<SubMenuTugasSiswa> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('Tugas'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: SubmenuTugasBody(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeSiswa()),
    // );
    Navigator.pushNamed(context, HomeSiswa.routeName, arguments: {'to': 1});
    return Future.value(true);
  }
}
