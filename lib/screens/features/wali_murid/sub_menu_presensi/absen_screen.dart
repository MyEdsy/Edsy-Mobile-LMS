import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/components/body_absen.dart';
import '../../../../../constants.dart';


class WaliMuridDetailAbsenSiswa extends StatelessWidget {
  static String routeName = "/walimurid_siswa_absen_detail";
  static var dataMapelFromRoutes;

  const WaliMuridDetailAbsenSiswa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dataMapelFromRoutes =
    ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Lihat Absen'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: const WaliMuridBodyLaporanAbsenSiswaMenuWaliKelas()
    );
  }
}
