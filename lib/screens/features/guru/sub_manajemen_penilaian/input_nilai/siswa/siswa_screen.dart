import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/componenets/body.dart';
import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';
import '../input_nilai_screens.dart';

class ListNilaiSiswa extends StatefulWidget {
  static String routeName = "/list_nilai_siswa";
  static var dataMapel;
  @override
  _ListNilaiSiswa createState() => _ListNilaiSiswa();
}

class _ListNilaiSiswa extends State<ListNilaiSiswa> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ListNilaiSiswa.dataMapel = ModalRoute.of(context)!.settings.arguments as Map;
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Input Nilai ${ListNilaiSiswa.dataMapel['namaKomponen']}'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: Body()
    ), onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, ManajemenNilai.routeName,
        arguments: {
          "tahunakademik": ListNilaiSiswa.dataMapel['Tahun'],
          "semester": ListNilaiSiswa.dataMapel['semester'],
        });
    return Future.value(true);
  }
}
