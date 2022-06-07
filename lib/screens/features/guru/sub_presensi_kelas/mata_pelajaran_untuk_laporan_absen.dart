import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import 'components/body_mata_pelajaran_absen.dart';
import 'components/body_mata_pelajaran_laporan_absen.dart';


class MataPelajaranUntukLaporanAbsen extends StatelessWidget {
  static String routeName = "/laporan_absnsi_pilih_mata_pelajaran";
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
        body: BodyMataPelajaranUntukLaporanAbsen()
    );
  }
}
