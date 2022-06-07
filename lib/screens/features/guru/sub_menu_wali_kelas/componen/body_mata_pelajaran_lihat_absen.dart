import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/search_field.dart';

import 'component_mata_pelajaran_lihat_absen.dart';

class BodyMataPelajaranLihatAbsen extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyMataPelajaranLihatAbsen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          SearchField(),
          SizedBox(
            height: 5,
          ),
          ComponentMataPelajaranMenuWalKelLihatAbsen()
        ],
      ),
    );
  }
}