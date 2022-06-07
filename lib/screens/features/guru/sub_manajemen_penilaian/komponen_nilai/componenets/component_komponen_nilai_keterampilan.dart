import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai_keterampilan_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/response/response_komponen_nilai.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import '../../../home_guru.dart';

class KategoriNilaiKeterampilan extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<KategoriNilaiKeterampilan> {
  var isLoading = false;
  var responseJson,
      dataKomponenNilai,
      status,
      code,
      totalBobot = 0,
      selisih = 0,
      totalData = 0;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  TextEditingController namaKomponenController = TextEditingController(),
      bobotController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // dataMapelFromRoutes = ModalRoute.of(context)!.settings.arguments as Map;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Komponen",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              _chipColor()
            ],
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: "Komponen Nilai",
                    style: mTitleStyle,
                    children: [
                      TextSpan(
                        text: " (${totalData})",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: dataKomponenNilai == null
                    ? 0
                    : dataKomponenNilai.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _listKomponen(
                      dataKomponenNilai[index]['id'],
                      dataKomponenNilai[index]['nama_komponen'],
                      dataKomponenNilai[index]['bobot'].toString(),
                      context);
                }),
            SizedBox(height: 10)
          ],
        )
      ],
    );
  }

  _chipColor() {
    if (totalBobot <= 50) {
      return Chip(
        backgroundColor: kColorRedSlow,
        label: Text(
            "Komponen nilai masih ${totalBobot}% kurang ${selisih}% lagi",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      );
    } else if (totalBobot >= 50 && totalBobot < 100) {
      return Chip(
        backgroundColor: kColorYellow,
        label: Text("${totalBobot}%, komponen nilai kurang ${selisih}% lagi",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      );
    } else {
      return Chip(
        backgroundColor: kColorTealToSlow,
        label: Text("${totalBobot}%, komponen nilai sudah lengkap 👏",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      );
    }
  }

  _listKomponen(idKomponen, String komponen, String persentase, context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 110,
      decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.class__rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      komponen,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Icon(
                    Icons.line_weight,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      '${persentase}%',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _popUpdateData(
                                  "keterampilan",
                                  InputKategoriNilaiKeterampilan.dataMapelFromRoutes['NIP'],
                                  InputKategoriNilaiKeterampilan.dataMapelFromRoutes['idMapel'],
                                  InputKategoriNilaiKeterampilan
                                      .dataMapelFromRoutes['idkelompokkls'],
                                  komponen,
                                  idKomponen,
                                  persentase,
                                  context);
                            },
                            child: const Chip(
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: kColorYellow,
                              label: Text(
                                "Ubah",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _popUpHapusData(komponen, idKomponen, context);
                            },
                            child: Chip(
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                Icons.restore_from_trash_sharp,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: kColorRedSlow,
                              label: Text(
                                "Hapus",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _popUpdateData(type, nip, kodeMapel, idKelompokKelas, namaKomponen,
      idKomponen, bobot, context) {
    namaKomponenController.text = namaKomponen;
    bobotController.text = bobot;
    // set up the buttons
    Widget cancelButton = GestureDetector(
        onTap: () => {Navigator.of(context).pop()},
        child: const Chip(
          avatar: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          backgroundColor: kColorRedSlow,
          label: Text("Batal",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));
    Widget continueButton = GestureDetector(
        onTap: () => {
          KomponenNilaiResponse.updateKomponenNilaiRes(
              namaKomponenController.text,
              type,
              bobotController.text,
              nip,
              '${kodeMapel}',
              '${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['Tahun']}',
              InputKategoriNilaiKeterampilan.dataMapelFromRoutes['Semester'],
              '${idKelompokKelas}',
              idKomponen,
              context)
        },
        child: const Chip(
          avatar: Icon(
            Icons.send,
            color: Colors.white,
          ),
          backgroundColor: kColorTealToSlow,
          label: Text("Submit",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Ubah Komponen",
        style: mTitleStyle16,
      ),
      content: Container(
        height: 155,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: namaKomponenController,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                  fontFamily: "Poppins-Bold",
                  color: Color.fromRGBO(58, 66, 86, 1.0)),
              decoration: const InputDecoration(
                icon: Icon(Icons.class__rounded),
                hintText: 'Nama Komponen',
                labelText: 'Nama Komponen',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: bobotController,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                // fontSize: ScreenUtil.getInstance().setSp(25),
                  fontFamily: "Poppins-Bold",
                  color: Color.fromRGBO(58, 66, 86, 1.0)
                // letterSpacing: .6
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.line_weight),
                hintText: 'Bobot',
                labelText: 'Bobot',
              ),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _popUpHapusData(namaKomponen, idKomponen, contex) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.QUESTION,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Peringatan',
        desc: 'Yakin ingin menghapus komponen ${namaKomponen}',
        btnOkOnPress: () {},
        btnOkIcon: Icons.restore_from_trash,
        onDissmissCallback: (type) {
          KomponenNilaiResponse.hapusKomponenNilaiRes(idKomponen, context);
        },
        btnOkColor: Colors.deepOrangeAccent)
        .show();
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
          "${komponenNilai}keterampilan/${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['NIP']}/${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['idMapel']}/${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['idkelompokkls']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        totalBobot = responseJson['totalBobot'];
        selisih = responseJson['selisih'];
        totalData = responseJson['totalData'];
        if (status == true && code == 200) {
          dataKomponenNilai = responseJson['result'];
          print(dataKomponenNilai);
        } else if (status == false && code == 403) {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['message'],
              btnOkOnPress: () {},
              btnOkIcon: Icons.check,
              onDissmissCallback: (type) {
                //SignInScreen
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeGuru.routeName, (r) => false);
                // Navigator.pushNamed(
                //     context, SignInScreen.routeName);
              },
              btnOkColor: kColorYellow)
              .show();
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
                    context, SignInScreen.routeName, (r) => false);
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
              },
              btnOkColor: kColorRedSlow)
              .show();
        }
      });
    } catch (e) {
      setState(() {
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
                  context, HomeGuru.routeName, (r) => false);
            },
            btnOkColor: kColorRedSlow)
            .show();
      });
    }

    return 'success';
  }
}
