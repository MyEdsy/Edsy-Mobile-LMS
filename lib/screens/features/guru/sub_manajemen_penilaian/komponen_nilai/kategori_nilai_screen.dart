import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../sub_menu_penilaian_screen.dart';
import 'componenets/body.dart';

class BeforeInputKategoriNilai extends StatefulWidget {
  static String routeName = "/before_input_kategori_nilai";
  static var dataMapelPerIndex;
  @override
  _BeforeInputKategoriNilai createState() => _BeforeInputKategoriNilai();
}

class _BeforeInputKategoriNilai extends State<BeforeInputKategoriNilai> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
            // Setting up AppBar
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.blueGrey,
                onPressed: () {
                  _onBackPressed();
                },
              ),
              // automaticallyImplyLeading: false,
              title: HeadersForMenu('Komponen Nilai'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: Body()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubMenuManajemenPenilaian()),
    );
    return Future.value(true);
  }
}
