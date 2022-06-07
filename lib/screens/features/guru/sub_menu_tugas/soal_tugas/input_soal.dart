import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/body_form_input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';

class InputSoalEssay extends StatefulWidget {
  const InputSoalEssay({Key? key}) : super(key: key);
  static String routeName = "/input_soal_tugas";
  static var data;
  @override
  _InputSoalEssay createState() => _InputSoalEssay();
}

class _InputSoalEssay extends State<InputSoalEssay> {
  @override
  Widget build(BuildContext context) {
    InputSoalEssay.data = ModalRoute.of(context)!.settings.arguments;
    print(InputSoalEssay.data);
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
              title: HeadersForMenu('Input Soal'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputSoalEssay()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailTugas.routeName, arguments: {
      "id": InputSoalEssay.data['idTugas'],
      "keterangan": SoalTugas.dataTugas['keterangan'],
    });
    return Future.value(true);
  }
}
