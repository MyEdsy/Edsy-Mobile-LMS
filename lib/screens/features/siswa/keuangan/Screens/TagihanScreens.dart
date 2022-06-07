import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/TagihanScreens.dart';
import '../../../../../constants.dart';
import '../../home_siswa.dart';


class TagihanScreens extends StatefulWidget {
  static String routeName = "/tagihan_siswa_screens";
  static var args;
  @override
  _TagihanScreens createState() => _TagihanScreens();
}

class _TagihanScreens extends State<TagihanScreens> {

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
      body: TagihanScreen(),
    ), onWillPop: _willPopCallback);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    //noInvoice
    Navigator.pushNamed(context, HomeSiswa.routeName, arguments: {'to': 2});
    return true; // return true if the route to be popped
  }
}
