import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_invoice.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/HistoryTransaksi.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/RekapPembayaran.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/TagihanScreens.dart';
import '../../../../../constants.dart';

class WaliMuridMenuKeuanganKomponen extends StatefulWidget {
  const WaliMuridMenuKeuanganKomponen({Key? key}) : super(key: key);

  @override
  _WaliMuridMenuKeuanganKomponen createState() => _WaliMuridMenuKeuanganKomponen();
}

class _WaliMuridMenuKeuanganKomponen extends State<WaliMuridMenuKeuanganKomponen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          SliderInvoice(),
          const SizedBox(
            height: 12,
          ),
          // Service Section
          _menuKeuangan(),
          const SizedBox(
            height: 12,
          ),
          // TugasSiswa(),
          const SizedBox(
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
                            context, WaliMuridTagihanScreens.routeName),
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
                              Image.asset('assets/images/invoice-icon.png', width: 35,height: 35,),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Tagihan',
                                      style: mServiceTitleStyle,
                                    ),
                                    const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, WaliMuridHistoryScreens.routeName);
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
                              Image.asset('assets/images/transaction-history.png', width: 32, height: 32,),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Histori Transaksi',
                                      style: mServiceTitleStyle,
                                    ),
                                    const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              //JadwalKelasGuru
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, WaliMuridRekapPembayaranScreens.routeName),
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
                                'assets/images/payment.png',
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
                                      'Rekap Pembayaran',
                                      style: mServiceTitleStyle,
                                    ),
                                    const SizedBox(
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
