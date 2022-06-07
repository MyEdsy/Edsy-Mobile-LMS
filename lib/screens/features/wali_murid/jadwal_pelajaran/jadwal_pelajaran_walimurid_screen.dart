import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/jadwal_pelajaran/components/body_jadwal_pelajaran.dart';

import '../../../../constants.dart';

class JadwalPelajaranSiswaWaliMurid extends StatefulWidget {
  static String routeName = "/walimurid_jadwal_pelajaran_guru";
  @override
  _JadwalPelajaranSiswaWaliMurid createState() => _JadwalPelajaranSiswaWaliMurid();
}

class _JadwalPelajaranSiswaWaliMurid extends State<JadwalPelajaranSiswaWaliMurid> {
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
      body: BodyJadwalPelajaran(),
    );
  }
}
