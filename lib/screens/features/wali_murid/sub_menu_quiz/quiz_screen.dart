import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';

import '../../../../constants.dart';
import 'components/body.dart';

class WaliMuridSubMenuQuizSiswa extends StatefulWidget {
  static String routeName = "/walimurid_sub_menu_quiz_siswa";

  const WaliMuridSubMenuQuizSiswa({Key? key}) : super(key: key);
  @override
  _SubMenuQuiz createState() => _SubMenuQuiz();
}

class _SubMenuQuiz extends State<WaliMuridSubMenuQuizSiswa> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   color: Colors.blueGrey,
            //   onPressed: () {
            //     _onBackPressed();
            //   },
            // ),
            // automaticallyImplyLeading: false,
            title: HeadersForMenu('Quiz'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const WaliMuridSubmenuQuizSiswaBody(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeSiswa()),
    // );
    Navigator.pushNamed(context, HomeWaliMurid.routeName, arguments: {'to': 1});
    return Future.value(true);
  }
}
