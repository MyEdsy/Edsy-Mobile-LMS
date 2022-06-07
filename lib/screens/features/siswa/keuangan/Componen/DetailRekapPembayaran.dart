import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/slider_no_jadwal.dart';
import 'package:school_apps/screens/features/siswa/home_siswa.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../helper/currency_format.dart';
import '../../../../../main.dart';
import '../../../../../size_config.dart';
import '../../../../OnBoarding/OnBoarding.dart';
import '../Screens/DetailRekapPembayaranScreens.dart';

class DetailRekapPembayaranComponent extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<DetailRekapPembayaranComponent> {

  var isLoading = false;
  var responseJson;
  var totalLunas;
  var totalBelumLunas;
  List<Map<String, dynamic>> detailRekapTransaksi = [];
  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(DetailRekapScreens.args['id_paket_pembayaran']);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kColorTealToSlow)),
              SizedBox(
                width: 5,
              ),
              Text(
                'Lunas',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kColorRedSlow)),
              SizedBox(
                width: 5,
              ),
              Text(
                'Belum Lunas',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300])),
              SizedBox(
                width: 5,
              ),
              Text(
                'Belum Tertagih',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Lunas',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '${totalLunas == null ? '-' : CurrencyFormat.convertToIdr(totalLunas, 2)}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Belum Lunas',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '${totalBelumLunas == null ? '-' : CurrencyFormat.convertToIdr(totalBelumLunas, 2)}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Tagihan',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '${DetailRekapScreens.args['grandTotal'] == null ? '-' : CurrencyFormat.convertToIdr(DetailRekapScreens.args['grandTotal'], 2)}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
                itemCount: detailRekapTransaksi == null
                    ? 0
                    : detailRekapTransaksi.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _dataTagihan(
                      '${detailRekapTransaksi[index]['paket_pembayaran']['nama_paket']}',
                      '${bulanIndo(detailRekapTransaksi[index]['tempo_bayaran'])} - ${detailRekapTransaksi[index]['tahun_bayaran']}',
                      CurrencyFormat.convertToIdr(
                          detailRekapTransaksi[index]['grand_total'], 2),
                    '${detailRekapTransaksi[index]['statusTagihan']}',
                    '${detailRekapTransaksi[index]['status']}',
                  );
                }),
            SizedBox(height: 15)
          ],
        )
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

  _dataTagihan(namaPaket, tanggal, jumlah, statusTagihan, status) {
    var bgColor;
    var txtColor;
    if(statusTagihan == 'Sudah Lunas') {
      bgColor = kColorTealToSlow;
      txtColor = Colors.white;
    }else if(statusTagihan == 'Belum Bayar' || status == 'Pending') {
      bgColor = kColorRedSlow;
      txtColor = Colors.white;
    }else {
      bgColor = Colors.grey[300];
      txtColor = mTitleColor;
    }
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
            color: bgColor,
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
                  color: txtColor,
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
                    style: TextStyle(color: txtColor, fontSize: 13),
                  ),
                ),
                // Spacer(),
                // status
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.calendar,
                  color: txtColor,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    tanggal,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: txtColor, fontSize: 13),
                  ),
                ),
                // Spacer(),
                // status
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.commentDollar,
                  color: txtColor,
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
                    style: TextStyle(color: txtColor, fontSize: 13),
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
      await http.get("${detailRekapTransaksiUrl}/$id", headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          totalLunas = responseJson['totalLunas'];
          totalBelumLunas = responseJson['totalBelumLunas'];
          detailRekapTransaksi = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
          print(totalLunas);
          print(detailRekapTransaksi);
        } else if (status == false && code == 403) {
          detailRekapTransaksi = [];
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
