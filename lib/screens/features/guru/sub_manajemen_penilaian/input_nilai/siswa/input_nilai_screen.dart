import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../../constants.dart';
import 'componenets/body_input_nilai.dart';


class InputNilai extends StatelessWidget {
  static String routeName = "/input_nilai_siswa";
  static var dataDetailNilaiSiswa;
  @override
  Widget build(BuildContext context) {
    dataDetailNilaiSiswa = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Input Nilai ${dataDetailNilaiSiswa['namaKomponen']}'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyInputNilai()
    );
  }
}
