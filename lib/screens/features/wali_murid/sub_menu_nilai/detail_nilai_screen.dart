import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/components/appointment_card.dart';
import 'package:sliding_card/sliding_card.dart';
import '../../../../../constants.dart';
import '../../../../size_config.dart';

class WaliMuridDetailNilaiSiswaScrenn extends StatefulWidget {
  static String routeName = "/walimurid_detail_nilai_siswa";

  const WaliMuridDetailNilaiSiswaScrenn({Key? key, this.title}) : super(key: key);
  final String? title;
  static var dataYangDikirim;
  @override
  _WaliMuridDetailNilaiSiswaScrenn createState() => _WaliMuridDetailNilaiSiswaScrenn();
}

class _WaliMuridDetailNilaiSiswaScrenn extends State<WaliMuridDetailNilaiSiswaScrenn> {
  SlidingCardController? controller;
  @override
  void initState() {
    super.initState();
    controller = SlidingCardController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig2().init(context);
    WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Detail Nilai'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: Center(
          child: Container(
            padding: const EdgeInsets.all(1.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WaliMuridAppointmentCard(
              onCardTapped: () {
                if (controller?.isCardSeparated == true) {
                  controller?.collapseCard();
                } else {
                  controller?.expandCard();
                }
              },
              slidingCardController: controller,
            )
          ],
        ),
      )),
    );
  }
}
