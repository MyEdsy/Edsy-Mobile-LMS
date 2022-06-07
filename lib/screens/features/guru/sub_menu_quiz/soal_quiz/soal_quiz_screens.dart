import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/detail_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body.dart';

class SoalQuiz extends StatefulWidget {
  static String routeName = "/soal_quiz";
  static var dataTugas;
  @override
  _SoalQuiz createState() => _SoalQuiz();
}

class _SoalQuiz extends State<SoalQuiz> {

  @override
  Widget build(BuildContext context) {
    SoalQuiz.dataTugas = ModalRoute.of(context)!.settings.arguments as Map;
    print(SoalQuiz.dataTugas);
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
    Navigator.pushNamed(context, DetailQuiz.routeName,
        arguments: {
      "id": SoalQuiz.dataTugas['idTugas'],
      "keterangan": SoalQuiz.dataTugas['keterangan']
    });
    return Future.value(true);
  }

}
