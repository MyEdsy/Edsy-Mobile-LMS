import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import 'components/body_nilai.dart';


class LihatNilaiSiswa extends StatelessWidget {
  static String routeName = "/siswa_lihat_nilai";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Lihat Nilai Pengetahuan'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyNilaiSiswa()
    );
  }
}
