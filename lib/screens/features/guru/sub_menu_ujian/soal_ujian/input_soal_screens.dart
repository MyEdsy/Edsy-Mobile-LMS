import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/detail_ujian_screens.dart';

import '../../../../../constants.dart';
import 'components/body_form_input_ujian.dart';

class InputSoalUjian extends StatefulWidget {
  const InputSoalUjian({Key? key}) : super(key: key);
  static String routeName = "/input_soal_ujian";
  static var data;
  @override
  _InputSoalUjian createState() => _InputSoalUjian();
}

class _InputSoalUjian extends State<InputSoalUjian> {
  @override
  Widget build(BuildContext context) {
    InputSoalUjian.data =
    ModalRoute.of(context)!.settings.arguments;
    print(InputSoalUjian.data);
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
              title: HeadersForMenu('Ujian'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputSoalUjian()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailUjian.routeName,
        arguments: {"id" :InputSoalUjian.data['idTugas']});
    return Future.value(true);
  }
}
