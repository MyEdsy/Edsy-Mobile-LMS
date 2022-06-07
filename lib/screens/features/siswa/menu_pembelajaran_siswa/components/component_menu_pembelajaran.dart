import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas_scareens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian_scareens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_bahan_ajar_siswa/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_quiz_siswa/quiz_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas_scareens.dart';

import '../../../../../constants.dart';

class KomponenMenuPembelajaranSiswa extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<KomponenMenuPembelajaranSiswa> {
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
          height: 270,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, SubMenuBahanajarSiswa.routeName),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.only(left: 16),
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
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Bahan Ajar',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // print("kesini kok");
                      Navigator.pushNamed(context, SubMenuTugasSiswa.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.only(left: 16),
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
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Tugas',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
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
              SizedBox(
                height: 10,
              ),
              //JadwalKelasGuru
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, SubMenuQuizSiswa.routeName),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.only(left: 16),
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
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Quiz / Ujian Online',
                                  style: mServiceTitleStyle,
                                ),
                                SizedBox(
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
                  //onTap: () => Navigator.pushNamed(
                  //                         context, SubMenuWaliKelas.routeName),
                  // Expanded(
                  //   child: Container(
                  //       margin: EdgeInsets.only(left: 8),
                  //       padding: EdgeInsets.only(left: 16),
                  //       height: 64,
                  //       decoration: BoxDecoration(
                  //         color: mFillColor,
                  //         borderRadius: BorderRadius.circular(12),
                  //         border: Border.all(color: mBorderColor, width: 1),
                  //       ),
                  //       child: GestureDetector(
                  //         // onTap: () => Navigator.pushNamed(
                  //         //     context, SubMenuUjian.routeName),
                  //         child: Row(
                  //           children: <Widget>[
                  //             Image.asset('assets/images/exam.png'),
                  //             Padding(
                  //               padding: EdgeInsets.only(left: 16),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: <Widget>[
                  //                   Text(
                  //                     'Ujian',
                  //                     style: mServiceTitleStyle,
                  //                   ),
                  //                   Text(
                  //                     'Lihat ujian',
                  //                     style: mServiceSubtitleStyle,
                  //                   )
                  //                 ],
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
