import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_invoice.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/HistoryTransaksi.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/RekapPembayaran.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/TagihanScreens.dart';
import '../../../../../constants.dart';

class MenuKeuanganKomponen extends StatefulWidget {
  @override
  _MenuKeuanganKomponen createState() => _MenuKeuanganKomponen();
}

class _MenuKeuanganKomponen extends State<MenuKeuanganKomponen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SliderInvoice(),
          SizedBox(
            height: 12,
          ),
          // Service Section
          _menuKeuangan(),
          SizedBox(
            height: 12,
          ),
          // TugasSiswa(),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  _menuKeuangan () {
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
                            context, TagihanScreens.routeName),
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
                              Image.asset('assets/images/invoice-icon.png', width: 35,height: 35,),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Tagihan',
                                      style: mServiceTitleStyle,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Tagihan Anda', style: mServiceSubtitleStyle)
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
                          Navigator.pushNamed(context, HistoryScreens.routeName);
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
                              Image.asset('assets/images/transaction-history.png', width: 32, height: 32,),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Histori Transaksi',
                                      style: mServiceTitleStyle,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Histori Transaksi Anda',
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
                            context, RekapPembayaranScreens.routeName),
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
                                'assets/images/payment.png',
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
                                      'Rekap Pembayaran',
                                      style: mServiceTitleStyle,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Rekap Pembayaran Anda',
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
