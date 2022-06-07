import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/body_input_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'component/body_input_ujian.dart';

class InputUjian extends StatefulWidget {
  static String routeName = "/input_ujian";
  static var dataMapelPerIndex;
  @override
  _InputQuiz createState() => _InputQuiz();
}

class _InputQuiz extends State<InputUjian> {
  @override
  Widget build(BuildContext context) {
    InputUjian.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    print(jsonEncode(InputUjian.dataMapelPerIndex));
    SizeConfig().init(context);
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
              title: HeadersForMenu('Input Ujian'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputUjian()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuUjian.routeName,
        arguments: InputUjian.dataMapelPerIndex);
    return Future.value(true);
  }
}
