import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/components/body_mata_pelajaran.dart';
import '../../../../../constants.dart';


class WaliMuridMataPelajaranLiatNilai extends StatelessWidget {
  static String routeName = "/walimurid_siswa_mata_pelajaran_lihat_nilai";

  const WaliMuridMataPelajaranLiatNilai({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          // automaticallyImplyLeading: false,
          title: HeadersForMenu('Lihat Nilai'),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        body: const WaliMuridBodyMataPelajaran()
    );
  }
}
