import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/components/PilihMetodePembayaranScreens.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/DetailTagihanScreens.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/TagihanScreens.dart';
import '../../../../../constants.dart';

class WaliMuridPilihMetodePembayaran extends StatefulWidget {
  static String routeName = "/walimurid_pilih_metode_pembayaran";
  static var args;

  const WaliMuridPilihMetodePembayaran({Key? key}) : super(key: key);
  @override
  _WaliMuridPilihMetodePembayaran createState() =>
      _WaliMuridPilihMetodePembayaran();
}

class _WaliMuridPilihMetodePembayaran
    extends State<WaliMuridPilihMetodePembayaran> {
  @override
  Widget build(BuildContext context) {
    WaliMuridPilihMetodePembayaran.args =
        ModalRoute.of(context)!.settings.arguments;
    print(WaliMuridPilihMetodePembayaran.args["url"]);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            // automaticallyImplyLeading: false,
            title: HeadersForMenu('Pilih Metode Pembayaran'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const WaliMuridMetodePembayaranScreen(),
        ),
        onWillPop: _willPopCallback);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    //noInvoice
    if (WaliMuridPilihMetodePembayaran.args['from'] == 2) {
      Navigator.pushNamed(context, WaliMuridDetailTagihanScreens.routeName,
          arguments: {
            'noInvoice': WaliMuridPilihMetodePembayaran.args['noInvoice'],
            'status': 'Pending',
            'id_paket_pembayaran':
                WaliMuridPilihMetodePembayaran.args['id_paket_pembayaran']
          });
      print(WaliMuridPilihMetodePembayaran.args['noInvoice']);
    } else {
      Navigator.pushNamed(context, WaliMuridTagihanScreens.routeName);
    }
    return true; // return true if the route to be popped
  }
}
