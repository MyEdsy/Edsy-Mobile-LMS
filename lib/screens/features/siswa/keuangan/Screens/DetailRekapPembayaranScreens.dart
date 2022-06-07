import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/DetailHistoryTransaksi.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/DetailRekapPembayaran.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/DetailTagihanComponents.dart';
import '../../../../../constants.dart';

class DetailRekapScreens extends StatefulWidget {
  static String routeName = "/detail_pembayaran_siswa_screens";
  static var args;
  @override
  _DetailRekapScreens createState() => _DetailRekapScreens();
}

class _DetailRekapScreens extends State<DetailRekapScreens> {

  @override
  Widget build(BuildContext context) {
    DetailRekapScreens.args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Rekap Pembayaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: DetailRekapPembayaranComponent(),
    );
  }
}
