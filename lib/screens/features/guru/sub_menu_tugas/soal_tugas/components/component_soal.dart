import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/components/PilihanGandaHtml.dart';
import 'package:school_apps/components/pilihanGanda.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

import '../../../home_guru.dart';
import '../jawaban_screen.dart';
import '../soal_screens.dart';
import '../update_soal.dart';

class komponentSoal extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<komponentSoal> {
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
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, __) => (dummyListViewCell()),
                itemCount: 10,
              ),
            ),
          )
        : ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: dataSoal == null ? 0 : dataSoal.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              // print(dataSoal[index]);
              int no = index + 1;
              return _listMataPelajaran(
                  '$no. ${dataSoal[index]['soal']}',
                  '${dataSoal[index]['file']}',
                  '${dataSoal[index]['pilihan_a']}',
                  '${dataSoal[index]['pilihan_b']}',
                  '${dataSoal[index]['pilihan_c']}',
                  '${dataSoal[index]['pilihan_d']}',
                  '${dataSoal[index]['pilihan_e']}',
                  '${dataSoal[index]['jawaban_benar']}',
                  GestureDetector(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      // print(SoalTugas.dataTugas['type']);
                      var dataNya = {
                        "id": dataSoal[index]['id'],
                        "soal": dataSoal[index]['soal'],
                        "pilihan_a": dataSoal[index]['pilihan_a'],
                        "pilihan_b": dataSoal[index]['pilihan_b'],
                        "pilihan_c": dataSoal[index]['pilihan_c'],
                        "pilihan_d": dataSoal[index]['pilihan_d'],
                        "pilihan_e": dataSoal[index]['pilihan_e'],
                        "jawaban_benar": dataSoal[index]
                        ['jawaban_benar'],
                        "id_tugas": dataSoal[index]['id_tugas'],
                        "idDetailTugas": dataSoal[index]
                        ['idDetailTugas'],
                        "type": SoalTugas.dataTugas['type']
                      };
                      Navigator.pushNamed(
                          context, JawabanSiswaDiGuru.routeName,
                          arguments: dataNya);
                    },
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
                      var urlFake = '${baseUrlTugas}${dataSoal[index]['file']}';
                      var urlReal = urlFake.replaceAll(" ", "%20");
                      _launched = _launchInBrowser(
                          urlReal);
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
        const SizedBox(height: 10)
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
    // print(url);
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _listMataPelajaran(
      String soal,
      files,
      jawabanA,
      jawabanB,
      jawabanC,
      jawabanD,
      jawabanE,
      jawabanBenar,
      GestureDetector ubah,
      GestureDetector periksa,
      GestureDetector file) {
    var gambar = files.substring(files.length - 3);
    if (SoalTugas.dataTugas['type'] != 'PG') {
      if (files != "null" &&
          gambar != 'png' &&
          gambar != 'peg' &&
          gambar != 'jpg') {
        return Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(soal,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: (const TextStyle(fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                    children: [file,const SizedBox(width: 5,), periksa],
                  )),
                  const SizedBox(height: 10),
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
                        children: [
                          // periksa
                        ],
                      )),
                      const Divider(color: Colors.black)
                    ],
                  )
                ],
              ),
            ))
          ],
        );
      } else {
        if (files != 'null') {
          print("harusnya gambar aja");
          return Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(soal,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: (const TextStyle(fontWeight: FontWeight.bold))),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          "$baseUrlTugas$files",
                          width: MediaQuery.of(context).size.width - 40,
                          height: 170,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
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
                        const Divider(color: Colors.black)
                      ],
                    )
                  ],
                ),
              ))
            ],
          );
        } else {
          print("harusnya gak ada gambar sama pdf dll");
          return Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(soal,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: (const TextStyle(fontWeight: FontWeight.bold))),
                    const SizedBox(height: 10),
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
                        const Divider(color: Colors.black)
                      ],
                    )
                  ],
                ),
              ))
            ],
          );
        }
      }
    } else {
      if (files != 'null') {
        print("harusnya gambar aja");
        return Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(soal,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: (const TextStyle(fontWeight: FontWeight.bold))),
                  
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        "$baseUrlTugas$files",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          // Appropriate logging or analytics, e.g.
                          // myAnalytics.recordError(
                          //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                          //   exception,
                          //   stackTrace,
                          // );
                          return Image.asset(
                            'assets/images/404-error.png',
                            width: MediaQuery.of(context).size.width - 40,
                            height: 170,
                          );
                        },
                        width: MediaQuery.of(context).size.width - 40,
                        height: 170,
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
                  const Text('Pilihan :',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: (TextStyle(fontWeight: FontWeight.bold))),
                  PilihanGanda(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'A. ',
                      text: jawabanA,
                      press: () {}),
                  PilihanGanda(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'B. ',
                      text: jawabanB,
                      press: () {}),
                  PilihanGanda(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'C. ',
                      text: jawabanC,
                      press: () {}),
                  PilihanGanda(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'D. ',
                      text: jawabanD,
                      press: () {}),
                  PilihanGanda(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'E. ',
                      text: jawabanE,
                      press: () {}),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.key,
                        color: kColorTealSlow,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(jawabanBenar,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: (const TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                      const Divider(color: Colors.black)
                    ],
                  )
                ],
              ),
            ))
          ],
        );
      } else {
        print("harusnya gak ada gambar sama pdf dll");
        return Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(soal,
                  //     maxLines: 3,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: (const TextStyle(fontWeight: FontWeight.bold))),
                  Html(data: soal),
                  const SizedBox(height: 10),
                  const Text('Pilihan :',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: (TextStyle(fontWeight: FontWeight.bold))),
                  PilihanGandaHtml(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'A. ',
                      text: jawabanA,
                      press: () {}),
                  PilihanGandaHtml(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'B. ',
                      text: jawabanB,
                      press: () {}),
                  PilihanGandaHtml(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'C. ',
                      text: jawabanC,
                      press: () {}),
                  PilihanGandaHtml(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'D. ',
                      text: jawabanD,
                      press: () {}),
                  PilihanGandaHtml(
                      color: const Color(0xFFF5F6F9),
                      textColor: Colors.grey,
                      pilihan: 'E. ',
                      text: jawabanE,
                      press: () {}),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.key,
                        color: kColorTealSlow,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(jawabanBenar,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: (const TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                      const Divider(color: Colors.black)
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
          "${getSoalbyIdDetailTugas}${SoalTugas.dataTugas['idDetailSoal']}",
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
