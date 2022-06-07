import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import 'components/body_absen.dart';
import 'components/body_detail_absen.dart';


class DetailAbsenSiswaPerTanggal extends StatelessWidget {
  static String routeName = "/detail_absen_persiswa";
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
        body: BodyDetailAbsenPersiswa()
    );
  }
}
