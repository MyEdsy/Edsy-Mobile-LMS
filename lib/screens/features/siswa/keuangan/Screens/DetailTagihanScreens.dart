import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/DetailTagihanComponents.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/TagihanScreens.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/TagihanScreens.dart';
import '../../../../../constants.dart';

class DetailTagihanScreens extends StatefulWidget {
  static String routeName = "/detail_tagihan_siswa_screens";
  static var args;
  @override
  _DetailTagihanScreens createState() => _DetailTagihanScreens();
}

class _DetailTagihanScreens extends State<DetailTagihanScreens> {

  @override
  Widget build(BuildContext context) {
    DetailTagihanScreens.args = ModalRoute.of(context)!.settings.arguments;
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Detail Tagihan'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: DetailTagihanScreen(),
    ), onWillPop: _willPopCallback);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    //noInvoice
    Navigator.pushNamed(context, TagihanScreens.routeName);
    return true; // return true if the route to be popped
  }
}
