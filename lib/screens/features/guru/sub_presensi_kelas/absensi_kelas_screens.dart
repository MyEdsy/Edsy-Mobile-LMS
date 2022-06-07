import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/components/body.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/components/body_absen_kelas.dart';

import '../../../../../constants.dart';
import '../../../../size_config.dart';
import 'components/body_mata_pelajaran_absen.dart';
import 'mata_pelajaran_untuk_absen_screen.dart';

class AbsenKelasScreen extends StatefulWidget {
  static String routeName = "/absnsi_kelas";
  static var dataMapel;
  @override
  _AbsenKelasScreen createState() => _AbsenKelasScreen();
}

class _AbsenKelasScreen extends State<AbsenKelasScreen> {
  
  @override
  Widget build(BuildContext context) {
    AbsenKelasScreen.dataMapel = ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Presensi Siswa'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyAbsenKelas()
    ), onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MataPelajaranUntukAbsen()),
    );
    return Future.value(true);
  }
}
