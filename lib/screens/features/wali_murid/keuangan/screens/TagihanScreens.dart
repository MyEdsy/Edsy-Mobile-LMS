import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/TagihanScreens.dart';
import '../../../../../constants.dart';


class WaliMuridTagihanScreens extends StatefulWidget {
  static String routeName = "/walimurid_tagihan_siswa_screens";
  static var args;

  const WaliMuridTagihanScreens({Key? key}) : super(key: key);
  @override
  _WaliMuridTagihanScreens createState() => _WaliMuridTagihanScreens();
}

class _WaliMuridTagihanScreens extends State<WaliMuridTagihanScreens> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Tagihan'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const WaliMuridTagihanScreen(),
    ), onWillPop: _willPopCallback);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    //noInvoice
    Navigator.pushNamed(context, HomeWaliMurid.routeName, arguments: {'to': 2});
    return true; // return true if the route to be popped
  }
}
