import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../quiz_screens.dart';
import 'component/body.dart';

class MenuQuizSiswa extends StatefulWidget {
  static String routeName = "/menu_quiz_siswa";
  static var dataMapelPerIndex;
  @override
  _MenuQuiz createState() => _MenuQuiz();
}

class _MenuQuiz extends State<MenuQuizSiswa> {
  @override
  Widget build(BuildContext context) {
    MenuQuizSiswa.dataMapelPerIndex =
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
          body: BodyQuiz(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubMenuQuizSiswa()),
    );
    return Future.value(true);
  }
}
