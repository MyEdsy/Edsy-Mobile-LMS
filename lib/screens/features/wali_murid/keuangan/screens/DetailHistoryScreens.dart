import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/DetailHistoryTransaksi.dart';
import '../../../../../constants.dart';

class WaliMuridDetailHistoryScreens extends StatefulWidget {
  static String routeName = "/walimurid_detail_history_siswa_screens";
  static var args;

  const WaliMuridDetailHistoryScreens({Key? key}) : super(key: key);
  @override
  _WaliMuridDetailHistoryScreens createState() => _WaliMuridDetailHistoryScreens();
}

class _WaliMuridDetailHistoryScreens extends State<WaliMuridDetailHistoryScreens> {
  @override
  Widget build(BuildContext context) {
    WaliMuridDetailHistoryScreens.args = ModalRoute.of(context)!.settings.arguments;
    print(WaliMuridDetailHistoryScreens.args);
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Detail'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const WaliMuridDetailHistoryComponenet(),
    );
  }
}
