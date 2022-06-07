import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import 'componen/body_mata_pelajaran.dart';


class MataPelajaranMenuWaliKelas extends StatelessWidget {
  static String routeName = "/sub_wali_kelas_mata_pelajaran";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Nilai Siswa'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyMataPelajaran()
    );
  }
}
