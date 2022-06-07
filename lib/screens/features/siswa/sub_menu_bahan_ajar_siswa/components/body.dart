import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';

import 'component_matapelajaran_bahan_ajar.dart';
class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {

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
          SliderWaliKelas(),
          SizedBox(
            height: 10,
          ),
          ComponentBahanAjar()
        ],
      ),
    );
  }
}