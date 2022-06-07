import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import 'componen/body_laporan_absen.dart';


class WaliKelasLaporanAbsenKelasScreen extends StatelessWidget {
  static String routeName = "/sub_wali_kelas_laporan_absnsi_kelas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Laporan Presensi Kelas'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyLaporanAbsenSiswaMenuWaliKelas()
    );
  }
}
