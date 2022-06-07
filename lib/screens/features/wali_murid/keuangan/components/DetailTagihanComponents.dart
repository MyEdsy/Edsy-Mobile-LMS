import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/default_button_custome_color.dart';
import 'package:school_apps/components/slider_no_jadwal.dart';
import 'package:school_apps/helper/currency_format.dart';
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/DetailTagihanScreens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../../../../../size_config.dart';
import '../Screens/PilihMetodePembayaran.dart';
import '../response/invoice_response.dart';

class WaliMuridDetailTagihanScreen extends StatefulWidget {
  const WaliMuridDetailTagihanScreen({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<WaliMuridDetailTagihanScreen> {
  var isLoading = false;
  var responseJson;
  var totalBiaya;
  List<Map<String, dynamic>> detailTagihanSiswa = [];
  var code;
  late bool status = false;

  var isLoading2 = false;
  var responseJson2;
  var dataTransaksi;
  var code2;
  late bool status2 = false;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType? fileType;
  String? fileName;
  String? path;
  Map<String, String>? paths;
  List<String>? extensions;
  String? name;
  String? filePath;
  String? files;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    if (WaliMuridDetailTagihanScreens.args['status'] == 'Pending') {
      getTransaksiXendit(WaliMuridDetailTagihanScreens.args['noInvoice']);
    }
    getData(WaliMuridDetailTagihanScreens.args['id_paket_pembayaran']);
  }

  @override
  Widget build(BuildContext context) {
    // print('$buktiBayarUrl${DetailTagihanScreens
    //     .args['bukti_bayar']}');
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  'No. ${WaliMuridDetailTagihanScreens.args['noInvoice']}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: kColorBlue,
              ),
            )
          ],
        ),
        // SizedBox(
        //   height: 10,
        // ),
        // Row(
        //   children: [
        //     Container(
        //       margin: EdgeInsets.only(left: 16),
        //       child: Chip(
        //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //         avatar: Icon(FontAwesomeIcons.calendar, color: Colors.white,),
        //         label: Text(
        //           'Jatuh Tempo 27 Maret 2022',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         backgroundColor: kColorTealToSlow,
        //       ),
        //     )
        //   ],
        // ),
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
                physics: const ScrollPhysics(),
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
                      itemCount: detailTagihanSiswa == null
                          ? 0
                          : detailTagihanSiswa.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
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
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16, left: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          '${totalBiaya == null ? '-' : CurrencyFormat.convertToIdr(totalBiaya, 2)}',
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16, left: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          '${totalBiaya == null ? '-' : CurrencyFormat.convertToIdr(totalBiaya, 2)}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  WaliMuridDetailTagihanScreens.args['status'] == 'Belum Lunas'
                      ? Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: const Text(
                                'ℹ️ Klik Bayar untuk melakukan transaksi melalui Payment Gateway. Setelah melakukan pembayaran, cek dimenu Histori Transaksi.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: DefaultButton(
                                text: "Bayar",
                                press: () {
                                  var transaksi = {
                                    'external_id':
                                        WaliMuridDetailTagihanScreens.args['noInvoice'],
                                    'idsettingsiswa':
                                        WaliMuridDetailTagihanScreens.args['id'],
                                    'id_paket_pembayaran': WaliMuridDetailTagihanScreens
                                        .args['id_paket_pembayaran'],
                                    'amount': totalBiaya,
                                    'pembayaran': detailTagihanSiswa,
                                    'payer_email': data['email'],
                                    'username': data['username'],
                                  };
                                  if (totalBiaya > 0) {
                                    Transaksi.createTransaksi(
                                        transaksi, context);
                                  } else {
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.ERROR,
                                            animType: AnimType.RIGHSLIDE,
                                            headerAnimationLoop: true,
                                            title: 'Peringatan',
                                            desc: "Jumlah tidak boleh 0",
                                            btnOkOnPress: () {},
                                            btnOkIcon: Icons.cancel,
                                            onDissmissCallback: (type) async {
                                              //SignInScreen
                                            },
                                            btnOkColor: kColorRedSlow)
                                        .show();
                                  }
                                  // Navigator.pushNamed(context, PilihMetodePembayaran.routeName);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: DefaultButtonCustomeColor(
                                color: kColorTealToSlow,
                                text: "Upload Bukti Pembayaran",
                                press: () {
                                  file();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(child: _files()),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: DefaultButtonCustomeColor(
                                color: kColorBlue,
                                text: "Kirim Bukti Pembayaran",
                                press: () {
                                  if (totalBiaya > 0) {
                                    Transaksi.uploadBuktiBayar(
                                        '${WaliMuridDetailTagihanScreens.args['noInvoice']}',
                                        '${WaliMuridDetailTagihanScreens.args['id']}',
                                        '${WaliMuridDetailTagihanScreens.args['id_paket_pembayaran']}',
                                        '$totalBiaya',
                                        '$detailTagihanSiswa',
                                        data['email'],
                                        data['nisn'],
                                        filePath,
                                        context);
                                  } else {
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.ERROR,
                                            animType: AnimType.RIGHSLIDE,
                                            headerAnimationLoop: true,
                                            title: 'Peringatan',
                                            desc: "Jumlah tidak boleh 0",
                                            btnOkOnPress: () {},
                                            btnOkIcon: Icons.cancel,
                                            onDissmissCallback: (type) async {
                                              //SignInScreen
                                            },
                                            btnOkColor: kColorRedSlow)
                                        .show();
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : WaliMuridDetailTagihanScreens.args['bukti_bayar'] == null
                          ? Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: DefaultButton(
                                text: "Lanjutkan Pembayaran",
                                press: () {
                                  if (dataTransaksi['url_xendit'] == null) {
                                    Navigator.pushNamed(context,
                                        WaliMuridPilihMetodePembayaran.routeName,
                                        arguments: {
                                          'url':
                                              "https://checkout-staging.xendit.co/web/${dataTransaksi['no_transaksi']}",
                                          'from': 2,
                                          'noInvoice': WaliMuridDetailTagihanScreens
                                              .args['noInvoice'],
                                          'id_paket_pembayaran':
                                              WaliMuridDetailTagihanScreens
                                                  .args['id_paket_pembayaran']
                                        });
                                  } else {
                                    Navigator.pushNamed(context,
                                        WaliMuridPilihMetodePembayaran.routeName,
                                        arguments: {
                                          'url': dataTransaksi['url_xendit'],
                                          'from': 2,
                                          'noInvoice': WaliMuridDetailTagihanScreens
                                              .args['noInvoice'],
                                          'id_paket_pembayaran':
                                              WaliMuridDetailTagihanScreens
                                                  .args['id_paket_pembayaran']
                                        });
                                  }
                                  // Navigator.pushNamed(context, PilihMetodePembayaran.routeName);
                                },
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: Image.network(
                                '$buktiBayarUrl${WaliMuridDetailTagihanScreens.args['bukti_bayar']}',
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
                            ),
                  //Navigator.pushNamed(context, UploadBuktiPembayaranScreens.routeName);
                ],
              ),
        const SizedBox(
          height: 20,
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

  _dataTagihan(namaPaket, jumlah) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.all(10),
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
                        context, HomeWaliMurid.routeName, (r) => false);
                  },
                  btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }

    return 'success';
  }

  Future<String> getTransaksiXendit(noInv) async {
    setState(() {
      isLoading2 = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response =
          await http.get("${transaksiXendit}/$noInv/PENDING", headers: headers);
      responseJson2 = json.decode(response.body);

      setState(() {
        isLoading2 = false;
        status2 = responseJson2['status'];
        code2 = responseJson2['code'];
        if (status2 == true && code2 == 200) {
          dataTransaksi = responseJson2['result'];
        } else if (status2 == false && code2 == 403) {
          dataTransaksi = {};
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
          status2 = false;
          isLoading2 = false;
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

  void file() async {
    setState(() => isLoadingPath = true);
    try {
      if (isMultiPick) {
        path = null;
        paths = await FilePicker.getMultiFilePath(
            type: fileType ?? FileType.any, allowedExtensions: extensions);
      } else {
        path = await FilePicker.getFilePath(
            type: fileType ?? FileType.any, allowedExtensions: extensions);
        paths = null;
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      isLoadingPath = false;
      fileName = path != null
          ? path!.split('/').last
          : paths != null
              ? paths!.keys.toString()
              : '...';
    });
  }

  _files() {
    return Builder(
      builder: (BuildContext context) => isLoadingPath
          ? new Container()
          : path != null || paths != null
              ? Container(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  height: 200,
                  child: Scrollbar(
                      child: ListView.separated(
                    itemCount:
                        paths != null && paths!.isNotEmpty ? paths!.length : 1,
                    itemBuilder: (BuildContext context, int index) {
                      final bool isMultiPath =
                          paths != null && paths!.isNotEmpty;
                      // final int fileNo = index + 1;
                      name = (isMultiPath
                          ? paths!.keys.toList()[index]
                          : fileName ?? '...');
                      filePath = isMultiPath
                          ? paths!.values.toList()[index].toString()
                          : path;
                      // return ListTile(
                      //     title: Text(name!,
                      //         overflow: TextOverflow.ellipsis,
                      //         maxLines: 10,
                      //         style: const TextStyle(
                      //             fontSize: 14, color: Color(0xFF4B4B4B)
                      //             // letterSpacing: .6
                      //             )),
                      //     subtitle: new Text(filePath!),
                      //     );
                      return Container(
                        margin: const EdgeInsets.only(left: 17, right: 17),
                        child: Image.file(File(filePath!), fit: BoxFit.fill),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        new Container(),
                  )),
                )
              : new Container(),
    );
  }
}
