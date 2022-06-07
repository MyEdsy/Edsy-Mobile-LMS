import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/components/body_nilai.dart';
import '../../../../../constants.dart';


class WaliMuridLihatNilaiSiswa extends StatelessWidget {
  static String routeName = "/walimurid_siswa_lihat_nilai";

  const WaliMuridLihatNilaiSiswa({Key? key}) : super(key: key);
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
        body: const WaliMuridBodyNilaiSiswa()
    );
  }
}
