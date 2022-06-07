import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/soal_tugas/components/body.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/detail_tugas_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
class WaliMuridSoalTugasSiswa extends StatefulWidget {
  static String routeName = "/walimurid_soal_tugas_siswa";
  static var dataTugas;

  const WaliMuridSoalTugasSiswa({Key? key}) : super(key: key);
  @override
  _WaliMuridSoalTugasSiswa createState() => _WaliMuridSoalTugasSiswa();
}

class _WaliMuridSoalTugasSiswa extends State<WaliMuridSoalTugasSiswa> {
  @override
  Widget build(BuildContext context) {
    WaliMuridSoalTugasSiswa.dataTugas =
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
          body: const BodySoalTugas(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, WaliMuridDetailTugasSiswa.routeName, arguments: {
      "id": WaliMuridSoalTugasSiswa.dataTugas['idTugas'],
      "keterangan": WaliMuridSoalTugasSiswa.dataTugas['keterangan'],
      "link_youtube" : WaliMuridSoalTugasSiswa.dataTugas['link_youtube'],
      "link_sumberlain" : WaliMuridSoalTugasSiswa.dataTugas['link_sumberlain'],
    });
    return Future.value(true);
  }
}
