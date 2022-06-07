import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/components/body.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class WaliMuridMenuTugasSiswa extends StatefulWidget {
  static String routeName = "/walimurid_menu_tugas_siswa";
  static var dataMapelPerIndex;

  const WaliMuridMenuTugasSiswa({Key? key}) : super(key: key);
  @override
  _SubMenuTugas createState() => _SubMenuTugas();
}

class _SubMenuTugas extends State<WaliMuridMenuTugasSiswa> {
  @override
  Widget build(BuildContext context) {
    WaliMuridMenuTugasSiswa.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('TUGAS SAYA'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: BodyTugas(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WaliMuridSubMenuTugasSiswa()),
    );
    return Future.value(true);
  }
}
