import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body.dart';
import 'input_soal.dart';

class SoalTugas extends StatefulWidget {
  static String routeName = "/soal_tugas";
  static var dataTugas;
  @override
  _SoalTugas createState() => _SoalTugas();
}

class _SoalTugas extends State<SoalTugas> {

  @override
  Widget build(BuildContext context) {
    SoalTugas.dataTugas = ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
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
            title: HeadersForMenu('SOAL'),
            // actions: [
            //   Container(
            //     child: IconButton(
            //         icon: Icon(Icons.add),
            //         color: Colors.blueGrey,
            //         onPressed: () {
            //           _popUp();
            //         }),
            //   ),
            // ],
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: Body(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailTugas.routeName,
        arguments: {
      "id": SoalTugas.dataTugas['idTugas'],
      // "id": SoalTugas.dataTugas['id_tugas'],
      "keterangan": SoalTugas.dataTugas['keterangan'],
      "link_youtube": SoalTugas.dataTugas['link_youtube'],
      "link_sumberlain": SoalTugas.dataTugas['link_sumberlain'],
    });
    return Future.value(true);
  }
}
