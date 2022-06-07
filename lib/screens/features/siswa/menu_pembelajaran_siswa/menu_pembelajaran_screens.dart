import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import 'components/body.dart';


class MenuPembelajaranSiswa extends StatelessWidget {
  static String routeName = "/menu_pembelajaran_siswa";
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
      body: Body(),
    );
  }
}
