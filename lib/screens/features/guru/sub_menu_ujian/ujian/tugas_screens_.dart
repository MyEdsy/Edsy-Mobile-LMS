import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/input_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian_scareens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'component/body.dart';

class MenuUjian extends StatefulWidget {
  static String routeName = "/menu_ujian";
  static var dataMapelPerIndex;
  @override
  _MenuUjian createState() => _MenuUjian();
}

class _MenuUjian extends State<MenuUjian> {
  @override
  Widget build(BuildContext context) {
    MenuUjian.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('UJIAN'),
            actions: [
              Container(
                child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.pushNamed(context, InputUjian.routeName,
                          arguments: MenuUjian.dataMapelPerIndex);
                    }),
              ),
            ],
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: Body(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubMenuUjian()),
    );
    return Future.value(true);
  }
}
