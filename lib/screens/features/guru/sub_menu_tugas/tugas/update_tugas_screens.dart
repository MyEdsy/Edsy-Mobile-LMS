import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/components/body_update_tugas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class UpdateTugas extends StatefulWidget {
  static String routeName = "/update_tugas";
  static var dataMapelPerIndex;
  @override
  _InputKategoriNilai createState() => _InputKategoriNilai();
}

class _InputKategoriNilai extends State<UpdateTugas> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    UpdateTugas.dataMapelPerIndex =
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
              title: HeadersForMenu('Update Tugas'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: BodyUpdateTugas()),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuTugas.routeName,
        arguments: MenuTugas.dataMapelPerIndex);
    return Future.value(true);
  }
}
