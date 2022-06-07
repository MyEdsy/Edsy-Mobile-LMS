import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/components/body_update_soal_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/soal_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';

class UpdateSoalQuiz extends StatefulWidget {
  const UpdateSoalQuiz({Key? key}) : super(key: key);
  static String routeName = "/update_soal_quiz";
  static var data;
  @override
  _UpdateSoalQuiz createState() => _UpdateSoalQuiz();
}

class _UpdateSoalQuiz extends State<UpdateSoalQuiz> {
  @override
  Widget build(BuildContext context) {
    UpdateSoalQuiz.data = ModalRoute.of(context)!.settings.arguments;
    print(UpdateSoalQuiz.data);
    return WillPopScope(
        child: Scaffold(
            // Setting up AppBar
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.blueGrey,
                onPressed: () {
                  _onBackPressed();
                },
              ),
              // automaticallyImplyLeading: false,
              title: HeadersForMenu('Update Soal'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyUpdateSoalQuiz()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, SoalQuiz.routeName, arguments: {
      "idDetailSoal": UpdateSoalQuiz.data['idDetailSoal'],
      "idTugas": UpdateSoalQuiz.data['idTugas'],
    });
    return Future.value(true);
  }
}
