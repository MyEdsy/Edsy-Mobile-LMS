import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/input_nilai_screens.dart';

import '../../../../../constants.dart';
import '../mata_pelajaran_untuk_absen_screen.dart';
import '../mata_pelajaran_untuk_laporan_absen.dart';

class MenuPresensiKelas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<MenuPresensiKelas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 0, bottom: 12),
          child: Text(
            'Presensi Kelas',
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
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, MataPelajaranUntukAbsen.routeName),
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
                            Image.asset('assets/images/category.png'),
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
                                  Text('Absen harian',
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
                          context, MataPelajaranUntukLaporanAbsen.routeName),
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
                                    'Rekap Absen',
                                    style: mServiceTitleStyle,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('Rekap absen \nkelas',
                                      style: mServiceSubtitleStyle)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
