import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../bahan_ajar_screen.dart';
import 'components/body.dart';
import 'input_bahan_ajar_form.dart';

class BahanMengajar extends StatefulWidget {
  static String routeName = "/bahan_mengajar";
  static var dataMapelPerIndex;
  @override
  _BahanMengajar createState() => _BahanMengajar();
}

class _BahanMengajar extends State<BahanMengajar> {
  @override
  Widget build(BuildContext context) {
    BahanMengajar.dataMapelPerIndex =
        ModalRoute.of(context)!.settings.arguments as Map;
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
              title: HeadersForMenu(
                  '${BahanMengajar.dataMapelPerIndex['Namamapel']} ${BahanMengajar.dataMapelPerIndex['KelompokKelas']} ${BahanMengajar.dataMapelPerIndex['Jurusan']} ${BahanMengajar.dataMapelPerIndex['NamaKelompokKelas']}'),
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
            body: Body()
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubMenuBahanajar()),
    );
    return Future.value(true);
  }
}
