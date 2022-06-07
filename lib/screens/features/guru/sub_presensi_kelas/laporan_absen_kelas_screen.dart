import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import 'components/body_laporan_absen_kelas.dart';
import 'components/body_mata_pelajaran_absen.dart';


class LaporanAbsenKelasScreen extends StatelessWidget {
  static String routeName = "/laporan_absnsi_kelas";
  static var dataMapelFromRoutes;
  @override
  Widget build(BuildContext context) {
    dataMapelFromRoutes =
    ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Laporan Presensi Kelas'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyLaporanAbsenSiswa()
    );
  }
}
