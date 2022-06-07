import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_menu_presensi.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/components/search_field.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_jadwal/components/component_jadwal_pelajaran.dart';

class BodyMenuJadwal extends StatefulWidget {
  const BodyMenuJadwal({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyMenuJadwal> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: const <Widget>[
          // Promos Section
          // SearchField(),
          SizedBox(
            height: 5,
          ),
          ComponentJadwalPelajaran()
        ],
      ),
    );
  }
}