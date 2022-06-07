import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/detail_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/detail_ujian_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body.dart';

class SoalUjian extends StatefulWidget {
  static String routeName = "/soal_ujian";
  static var dataTugas;
  @override
  _SoalUjian createState() => _SoalUjian();
}

class _SoalUjian extends State<SoalUjian> {

  @override
  Widget build(BuildContext context) {
    SoalUjian.dataTugas = ModalRoute.of(context)!.settings.arguments as Map;
    print(SoalUjian.dataTugas);
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('SOAL'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: Body(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailUjian.routeName,
        arguments: {"id": SoalUjian.dataTugas['idTugas']});
    return Future.value(true);
  }

}
