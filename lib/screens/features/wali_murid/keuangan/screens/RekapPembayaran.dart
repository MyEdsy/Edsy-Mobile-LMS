import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/RekapPembayaranComponenet.dart';
import '../../../../../constants.dart';


class WaliMuridRekapPembayaranScreens extends StatelessWidget {
  static String routeName = "/walimurid_rekap_pembayaran_siswa_screens";

  const WaliMuridRekapPembayaranScreens({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Rekap Pembayaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const WaliMuridRekapPembayaranComponent(),
    );
  }
}
