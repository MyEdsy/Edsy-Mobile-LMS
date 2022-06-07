import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/body.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/body_lihat_nilai.dart';
import '../../../../../constants.dart';


class SubWaliKelasLihatNilai extends StatelessWidget {
  static String routeName = "/sub_wali_kelas_lihat_nilai";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Lihat Nilai'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyLihatNilai()
    );
  }
}
