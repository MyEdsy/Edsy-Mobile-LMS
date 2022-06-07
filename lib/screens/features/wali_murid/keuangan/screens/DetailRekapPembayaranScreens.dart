import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/DetailRekapPembayaran.dart';
import '../../../../../constants.dart';

class WaliMuridDetailRekapScreens extends StatefulWidget {
  static String routeName = "/walimurid_detail_pembayaran_siswa_screens";
  static var args;

  const WaliMuridDetailRekapScreens({Key? key}) : super(key: key);
  @override
  _WaliMuridDetailRekapScreens createState() => _WaliMuridDetailRekapScreens();
}

class _WaliMuridDetailRekapScreens extends State<WaliMuridDetailRekapScreens> {

  @override
  Widget build(BuildContext context) {
    WaliMuridDetailRekapScreens.args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Rekap Pembayaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const WaliMuridDetailRekapPembayaranComponent(),
    );
  }
}
