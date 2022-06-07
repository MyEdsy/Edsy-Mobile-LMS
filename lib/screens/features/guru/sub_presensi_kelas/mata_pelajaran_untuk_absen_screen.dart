import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/sub_presensi_kelas.dart';

import '../../../../../constants.dart';
import 'components/body_mata_pelajaran_absen.dart';

class MataPelajaranUntukAbsen extends StatefulWidget {
  static String routeName = "/absnsi_pilih_mata_pelajaran";
  @override
  _MataPelajaranUntukAbsen createState() => _MataPelajaranUntukAbsen();
}

class _MataPelajaranUntukAbsen extends State<MataPelajaranUntukAbsen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            // Setting up AppBar
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              // automaticallyImplyLeading: false,
              title: HeadersForMenu('Presensi'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyMataPelajaranUntukAbsen()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubMenuPresensiKelas()),
    );
    return Future.value(true);
  }
}
