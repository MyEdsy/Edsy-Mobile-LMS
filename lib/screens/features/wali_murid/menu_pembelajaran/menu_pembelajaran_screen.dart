import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/menu_pembelajaran/components/body.dart';

import '../../../../../constants.dart';


class WaliMuridMenuPembelajaranSiswa extends StatelessWidget {
  static String routeName = "/walimurid_menu_pembelajaran_siswa";

  const WaliMuridMenuPembelajaranSiswa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        automaticallyImplyLeading: false,
        title: HeadersForMenu('Pembelajaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const BodyMenuPembelajaran(),
    );
  }
}
