import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../tugas_scareens.dart';
import 'components/body.dart';

class MenuTugasSiswa extends StatefulWidget {
  static String routeName = "/menu_tugas_siswa";
  static var dataMapelPerIndex;
  @override
  _SubMenuTugas createState() => _SubMenuTugas();
}

class _SubMenuTugas extends State<MenuTugasSiswa> {
  @override
  Widget build(BuildContext context) {
    MenuTugasSiswa.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('TUGAS'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: Body(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubMenuTugasSiswa()),
    );
    return Future.value(true);
  }
}
