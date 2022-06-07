import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import 'components/body_mata_pelajaran.dart';


class MataPelajaranLiatAbsen extends StatelessWidget {
  static String routeName = "/siswa_mata_pelajaran_absen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Lihat Absen'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyMataPelajaranAbsen()
    );
  }
}
