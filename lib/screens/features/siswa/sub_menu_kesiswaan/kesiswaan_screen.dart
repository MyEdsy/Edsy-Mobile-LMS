import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/home_siswa.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/components/body.dart';

import '../../../../../constants.dart';
class KesiswaanScreen extends StatefulWidget {
  static String routeName = "/kesiswaan_screen";

  const KesiswaanScreen({Key? key}) : super(key: key);
  @override
  _KesiswaanScreen createState() => _KesiswaanScreen();
}

class _KesiswaanScreen extends State<KesiswaanScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.blueGrey,
              onPressed: () {
                _onBackPressed();
              },
            ),
            // automaticallyImplyLeading: false,
            title: HeadersForMenu('Bimbingan Konseling'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: BodyPelanggaran(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: HomeSiswa(),
      ),
    );
    return Future.value(true);
  }
}
