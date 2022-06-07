import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/data_menu_pelanggaran/menu_pelanggaran.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';

class ComponentMenuPelanggaran extends StatefulWidget {
  const ComponentMenuPelanggaran({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<ComponentMenuPelanggaran> {
  _getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    tahunAjaranPref = sharedPreferences.getString("tahunAjaran");
    print(tahunAjaranPref);
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 0, bottom: 12),
          child: Text(
            'Silahkan Pilih Menu',
            style: mTitleStyle,
          ),
        ),
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, WaliMuridMenuPelanggaran.routeName),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.only(left: 16),
                        height: 80,
                        decoration: BoxDecoration(
                          color: mFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/images/category.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Data Pelanggaran Siswa',
                                    style: mServiceTitleStyle,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                      'Daftar Pelanggaran \nDetail Pelanggaran',
                                      style: mServiceSubtitleStyle)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
