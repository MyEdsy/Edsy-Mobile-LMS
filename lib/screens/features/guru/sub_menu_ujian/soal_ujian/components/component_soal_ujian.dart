import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/soal_ujian_screens.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

import '../../../home_guru.dart';
import '../update_soal_ujian.dart';

class komponentSoalUjian extends StatefulWidget {
  @override
  _komponentSoalUjian createState() => _komponentSoalUjian();
}

class _komponentSoalUjian extends State<komponentSoalUjian> {
  var isLoading = false;
  var responseJson, dataSoal;
  var status, code;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);
  Future<void>? _launched;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: mGreyColor,
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, __) => (dummyListViewCell()),
                itemCount: 10,
              ),
            ),
          )
        : ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListView.separated(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: dataSoal == null ? 0 : dataSoal.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    print(dataSoal[index]);
                    int no = index + 1;
                    return _listMataPelajaran(
                        '$no. ${dataSoal[index]['soal']}',
                        '${dataSoal[index]['file']}',
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, UpdateSoalUjian.routeName,
                                arguments: {
                                  "idTugas": dataSoal[index]['id_tugas'],
                                  "idDetailSoal": dataSoal[index]
                                      ['idDetailTugas'],
                                  "idSoal": dataSoal[index]['id'],
                                  "soal": dataSoal[index]['soal'],
                                  "file": dataSoal[index]['file']
                                });
                          },
                          child: const Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            avatar: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                            backgroundColor: kColorBlue,
                            label: Text(
                              "Ubah Soal",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => Navigator.pushNamed(
                          //     context, InputKategoriNilaiKeterampilan.routeName,
                          //     arguments: dataMapel[index]),
                          child: const Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            avatar: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                              size: 20,
                            ),
                            backgroundColor: kPrimaryColor,
                            label: Text(
                              "Periksa Jawaban",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launched = _launchInBrowser(
                                '${baseUrlTugas}${dataSoal[index]['file']}');
                            // _launched = _launchInBrowser('https://www.youtube.com/watch?v=1YE4CIzqG_Y');
                          },
                          child: const Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            avatar: Icon(
                              FontAwesomeIcons.fileDownload,
                              color: Colors.white,
                              size: 20,
                            ),
                            backgroundColor: kColorTealSlow,
                            label: Text(
                              "Lihat File",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ));
                  }),
              SizedBox(height: 10)
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

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _listMataPelajaran(String soal, files, GestureDetector ubah,
      GestureDetector periksa, GestureDetector file) {
    var gambar = files.substring(files.length - 3);
    if (files != "null" && gambar != 'png') {
      return Row(
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(soal,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: (TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                        child: Row(
                          children: [file],
                        )),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width - 160,
                            child: Row(
                              children: [ubah],
                            )),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width - 160,
                            child: Row(
                              children: [periksa],
                            )),
                        Divider(color: Colors.black)
                      ],
                    )
                  ],
                ),
              ))
        ],
      );
    } else {
      if(files != 'null') {
        print("harusnya gambar aja");
        return Row(
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(soal,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: (TextStyle(fontWeight: FontWeight.bold))),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "$baseUrlTugas$files",
                            width: MediaQuery.of(context).size.width - 160,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width - 160,
                              child: Row(
                                children: [ubah],
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width - 160,
                              child: Row(
                                children: [periksa],
                              )),
                          Divider(color: Colors.black)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        );
      }else {
        print("harusnya gak ada gambar sama pdf dll");
        return Row(
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(soal,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: (TextStyle(fontWeight: FontWeight.bold))),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width - 160,
                              child: Row(
                                children: [ubah],
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width - 160,
                              child: Row(
                                children: [periksa],
                              )),
                          Divider(color: Colors.black)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        );
      }
    }
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
          "${getSoalbyIdDetailTugas}${SoalUjian.dataTugas['idDetailSoal']}",
          headers: headers);
      responseJson = json.decode(response.body);
      // Future.delayed(Duration(seconds: 2)).then((value) {
      //   utilsApps.hideDialog(context);
      // });
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataSoal = responseJson['result'];
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
