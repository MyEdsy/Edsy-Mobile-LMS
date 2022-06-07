import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import 'componen/body_mata_pelajaran_lihat_absen.dart';


class MataPelajaranMenuWaliKelasLihatAbsen extends StatelessWidget {
  static String routeName = "/sub_wali_kelas_mata_pelajaran_absen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Absen Siswa'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyMataPelajaranLihatAbsen()
    );
  }
}
