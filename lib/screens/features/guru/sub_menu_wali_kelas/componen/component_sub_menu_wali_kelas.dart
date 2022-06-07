import 'package:flutter/widgets.dart';

import '../../../../../constants.dart';
import '../mata_pelajaran_menu_wali_kelas_lihat_absen_screen.dart';
import '../mata_pelajaran_menu_wali_kelas_screeens.dart';


class ComponentMenuWaliKelas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<ComponentMenuWaliKelas> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 0, bottom: 12),
          child: Text(
            'Menu',
            style: mTitleStyle,
          ),
        ),
        Container(
          height: 80,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, MataPelajaranMenuWaliKelas.routeName),
                          child: Row(
                            children: <Widget>[
                              Image.asset('assets/images/key-value-database.png'),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Nilai Siswa',
                                      style: mServiceTitleStyle,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Rekap nilai',
                                        style: mServiceSubtitleStyle)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        // ManajemenNilai
                        child: GestureDetector(
                          onTap: ()=> Navigator.pushNamed(
                              context, MataPelajaranMenuWaliKelasLihatAbsen.routeName),
                          child: Row(
                            children: <Widget>[
                              Image.asset('assets/images/clipboard.png'),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Absen Siswa',
                                      style: mServiceTitleStyle,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Rekap absen',
                                        style: mServiceSubtitleStyle)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}