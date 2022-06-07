import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_jadwal/jadwal_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/kesiswaan_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/mata_pelajaran_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_presensi/mata_pelajaran_screen.dart';

import '../../../../../constants.dart';

class MenuSiswa extends StatefulWidget {
  @override
  _MenuSiswa createState() => _MenuSiswa();
}

class _MenuSiswa extends State<MenuSiswa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 10, bottom: 12),
          child: Text(
            'Menu',
            style: mTitleStyle,
          ),
        ),
        Container(
          height: 144,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, MataPelajaranLiatNilai.routeName),
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/images/management.png'),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Nilai',
                                    style: mServiceTitleStyle,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('Lihat Nilai',
                                      style: mServiceSubtitleStyle)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, MataPelajaranLiatAbsen.routeName),
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: mFillColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/absen.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Presensi',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('Lihat Presensi',
                                    style: mServiceSubtitleStyle)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              //JadwalKelasGuru
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, JadwalKelasSiswa.routeName),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: mFillColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/schedule.png',
                            width: 32,
                            height: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Jadwal',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('Jadwal Pelajaran',
                                    style: mServiceSubtitleStyle)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  //onTap: () => Navigator.pushNamed(
                  //                         context, SubMenuWaliKelas.routeName),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => KesiswaanScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/images/kesiswaan.png'),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Kesiswaan',
                                    style: mServiceTitleStyle,
                                  ),
                                  Text(
                                    'Menu Kesiswaan',
                                    style: mServiceSubtitleStyle,
                                  )
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
            ],
          ),
        ),
      ],
    );
  }
}
