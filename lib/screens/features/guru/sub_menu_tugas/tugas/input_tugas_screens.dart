import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body_input_tugas.dart';

class InputTugas extends StatefulWidget {
  static String routeName = "/input_tugas";
  static var dataMapelPerIndex;
  @override
  _InputKategoriNilai createState() => _InputKategoriNilai();
}

class _InputKategoriNilai extends State<InputTugas> {
  @override
  Widget build(BuildContext context) {
    InputTugas.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    print(jsonEncode(InputTugas.dataMapelPerIndex));
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
              title: HeadersForMenu('Input Tugas'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyInputTugas()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuTugas.routeName,
        arguments: InputTugas.dataMapelPerIndex);
    return Future.value(true);
  }
}
