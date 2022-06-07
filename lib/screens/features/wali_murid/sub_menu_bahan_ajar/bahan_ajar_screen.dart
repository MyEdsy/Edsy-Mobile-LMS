import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/components/body.dart';

import '../../../../constants.dart';

class SubMenuBahanajarSiswaWaliMurid extends StatefulWidget {
  static String routeName = "/walimurid_sub_manu_bahan_ajar_siswa";

  const SubMenuBahanajarSiswaWaliMurid({Key? key}) : super(key: key);
  @override
  _SubMenuBahanajarSiswaWaliMurid createState() => _SubMenuBahanajarSiswaWaliMurid();
}

class _SubMenuBahanajarSiswaWaliMurid extends State<SubMenuBahanajarSiswaWaliMurid> {
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
          body: const BodyBahanAjar(),
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
