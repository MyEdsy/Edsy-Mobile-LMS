import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/sub_menu_penilaian_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_jadwal_hari_ini/jadwal_screen.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/sub_presensi_kelas.dart';

import '../../../../../constants.dart';

class MenuGuru extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<MenuGuru> {
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
                    onTap: () {
                      // Navigator.pushNamed(
                      //     context, SubMenuManajemenPenilaian.routeName);
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: SubMenuManajemenPenilaian(),
                        ),
                      );
                    },
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
                          Image.asset('assets/images/managements.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Penilaian',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('Manajemen Nilai',
                                    style: mServiceSubtitleStyle)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, SubMenuPresensiKelas.routeName),
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
                          Image.asset('assets/images/absent.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Presensi Kelas',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('Presensi', style: mServiceSubtitleStyle)
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
                    onTap: () =>
                        Navigator.pushNamed(context, JadwalKelasGuru.routeName),
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
                            'assets/images/schedules.png',
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
                                Text('Jadwal Hari Ini',
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
                      // Navigator.pushNamed(
                      // context, SubMenuWaliKelas.routeName);
                      AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: true,
                              title: 'Peringatan',
                              desc: "Dalam pengembangan",
                              btnOkOnPress: () {},
                              btnOkIcon: Icons.cancel,
                              btnOkColor: kColorYellow)
                          .show();
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
                          Image.asset('assets/images/teachers.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Wali Kelas',
                                  style: mServiceTitleStyle,
                                ),
                                Text(
                                  'Menu Wali \nKelas',
                                  style: mServiceSubtitleStyle,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
