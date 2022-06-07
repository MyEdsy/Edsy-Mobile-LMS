import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/DetailTagihanScreens.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/TagihanScreens.dart';
import '../../../../../constants.dart';
import '../Componen/PilihMetodePembayaranScreens.dart';

class PilihMetodePembayaran extends StatefulWidget {
  static String routeName = "/pilih_metode_pembayaran";
  static var args;
  @override
  _PilihMetodePembayaran createState() => _PilihMetodePembayaran();
}

class _PilihMetodePembayaran extends State<PilihMetodePembayaran> {

  @override
  Widget build(BuildContext context) {
    PilihMetodePembayaran.args = ModalRoute.of(context)!.settings.arguments;
    return WillPopScope(child: Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Pilih Metode Pembayaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: MetodePembayaranScreen(),
    ), onWillPop: _willPopCallback);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    //noInvoice
    if(PilihMetodePembayaran.args['from'] == 2) {
      Navigator.pushNamed(context, DetailTagihanScreens.routeName, arguments: {
        'noInvoice' : PilihMetodePembayaran.args['noInvoice'],
        'status' : 'Pending',
        'id_paket_pembayaran': PilihMetodePembayaran.args['id_paket_pembayaran']
      });
      print(PilihMetodePembayaran.args['noInvoice']);
    }else {
      Navigator.pushNamed(context, TagihanScreens.routeName);
    }
    return true; // return true if the route to be popped
  }

}
