import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/components/body_mata_pelajaran.dart';
import '../../../../../constants.dart';

class WaliMuridMataPelajaranLiatAbsen extends StatelessWidget {
  static String routeName = "/walimurid_siswa_mata_pelajaran_absen";

  const WaliMuridMataPelajaranLiatAbsen({Key? key}) : super(key: key);
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
        body: const WaliMuridBodyMataPelajaranAbsen()
    );
  }
}
