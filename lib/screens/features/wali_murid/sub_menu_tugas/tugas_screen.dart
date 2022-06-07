import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/components/body.dart';

import '../../../../constants.dart';

class WaliMuridSubMenuTugasSiswa extends StatefulWidget {
  static String routeName = "/walimurid_sub_menu_tugas_siswa";

  const WaliMuridSubMenuTugasSiswa({Key? key}) : super(key: key);
  @override
  _WaliMuridSubMenuTugasSiswa createState() => _WaliMuridSubMenuTugasSiswa();
}

class _WaliMuridSubMenuTugasSiswa extends State<WaliMuridSubMenuTugasSiswa> {
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
          body: const WaliMuridSubmenuTugasBody(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeSiswa()),
    // );
    Navigator.pushNamed(context, HomeWaliMurid.routeName, arguments: {'to': 1});
    return Future.value(true);
  }
}
