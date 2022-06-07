import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../constants.dart';
import 'component/body.dart';

class JadwalPelajaranSiswa extends StatefulWidget {
  static String routeName = "/jadwal_pelajaran_guru";
  @override
  _JadwalPelajaranSiswa createState() => _JadwalPelajaranSiswa();
}

class _JadwalPelajaranSiswa extends State<JadwalPelajaranSiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        automaticallyImplyLeading: false,
        title: HeadersForMenu('Jadwal Pelajaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: Body(),
    );
  }
}
