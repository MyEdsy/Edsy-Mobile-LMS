import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/DetailHistoryTransaksi.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/DetailTagihanComponents.dart';
import '../../../../../constants.dart';

class DetailHistoryScreens extends StatefulWidget {
  static String routeName = "/detail_history_siswa_screens";
  static var args;
  @override
  _DetailHistoryScreens createState() => _DetailHistoryScreens();
}

class _DetailHistoryScreens extends State<DetailHistoryScreens> {
  @override
  Widget build(BuildContext context) {
    DetailHistoryScreens.args = ModalRoute.of(context)!.settings.arguments;
    print(DetailHistoryScreens.args);
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Detail'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: DetailHistoryComponenet(),
    );
  }
}
