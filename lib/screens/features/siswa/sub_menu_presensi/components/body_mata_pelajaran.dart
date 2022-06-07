import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/components/search_field.dart';
import 'component_mata_pelajaran.dart';


class BodyMataPelajaranAbsen extends StatefulWidget {
  @override
  _BodyMataPelajaran createState() => _BodyMataPelajaran();
}

class _BodyMataPelajaran extends State<BodyMataPelajaranAbsen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          // SearchField(),
          SizedBox(
            height: 5,
          ),
          MataPelajaranAbsen(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}