import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/body_update_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/components/body_update_tugas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'component/body_update_ujian.dart';

class UpdateUjian extends StatefulWidget {
  static String routeName = "/update_ujian";
  static var dataMapelPerIndex;
  @override
  _UpdateUjian createState() => _UpdateUjian();
}

class _UpdateUjian extends State<UpdateUjian> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    UpdateUjian.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
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
              title: HeadersForMenu('Update Tugas'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyUpdateUjian()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuUjian.routeName,
        arguments: MenuUjian.dataMapelPerIndex);
    return Future.value(true);
  }
}
