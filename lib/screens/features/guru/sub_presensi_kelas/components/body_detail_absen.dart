import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/components/component_detail_absen.dart';


class BodyDetailAbsenPersiswaDiGuru extends StatefulWidget {
  @override
  _BodyMataPelajaran createState() => _BodyMataPelajaran();
}

class _BodyMataPelajaran extends State<BodyDetailAbsenPersiswaDiGuru> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          // SearchField(),
          // SizedBox(
          //   height: 5,
          // ),
          ComponenDetailAbsenSiswaDiGuru(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}