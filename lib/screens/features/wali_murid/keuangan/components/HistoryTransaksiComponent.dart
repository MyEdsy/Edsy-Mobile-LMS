import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/components/slider_no_jadwal.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/DetailHistoryScreens.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../helper/currency_format.dart';
import '../../../../../main.dart';
import '../../../../../size_config.dart';
import '../../../../OnBoarding/OnBoarding.dart';

class WaliMuridHistoryComponent extends StatefulWidget {
  @override
  _WaliMuridHistoryTransaksi createState() => _WaliMuridHistoryTransaksi();
}

class _WaliMuridHistoryTransaksi extends State<WaliMuridHistoryComponent> {
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataTagihanSiswaLunas = [];
  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        // _search(),
        const SizedBox(
          height: 10,
        ),
        isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: mGreyColor,
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
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
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: dataTagihanSiswaLunas == null
                          ? 0
                          : dataTagihanSiswaLunas.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _dataTagihan(
                          '${dataTagihanSiswaLunas[index]['no_invoice']}',
                          '${dataTagihanSiswaLunas[index]['paket_pembayaran']['type_pembayaran']}',
                          '${dataTagihanSiswaLunas[index]['paket_pembayaran']['nama_paket']}',
                          CurrencyFormat.convertToIdr(
                              dataTagihanSiswaLunas[index]['grand_total'], 2),
                          '${parseDateIndoFullNameMount(dataTagihanSiswaLunas[index]['time_transaksi'])} (Tgl. Transaksi)',
                          const Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            label: Text(
                              'Lunas',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: kColorTealToSlow,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, WaliMuridDetailHistoryScreens.routeName,
                                  arguments: {
                                    'noInvoice': dataTagihanSiswaLunas[index]
                                        ['no_invoice'],
                                    'id': dataTagihanSiswaLunas[index]['id'],
                                    'id_paket_pembayaran':
                                        dataTagihanSiswaLunas[index]
                                            ['id_paket_pembayaran'],
                                    'type': dataTagihanSiswaLunas[index]
                                        ['paket_pembayaran']['type_pembayaran'],
                                    'status': dataTagihanSiswaLunas[index]
                                        ['status'],
                                    'tglTransaksi' : dataTagihanSiswaLunas[index]
                                    ['time_transaksi'],
                                    'bukti_bayar': dataTagihanSiswaLunas[index]
                                    ['bukti_bayar']
                                  });
                            },
                            child: const Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                FontAwesomeIcons.eye,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Detail',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: kPrimaryColor,
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 15)
                ],
              )
        // Icon(FontAwesomeIcons.fileInvoice, color: kPrimaryColor,),
        // Icon(FontAwesomeIcons.fileInvoiceDollar, color: kColorTealSlow,),
        // Icon(FontAwesomeIcons.upload, color: kColorYellow,))
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

  _dataTagihan(
      noInvoice, paketTagihan, namaPaket, jumlah, jatuhTempo, status, lihat) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.all(10),
        height: 200,
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
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: MediaQuery.of(context).size.width - 180,
                  child: Text(
                    noInvoice,
                    overflow: TextOverflow.ellipsis,
                    style: (const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const Spacer(),
                status
              ],
            ),
            Container(
              padding: const EdgeInsets.all(1.0),
              width: MediaQuery.of(context).size.width - 160,
              child: Text(
                paketTagihan,
                overflow: TextOverflow.ellipsis,
                style: (const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.box,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    namaPaket,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.commentDollar,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    jumlah,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.calendar,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  jatuhTempo,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [lihat],
            )
          ],
        ));
  }

  _search() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      width: SizeConfig.screenWidth * 0.8,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Cari Data...",
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }

  Future<String> getData() async {
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
      final response = await http.get(
          "${tagihanPembayaranLunas}/${data['nisn']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataTagihanSiswaLunas = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
          print(dataTagihanSiswaLunas);
        } else if (status == false && code == 403) {
          dataTagihanSiswaLunas = [];
        } else if (status == false && code == 401) {
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
                        context, HomeWaliMurid.routeName, (r) => false);
                  },
                  btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }

    return 'success';
  }
}
