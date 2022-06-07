import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/DetailHistoryScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../helper/currency_format.dart';
import '../../../../../main.dart';
import '../../../../../server/api.dart';
import '../../../../../size_config.dart';
import '../../../../OnBoarding/OnBoarding.dart';
import '../../home_siswa.dart';

class DetailHistoryComponenet extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<DetailHistoryComponenet> {

  var isLoading = false;
  var responseJson;
  var totalBiaya;
  List<Map<String, dynamic>> detailTagihanSiswa = [];
  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(DetailHistoryScreens.args['id_paket_pembayaran']);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  'No. Tagihan ${DetailHistoryScreens.args['noInvoice']}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: kColorBlue,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                avatar: Icon(FontAwesomeIcons.calendar, color: Colors.white,),
                label: Text(
                  'Tgl. Transaksi ${parseDateIndoFullNameMount(DetailHistoryScreens.args['tglTransaksi'])}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: kColorTealToSlow,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        isLoading
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: mGreyColor,
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, __) => (dummyListViewCell()),
              itemCount: 20,
            ),
          ),
        )
            : ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            // _search(),
            SizedBox(
              height: 15,
            ),
            ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: detailTagihanSiswa == null
                    ? 0
                    : detailTagihanSiswa.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _dataTagihan(
                    '${detailTagihanSiswa[index]['nama_komponen']}',
                    CurrencyFormat.convertToIdr(
                        double.parse(
                            detailTagihanSiswa[index]['besaran_biaya']),
                        2),
                  );
                }),
            SizedBox(height: 10),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    '${totalBiaya == null ? '-' : CurrencyFormat.convertToIdr(totalBiaya, 2)}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '${totalBiaya == null ? '-' : CurrencyFormat.convertToIdr(totalBiaya, 2)}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            DetailHistoryScreens.args['bukti_bayar'] != null ?
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Image.network(
                '$buktiBayarUrl${DetailHistoryScreens.args['bukti_bayar']}',
                // 'http://myedsy.xavepa.ubl.ac.id/BuktiBayar/1650207239049HLBtexk.jpg',
                errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
                  // Appropriate logging or analytics, e.g.
                  // myAnalytics.recordError(
                  //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                  //   exception,
                  //   stackTrace,
                  // );
                  // print('$buktiBayarUrl${DetailTagihanScreens.args['bukti_bayar']}');
                  return Text('Bukti pembayaran tidak dapat diakses.....', style: mTitleStyleNameApps,);
                },
              ),
            ) : Container()
          ],
        ),
      ],
    );
  }

  Widget dummyListViewCell() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 48.0,
            height: 48.0,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 40.0,
                  height: 8.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _dataTagihan(namaPaket, jumlah) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        padding: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
            color: mFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: mBorderColor, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.box,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    namaPaket,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.commentDollar,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    jumlah,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Future<String> getData(id) async {
    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response =
      await http.get("${detailTagihanPembayaran}/$id", headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          totalBiaya = responseJson['totalTagihan'];
          detailTagihanSiswa = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
          print(totalBiaya);
          print(detailTagihanSiswa);
        } else if (status == false && code == 403) {
          detailTagihanSiswa = [];
        } else {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: "Sesi anda telah habis, mohon login kembali",
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              onDissmissCallback: (type) async {
                //SignInScreen
                Navigator.pushNamedAndRemoveUntil(
                    context, Onboarding.routerName, (r) => false);
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
              },
              btnOkColor: kColorRedSlow)
              .show();
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          status = false;
          isLoading = false;
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: "Tidak dapat terhububg ke server",
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              onDissmissCallback: (type) async {
                //SignInScreen
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeSiswa.routeName, (r) => false);
              },
              btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }

    return 'success';
  }
}
