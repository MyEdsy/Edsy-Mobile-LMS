import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/components/body_detail_tugas.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/tugas_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class WaliMuridDetailTugasSiswa extends StatefulWidget {
  static String routeName = "/walimurid_detail_tugas_siswa";
  static var dataTugasFromDetailTugas;

  const WaliMuridDetailTugasSiswa({Key? key}) : super(key: key);
  @override
  _DetailTugas createState() => _DetailTugas();
}

class _DetailTugas extends State<WaliMuridDetailTugasSiswa> {

  @override
  Widget build(BuildContext context) {
    WaliMuridDetailTugasSiswa.dataTugasFromDetailTugas = ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('Detail Tugas'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const WaliMuridBodyDetailTugasSiswa(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, WaliMuridMenuTugasSiswa.routeName,
        arguments: WaliMuridMenuTugasSiswa.dataMapelPerIndex);
    return Future.value(true);
  }

}
