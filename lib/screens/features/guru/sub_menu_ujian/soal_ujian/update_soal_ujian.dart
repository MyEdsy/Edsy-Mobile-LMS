import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/soal_ujian_screens.dart';

import '../../../../../constants.dart';
import 'components/body_update_soal_ujian.dart';

class UpdateSoalUjian extends StatefulWidget {
  const UpdateSoalUjian({Key? key}) : super(key: key);
  static String routeName = "/update_soal_ujian";
  static var data;
  @override
  _UpdateSoalQuiz createState() => _UpdateSoalQuiz();
}

class _UpdateSoalQuiz extends State<UpdateSoalUjian> {
  @override
  Widget build(BuildContext context) {
    UpdateSoalUjian.data = ModalRoute.of(context)!.settings.arguments;
    print(UpdateSoalUjian.data);
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
            body: BodyUpdateSoalUjian()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, SoalUjian.routeName, arguments: {
      "idDetailSoal": UpdateSoalUjian.data['idDetailSoal'],
      "idTugas": UpdateSoalUjian.data['idTugas'],
    });
    return Future.value(true);
  }
}
