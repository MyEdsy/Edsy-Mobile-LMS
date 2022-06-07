import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/componenets/body_edit_nilai.dart';

import '../../../../../../constants.dart';
import 'componenets/body_input_nilai.dart';


class EditNilai extends StatelessWidget {
  static String routeName = "/edit_nilai_siswa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Edit Nilai'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: BodyEditNilai()
    );
  }
}
