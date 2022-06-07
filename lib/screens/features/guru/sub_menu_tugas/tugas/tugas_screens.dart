import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../tugas_scareens.dart';
import 'components/body.dart';
import 'input_tugas_screens.dart';

class MenuTugas extends StatefulWidget {
  static String routeName = "/menu_tugas";
  static var dataMapelPerIndex;
  @override
  _SubMenuTugas createState() => _SubMenuTugas();
}

class _SubMenuTugas extends State<MenuTugas> {
  @override
  Widget build(BuildContext context) {
    MenuTugas.dataMapelPerIndex =
    ModalRoute.of(context)!.settings.arguments as Map;
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('TUGAS'),
            // actions: [
            //   Container(
            //     child: IconButton(
            //         icon: Icon(Icons.add),
            //         color: Colors.blueGrey,
            //         onPressed: () {
            //           Navigator.pushNamed(context, InputTugas.routeName,
            //               arguments: MenuTugas.dataMapelPerIndex);
            //         }),
            //   ),
            // ],
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
      MaterialPageRoute(builder: (context) => SubMenuTugas()),
    );
    return Future.value(true);
  }
}
