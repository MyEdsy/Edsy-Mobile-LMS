import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas/tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body.dart';
import 'components/body_detail_tugas.dart';

class DetailTugasSiswa extends StatefulWidget {
  static String routeName = "/detail_tugas_siswa";
  static var dataTugasFromDetailTugas;
  @override
  _DetailTugas createState() => _DetailTugas();
}

class _DetailTugas extends State<DetailTugasSiswa> {
  @override
  Widget build(BuildContext context) {
    DetailTugasSiswa.dataTugasFromDetailTugas =
        ModalRoute.of(context)!.settings.arguments as Map;
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
          body: BodyDetailTugasSiswa(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuTugasSiswa.routeName,
        arguments: MenuTugasSiswa.dataMapelPerIndex);
    return Future.value(true);
  }
}
