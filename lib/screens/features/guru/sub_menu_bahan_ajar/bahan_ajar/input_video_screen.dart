import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import 'bahan_ajar_screen.dart';
import 'components/body_input_video.dart';

class InputVideo extends StatefulWidget {
  static String routeName = "/input_video";
  static var dataMapelPerIndex;
  @override
  _InputKategoriNilai createState() => _InputKategoriNilai();
}

class _InputKategoriNilai extends State<InputVideo> {
  @override
  Widget build(BuildContext context) {
    InputVideo.dataMapelPerIndex =
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
              title: HeadersForMenu('Tambah Video Pembelajaran'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputVideo()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, BahanMengajar.routeName,
        arguments: BahanMengajar.dataMapelPerIndex);
    return Future.value(true);
  }
}
