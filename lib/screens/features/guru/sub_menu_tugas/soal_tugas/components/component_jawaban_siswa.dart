import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/response/soalResponse.dart';
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

class komponentJawaban extends StatefulWidget {
  @override
  _komponentJawaban createState() => _komponentJawaban();
}

class _komponentJawaban extends State<komponentJawaban> {
  var isLoading = false;
  var responseJson, dataJawaban;
  var status, code;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);
  Future<void>? _launched;
  late List<TextEditingController> nilaiSiswa;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    nilaiSiswa = List.generate(dataJawaban == null ? 0 : dataJawaban.length,
        (i) => TextEditingController());
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
                  itemCount: dataJawaban == null ? 0 : dataJawaban.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    // print(dataSoal[index]);
                    nilaiSiswa.add(new TextEditingController());
                    int no = index + 1;
                    return _listMataPelajaran(
                        '$no. ${dataJawaban[index]['nisn']}',
                        '${dataJawaban[index]['nama_siswa']}',
                        '${dataJawaban[index]['jawaban']}',
                        '${dataJawaban[index]['nilai_per_soal']}',
                        index,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            var urlFake = '${baseUrlJawaban}${dataJawaban[index]['jawaban_file']}';
                            var urlReal = urlFake.replaceAll(" ", "%20");
                            _launched = _launchInBrowser(
                                urlReal);
                          });
                        },
                        child: const Chip(
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          avatar: Icon(
                            FontAwesomeIcons.eye,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: kColorBlue,
                          label: Text(
                            "Lihat Jawaban",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, UpdateSoalEssay.routeName,
                            //     arguments: {
                            //       "idTugas": dataJawaban[index]['id_tugas'],
                            //       "idDetailSoal": dataJawaban[index]
                            //           ['idDetailTugas'],
                            //       "idSoal": dataJawaban[index]['id'],
                            //       "soal": dataJawaban[index]['soal'],
                            //       "file": dataJawaban[index]['file']
                            //     });
                            setState(() {
                              dataJawaban[index]['nilai_per_soal'] =
                                  nilaiSiswa[index].text;
                              var kirimData = {
                                "nisn": dataJawaban[index]['nisn'],
                                "nilai_per_soal": dataJawaban[index]
                                    ['nilai_per_soal'],
                                "id_soal": dataJawaban[index]['id'],
                              };
                              SoalResponse.inputNilaisPersiswa(
                                  kirimData, context);
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
                              "Kirim Nilai",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                    );
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
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _listMataPelajaran(
      nisn, nama, jawaban, nilaiPerSiswa, index, GestureDetector jawabanFile, GestureDetector nilai) {

    if (JawabanSiswaDiGuru.dataSoal['type'] == "Essay") {
      return Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$nisn - $nama',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                const SizedBox(height: 10),
                const Text('Jawaban : ',
                    // maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: (TextStyle(fontWeight: FontWeight.bold))),
                Text(jawaban,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: (const TextStyle(fontWeight: FontWeight.normal))),
                const SizedBox(height: 10),
                const Text('Nilai : ',
                    // maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: (TextStyle(fontWeight: FontWeight.bold))),
                Text('$nilaiPerSiswa',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: (const TextStyle(fontWeight: FontWeight.normal))),
                const SizedBox(height: 10),
                Container(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: nilaiSiswa[index],
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    maxLines: null,
                    // onChanged: ,: () {
                    //   setState(() {
                    //     dataJawaban[index]['nilai_per_soal'] = nilaiSiswa[index].text;
                    //   });
                    // },
                    onChanged: (data) {
                      setState(() {
                        dataJawaban[index]['nilai_per_soal'] = data;
                        var kirimData = {
                          "nisn": dataJawaban[index]['nisn'],
                          "nilai_per_soal": dataJawaban[index]
                              ['nilai_per_soal'],
                          "id_soal": dataJawaban[index]['id'],
                        };
                        SoalResponse.inputNilaisPersiswa(kirimData, context);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Nilai Siswa*",
                      hintText: "Masukan nilai $nama",
                      prefixIcon: const Icon(FontAwesomeIcons.firstOrder),
                      // If  you are using latest version orf flutter then lable text and hint text shown like this
                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Row(
                //   children: [
                //     Container(
                //         // width: MediaQuery.of(context).size.width - 160,
                //         child: Row(
                //       children: [nilai],
                //     )),
                //     const SizedBox(
                //       width: 4,
                //     ),
                //   ],
                // )
              ],
            ),
          ))
        ],
      );
    } else if (JawabanSiswaDiGuru.dataSoal['type'] == "PG") {
      return Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$nisn - $nama',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                const SizedBox(height: 10),
                const Text('Jawaban : ',
                    // maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: (const TextStyle(fontWeight: FontWeight.bold))),
                Text(jawaban,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: (const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(height: 10),
                const Text('Nilai : ',
                    // maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: (TextStyle(fontWeight: FontWeight.bold))),
                Text('$nilaiPerSiswa',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: (const TextStyle(fontWeight: FontWeight.normal))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                        // width: MediaQuery.of(context).size.width - 160,
                        child: Row(
                            // children: [nilai],
                            )),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$nisn - $nama',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                        (const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                    const SizedBox(height: 10),
                    const Text('Jawaban : ',
                        // maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: (TextStyle(fontWeight: FontWeight.bold))),
                    // Text(jawabanFile,
                    //     maxLines: 10,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: (TextStyle(fontWeight: FontWeight.normal))),
                    jawabanFile,
                    const SizedBox(height: 10),
                    const Text('Nilai : ',
                        // maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: (TextStyle(fontWeight: FontWeight.bold))),
                    Text('$nilaiPerSiswa',
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: (const TextStyle(fontWeight: FontWeight.normal))),
                    const SizedBox(height: 10),
                    Container(
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: nilaiSiswa[index],
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        maxLines: null,
                        // onChanged: ,: () {
                        //   setState(() {
                        //     dataJawaban[index]['nilai_per_soal'] = nilaiSiswa[index].text;
                        //   });
                        // },
                        onChanged: (data) {
                          setState(() {
                            dataJawaban[index]['nilai_per_soal'] = data;
                            var kirimData = {
                              "nisn": dataJawaban[index]['nisn'],
                              "nilai_per_soal": dataJawaban[index]
                              ['nilai_per_soal'],
                              "id_soal": dataJawaban[index]['id'],
                            };
                            SoalResponse.inputNilaisPersiswa(kirimData, context);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Nilai Siswa*",
                          hintText: "Masukan nilai $nama",
                          prefixIcon: const Icon(FontAwesomeIcons.firstOrder),
                          // If  you are using latest version orf flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     Container(
                    //         // width: MediaQuery.of(context).size.width - 160,
                    //         child: Row(
                    //       children: [nilai],
                    //     )),
                    //     const SizedBox(
                    //       width: 4,
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ))
        ],
      );
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
          "${jawabanByIdSoal}${JawabanSiswaDiGuru.dataSoal['id']}",
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
          dataJawaban = responseJson['result'];
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
