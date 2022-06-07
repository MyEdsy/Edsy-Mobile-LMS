import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_ujian.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/components/component_matapelajaran_tugas.dart';

import 'component_matapelajaran_ujian.dart';

class SubmenuUjianBody extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SubmenuUjianBody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          SizedBox(
            height: 5,
          ),
          SliderUjian(),
          SizedBox(
            height: 10,
          ),
          ComponentUjian()
        ],
      ),
    );
  }
}