import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/HistoryTransaksiComponent.dart';
import '../../../../../constants.dart';


class WaliMuridHistoryScreens extends StatelessWidget {
  static String routeName = "/walimurid_history_siswa_screens";

  const WaliMuridHistoryScreens({Key? key}) : super(key: key);
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
      body: WaliMuridHistoryComponent(),
    );
  }
}
