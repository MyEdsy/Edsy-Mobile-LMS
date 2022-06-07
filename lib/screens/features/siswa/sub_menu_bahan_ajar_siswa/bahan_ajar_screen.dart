import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../constants.dart';
import '../home_siswa.dart';
import 'components/body.dart';

class SubMenuBahanajarSiswa extends StatefulWidget {
  static String routeName = "/sub_manu_bahan_ajar_siswa";
  @override
  _SubMenuBahanajarSiswa createState() => _SubMenuBahanajarSiswa();
}

class _SubMenuBahanajarSiswa extends State<SubMenuBahanajarSiswa> {
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
    //   MaterialPageRoute(builder: (context) => HomeSiswa()),
    // );
    Navigator.pushNamed(context, HomeSiswa.routeName, arguments: {'to': 1});
    return Future.value(true);
  }
}
