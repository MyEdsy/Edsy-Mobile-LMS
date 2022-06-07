import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_jadwal/jadwal_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/menu_kesiswaan_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/mata_pelajaran_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/mata_pelajaran_screen.dart';

import '../../../../../constants.dart';

class MenuWaliMurid extends StatefulWidget {
  @override
  _MenuWaliMurid createState() => _MenuWaliMurid();
}

class _MenuWaliMurid extends State<MenuWaliMurid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 10, bottom: 12),
          child: Text(
            'Menu',
            style: mTitleStyle,
          ),
        ),
        Container(
          height: 144,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, WaliMuridMataPelajaranLiatNilai.routeName),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.only(left: 16),
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
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Nilai',
                                    style: mServiceTitleStyle,
                                  ),
                                  const SizedBox(
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
                        context, WaliMuridMataPelajaranLiatAbsen.routeName),
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.only(left: 16),
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
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Presensi',
                                  style: mServiceTitleStyle,
                                ),
                                const SizedBox(
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
              const SizedBox(
                height: 16,
              ),
              //JadwalKelasGuru
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, JadwalKelasSiswaWaliMurid.routeName),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.only(left: 16),
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
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Jadwal',
                                  style: mServiceTitleStyle,
                                ),
                                const SizedBox(
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
                                builder: (_) => const WaliMuridSubMenuKesiswaan()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.only(left: 16),
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
                              padding: const EdgeInsets.only(left: 16),
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
