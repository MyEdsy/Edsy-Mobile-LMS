import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/detail_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/components/body_form_input_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/body_form_input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';

class InputSoalQuiz extends StatefulWidget {
  const InputSoalQuiz({Key? key}) : super(key: key);
  static String routeName = "/input_soal_quiz";
  static var data;
  @override
  _InputSoalQuiz createState() => _InputSoalQuiz();
}

class _InputSoalQuiz extends State<InputSoalQuiz> {
  @override
  Widget build(BuildContext context) {
    InputSoalQuiz.data =
    ModalRoute.of(context)!.settings.arguments;
    print(InputSoalQuiz.data);
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
              title: HeadersForMenu('Quiz'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputSoalQuiz()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailQuiz.routeName,
        arguments: {"id" :InputSoalQuiz.data['idTugas']});
    return Future.value(true);
  }
}
