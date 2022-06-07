import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/HistoryTransaksiComponent.dart';
import '../../../../../constants.dart';


class HistoryScreens extends StatelessWidget {
  static String routeName = "/history_siswa_screens";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Histori Transaksi'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: HistoryComponent(),
    );
  }
}
