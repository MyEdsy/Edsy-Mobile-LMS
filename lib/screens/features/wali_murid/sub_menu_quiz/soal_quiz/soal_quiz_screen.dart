import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/detail_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/detail_quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/soal_quiz/components/body.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class WaliMuridSoalQuizSiswa extends StatefulWidget {
  static String routeName = "/walimurid_soal_quiz_siswa";
  static var dataTugas;

  const WaliMuridSoalQuizSiswa({Key? key}) : super(key: key);
  @override
  _SoalTugasSiswa createState() => _SoalTugasSiswa();
}

class _SoalTugasSiswa extends State<WaliMuridSoalQuizSiswa> {
  @override
  Widget build(BuildContext context) {
    WaliMuridSoalQuizSiswa.dataTugas =
        ModalRoute.of(context)!.settings.arguments as Map;
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
          body: const BodySoalQuiz(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, WaliMuridDetailQuizSiswa.routeName, arguments: {
      "id": WaliMuridSoalQuizSiswa.dataTugas['idTugas'],
      "keterangan": WaliMuridSoalQuizSiswa.dataTugas['keterangan']
    });
    return Future.value(true);
  }
}
