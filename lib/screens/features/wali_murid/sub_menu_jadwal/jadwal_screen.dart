import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_jadwal/components/body.dart';
import '../../../../../constants.dart';


class JadwalKelasSiswaWaliMurid extends StatelessWidget {
  static String routeName = "/walimurid_jadwal_kelas_siswa";

  const JadwalKelasSiswaWaliMurid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Jadwal Pelajaran'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: const BodyMenuJadwal()
    );
  }
}
