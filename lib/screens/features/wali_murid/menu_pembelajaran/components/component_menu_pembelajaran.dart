import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas_scareens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian_scareens.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas_screen.dart';

import '../../../../../constants.dart';

class WaliMuridKomponenMenuPembelajaranSiswa extends StatefulWidget {
  const WaliMuridKomponenMenuPembelajaranSiswa({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<WaliMuridKomponenMenuPembelajaranSiswa> {
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
          height: 270,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, SubMenuBahanajarSiswaWaliMurid.routeName),
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
                          Image.asset('assets/images/material.png'),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Bahan Ajar',
                                  style: mServiceTitleStyle,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text('Bahan Ajar', style: mServiceSubtitleStyle)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // print("kesini kok");
                      Navigator.pushNamed(context, WaliMuridSubMenuTugasSiswa.routeName);
                    },
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
                          Image.asset('assets/images/task.png'),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Tugas',
                                  style: mServiceTitleStyle,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text('Lihat tugas',
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
                height: 10,
              ),
              //JadwalKelasGuru
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, WaliMuridSubMenuQuizSiswa.routeName),
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
                          Image.asset(
                            'assets/images/exam.png',
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
                                  'Quiz / Ujian Online',
                                  style: mServiceTitleStyle,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text('Lihat quiz / Ujian',
                                    style: mServiceSubtitleStyle)
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
