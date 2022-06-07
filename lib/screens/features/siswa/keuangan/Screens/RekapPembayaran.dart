import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/RekapPembayaranComponenet.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/TagihanScreens.dart';
import '../../../../../constants.dart';


class RekapPembayaranScreens extends StatelessWidget {
  static String routeName = "/rekap_pembayaran_siswa_screens";
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
      body: RekapPembayaranComponent(),
    );
  }
}
