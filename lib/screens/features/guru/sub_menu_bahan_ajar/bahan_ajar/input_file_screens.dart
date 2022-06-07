import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/components/body_input_file.dart';

import '../../../../../constants.dart';
import 'bahan_ajar_screen.dart';
import 'components/body_input_video.dart';

class InputFile extends StatefulWidget {
  static String routeName = "/input_file";
  static var dataMapelPerIndex;
  @override
  _InputKategoriNilai createState() => _InputKategoriNilai();
}

class _InputKategoriNilai extends State<InputFile> {
  @override
  Widget build(BuildContext context) {
    InputFile.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
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
              title: HeadersForMenu('Tambah File Pembelajaran'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputFile()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, BahanMengajar.routeName,
        arguments: BahanMengajar.dataMapelPerIndex);
    return Future.value(true);
  }
}
