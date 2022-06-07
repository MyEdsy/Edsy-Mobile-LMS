import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:sliding_card/sliding_card.dart';
import '../../../../../constants.dart';
import '../../../../size_config.dart';
import 'components/AppointmentCard.dart';
import 'components/body_mata_pelajaran.dart';

class DetailNilaiSiswaScrenn extends StatefulWidget {
  static String routeName = "/detail_nilai_siswa";

  DetailNilaiSiswaScrenn({Key? key, this.title}) : super(key: key);
  final String? title;
  static var dataYangDikirim;
  @override
  _DetailNilaiSiswaScrenn createState() => _DetailNilaiSiswaScrenn();
}

class _DetailNilaiSiswaScrenn extends State<DetailNilaiSiswaScrenn> {
  SlidingCardController? controller;
  @override
  void initState() {
    super.initState();
    controller = SlidingCardController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig2().init(context);
    DetailNilaiSiswaScrenn.dataYangDikirim = ModalRoute.of(context)!.settings.arguments as Map;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppointmentCard(
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
