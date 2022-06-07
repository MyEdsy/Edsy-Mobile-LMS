import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar/components/body.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar/components/component_bahan_ajar.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class WaliMuridBahanMengajarSiswa extends StatefulWidget {
  static String routeName = "/walimurid_bahan_ajar_siswa";
  static var dataMapelPerIndex;

  const WaliMuridBahanMengajarSiswa({Key? key}) : super(key: key);
  @override
  _BahanMengajar createState() => _BahanMengajar();
}

class _BahanMengajar extends State<WaliMuridBahanMengajarSiswa> {
  @override
  Widget build(BuildContext context) {
    WaliMuridBahanMengajarSiswa.dataMapelPerIndex =
        ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.blueGrey,
              onPressed: () {
                _onBackPressed();
              },
            ),
            // automaticallyImplyLeading: false,
            title: HeadersForMenu(
                '${WaliMuridBahanMengajarSiswa.dataMapelPerIndex['Namamapel']} ${WaliMuridBahanMengajarSiswa.dataMapelPerIndex['kode_kelompok']}'),
            // actions: [
            //   Container(
            //     child: IconButton(
            //         icon: Icon(Icons.add),
            //         color: Colors.blueGrey,
            //         onPressed: () {
            //           Navigator.pushNamed(context, InputBahanAjar.routeName,
            //               arguments: BahanMengajar.dataMapelPerIndex);
            //         }),
            //   ),
            // ],
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const WaliMuridComponentBahanAjar()
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SubMenuBahanajarSiswaWaliMurid()),
    );
    return Future.value(true);
  }
}
