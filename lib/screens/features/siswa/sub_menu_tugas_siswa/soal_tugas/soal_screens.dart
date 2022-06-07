import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas/detail_tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body.dart';

class SoalTugasSiswa extends StatefulWidget {
  static String routeName = "/soal_tugas_siswa";
  static var dataTugas;
  @override
  _SoalTugasSiswa createState() => _SoalTugasSiswa();
}

class _SoalTugasSiswa extends State<SoalTugasSiswa> {
  @override
  Widget build(BuildContext context) {
    SoalTugasSiswa.dataTugas =
        ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('SOAL'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: Body(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailTugasSiswa.routeName, arguments: {
      "id": SoalTugasSiswa.dataTugas['idTugas'],
      "keterangan": SoalTugasSiswa.dataTugas['keterangan'],
      "link_youtube" : SoalTugasSiswa.dataTugas['link_youtube'],
      "link_sumberlain" : SoalTugasSiswa.dataTugas['link_sumberlain'],
    });
    return Future.value(true);
  }
}
