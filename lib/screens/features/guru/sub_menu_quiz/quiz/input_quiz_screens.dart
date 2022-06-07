import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/body_input_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class InputQuiz extends StatefulWidget {
  static String routeName = "/input_quiz";
  static var dataMapelPerIndex;
  @override
  _InputQuiz createState() => _InputQuiz();
}

class _InputQuiz extends State<InputQuiz> {
  @override
  Widget build(BuildContext context) {
    InputQuiz.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    print(jsonEncode(InputQuiz.dataMapelPerIndex));
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
              title: HeadersForMenu('Input Quiz'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputQuiz()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuQuiz.routeName,
        arguments: InputQuiz.dataMapelPerIndex);
    return Future.value(true);
  }
}
