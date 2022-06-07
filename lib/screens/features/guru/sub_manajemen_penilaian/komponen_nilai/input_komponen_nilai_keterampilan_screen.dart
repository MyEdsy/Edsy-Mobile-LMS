import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/componenets/body_input_keterampilan.dart';

import '../../../../../constants.dart';
import 'componenets/body_input_pengetahuan.dart';
import 'kategori_nilai_screen.dart';

class InputKategoriNilaiKeterampilan extends StatefulWidget {
  static String routeName = "/input_kategori_nilai_keterampilan";
  static var dataMapelFromRoutes;
  @override
  _InputKategoriNilai createState() => _InputKategoriNilai();
}

class _InputKategoriNilai extends State<InputKategoriNilaiKeterampilan> {
  @override
  Widget build(BuildContext context) {
    InputKategoriNilaiKeterampilan.dataMapelFromRoutes =
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
              title: HeadersForMenu('Komponen Nilai Keterampilan'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputKategoriNilaiKeterampilan()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BeforeInputKategoriNilai()),
    );
    return Future.value(true);
  }
}
