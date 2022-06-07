import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/components/component_matapelajaran_tugas.dart';

import 'component_mata_pelajaran_tugas.dart';

class WaliMuridSubmenuTugasBody extends StatefulWidget {
  const WaliMuridSubmenuTugasBody({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<WaliMuridSubmenuTugasBody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          const SizedBox(
            height: 5,
          ),
          SliderWaliKelas(),
          const SizedBox(
            height: 10,
          ),
          const WaliMuridComponentTugasSiswa()
        ],
      ),
    );
  }
}