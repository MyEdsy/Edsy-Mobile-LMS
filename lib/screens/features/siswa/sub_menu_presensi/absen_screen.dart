import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import 'components/body_absen.dart';


class DetailAbsenSiswa extends StatelessWidget {
  static String routeName = "/siswa_absen_detail";
  static var dataMapelFromRoutes;
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
        body: BodyLaporanAbsenSiswaMenuWaliKelas()
    );
  }
}
