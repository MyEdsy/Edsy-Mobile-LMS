import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Componen/MenuKeuanganComponent.dart';

import '../../../../../constants.dart';


class MenuKeuanganScreens extends StatelessWidget {
  static String routeName = "/keuangan_siswa_screens";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        automaticallyImplyLeading: false,
        title: HeadersForMenu('Keuangan'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: MenuKeuanganKomponen(),
    );
  }
}
