import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slide_kesiswaan.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/components/component_kesiswaan.dart';

import '../../../../../../constants.dart';


class BodyPelanggaran extends StatefulWidget {
  const BodyPelanggaran({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyPelanggaran> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SliderKesiswaan(),
          // Promos Section
          SizedBox(
            height: 5,
          ),
          componentpelanggaran(),
          //MenuManajemenNilai(),
          SizedBox(
            height: 10,
          ),
          // KategoriNilai()
        ],
      ),
    );
  }
}