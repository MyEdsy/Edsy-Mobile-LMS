import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/components/body.dart';

import '../../../../../constants.dart';

class WaliMuridSubMenuKesiswaan extends StatefulWidget {
  static String routeName = "/walimurid_kesiswaan_screen";

  const WaliMuridSubMenuKesiswaan({Key? key}) : super(key: key);
  @override
  _WaliMuridSubMenuKesiswaan createState() => _WaliMuridSubMenuKesiswaan();
}

class _WaliMuridSubMenuKesiswaan extends State<WaliMuridSubMenuKesiswaan> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
            title: HeadersForMenu('Bimbingan Konseling'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const BodyMenuKesiswaan(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: const HomeWaliMurid(),
      ),
    );
    return Future.value(true);
  }
}
