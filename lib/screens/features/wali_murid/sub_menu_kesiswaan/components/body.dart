import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slide_kesiswaan.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/components/component_menu_pelanggaran.dart';

import '../../../../../../constants.dart';

class BodyMenuKesiswaan extends StatefulWidget {
  const BodyMenuKesiswaan({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyMenuKesiswaan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          SliderKesiswaan(),
          // Promos Section
          const SizedBox(
            height: 5,
          ),
          const ComponentMenuPelanggaran(),
          //MenuManajemenNilai(),
          const SizedBox(
            height: 10,
          ),
          // KategoriNilai()
        ],
      ),
    );
  }
}
