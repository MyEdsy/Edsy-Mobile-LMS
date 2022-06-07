import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/components/body.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class WaliMuridMenuQuizSiswa extends StatefulWidget {
  static String routeName = "/walimurid_menu_quiz_siswa";
  static var dataMapelPerIndex;

  const WaliMuridMenuQuizSiswa({Key? key}) : super(key: key);
  @override
  _MenuQuiz createState() => _MenuQuiz();
}

class _MenuQuiz extends State<WaliMuridMenuQuizSiswa> {
  @override
  Widget build(BuildContext context) {
    WaliMuridMenuQuizSiswa.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('QUIZ'),
            // actions: [
            //   Container(
            //     child: IconButton(
            //         icon: Icon(Icons.add),
            //         color: Colors.blueGrey,
            //         onPressed: () {
            //           Navigator.pushNamed(context, InputQuiz.routeName,
            //               arguments: MenuQuiz.dataMapelPerIndex);
            //         }),
            //   ),
            // ],
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const WaliMuridBodyQuiz(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WaliMuridSubMenuQuizSiswa()),
    );
    return Future.value(true);
  }
}
