import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/DetailTagihanComponents.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/TagihanScreens.dart';
import '../../../../../constants.dart';

class WaliMuridDetailTagihanScreens extends StatefulWidget {
  static String routeName = "/walimurid_detail_tagihan_siswa_screens";
  static var args;

  const WaliMuridDetailTagihanScreens({Key? key}) : super(key: key);
  @override
  _WaliMuridDetailTagihanScreens createState() => _WaliMuridDetailTagihanScreens();
}

class _WaliMuridDetailTagihanScreens extends State<WaliMuridDetailTagihanScreens> {

  @override
  Widget build(BuildContext context) {
    WaliMuridDetailTagihanScreens.args = ModalRoute.of(context)!.settings.arguments;
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Detail Tagihan'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const WaliMuridDetailTagihanScreen(),
    ), onWillPop: _willPopCallback);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    //noInvoice
    Navigator.pushNamed(context, WaliMuridTagihanScreens.routeName);
    return true; // return true if the route to be popped
  }
}
