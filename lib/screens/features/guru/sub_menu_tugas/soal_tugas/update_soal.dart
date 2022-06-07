import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';
import 'components/body_update_soal.dart';

class UpdateSoalEssay extends StatefulWidget {
  const UpdateSoalEssay({Key? key}) : super(key: key);
  static String routeName = "/update_soal_tugas";
  static var data;
  @override
  _InputSoalEssay createState() => _InputSoalEssay();
}

class _InputSoalEssay extends State<UpdateSoalEssay> {
  @override
  Widget build(BuildContext context) {
    UpdateSoalEssay.data = ModalRoute.of(context)!.settings.arguments;
    print(UpdateSoalEssay.data);
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
            body: BodyUpdateSoalEssay()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, SoalTugas.routeName, arguments: {
      "idDetailSoal": UpdateSoalEssay.data['idDetailSoal'],
      "idTugas": UpdateSoalEssay.data['idTugas'],
    });
    return Future.value(true);
  }
}
