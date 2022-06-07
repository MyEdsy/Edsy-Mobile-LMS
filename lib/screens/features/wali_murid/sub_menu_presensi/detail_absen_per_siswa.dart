import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/components/body_detail_absen.dart';
import '../../../../../constants.dart';


class WaliMuridDetailAbsenSiswaPerTanggal extends StatelessWidget {
  static String routeName = "/walimurid_detail_absen_persiswa";

  const WaliMuridDetailAbsenSiswaPerTanggal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Detail Absen'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: const WaliMuridBodyDetailAbsenPersiswa()
    );
  }
}
