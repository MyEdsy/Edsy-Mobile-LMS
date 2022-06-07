import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/response/responseAbsen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../constants.dart';
import '../../../../../main.dart';

import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

import '../../../../../size_config.dart';
import '../../home_guru.dart';
import '../absensi_kelas_screens.dart';

class AbsnseiKelasComponent extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<AbsnseiKelasComponent> {
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataSiswaAbsen = [];
  List<Map<String, dynamic>> _foundUsers = [];
  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  var statusAbsen;

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
            padding: const EdgeInsets.all(1.0),
            child: Shimmer.fromColors(
              baseColor: mGreyColor,
              highlightColor: mGreyColor,
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, __) => (dummyListViewCell()),
                itemCount: 10,
              ),
            ),
          )
        : _foundUsers.isEmpty
            ? ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _search(),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          dataSiswaAbsen == null ? 0 : dataSiswaAbsen.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _listSiswaAbsen(
                          dataSiswaAbsen[index]['nama_siswa'],
                          dataSiswaAbsen[index]['statusAbsen'] ?? '-',
                          index,
                          dataSiswaAbsen[index]['keteranganAbsen'] ??
                              'Belum dipanggil',
                        );
                      }),
                  SizedBox(height: 10)
                ],
              )
            : ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _search(),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _foundUsers == null ? 0 : _foundUsers.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _listSiswaAbsen(
                          _foundUsers[index]['nama_siswa'],
                          _foundUsers[index]['statusAbsen'] ?? '-',
                          index,
                          _foundUsers[index]['keteranganAbsen'] ??
                              'Belum dipanggil',
                        );
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

  _listSiswaAbsen(nama, status, index, keterangan) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.all(10),
      height: 135,
      decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.user,
                size: 35,
                color: mSubtitleColor,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Status :", style: mServiceTitleStyle),
              Text(status ?? '-', style: mServiceTitleStyleBold),
            ],
          ),
          Container(
            height: 155,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 140,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(text: nama, style: mTitleStyle, children: [
                    TextSpan(
                      text: " - ${keterangan}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ]),
                ),
              ),
              Row(
                children: [
                  Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['statusAbsen'] = 'Hadir'
                                : _foundUsers[index]['statusAbsen'] = 'Hadir';

                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['keteranganAbsen'] =
                                    'Sudah dipanggil'
                                : _foundUsers[index]['keteranganAbsen'] =
                                    'Sudah dipanggil';

                            var absenHadir = {
                              "nis": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "nisn": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "idsetjadwal": _foundUsers.isEmpty
                                  ? '${dataSiswaAbsen[index]['idsetjadwal']}'
                                  : '${_foundUsers[index]['idsetjadwal']}',
                              "status": 'Hadir',
                              "angka": '1',
                              "id_tahun": '${dataTahunAjaran['idsettingtahun']}'
                            };
                            // print(absenHadir);
                            PresensiResponse.inputPresensiSiswa(
                                absenHadir, context);
                          });
                        },
                        child: Chip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          avatar: Icon(
                            Icons.file_present,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: kColorTealSlow,
                          label: Text("Hadir", style: mTitleStyleColorWhite),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['statusAbsen'] = 'Sakit'
                                : _foundUsers[index]['statusAbsen'] = 'Sakit';

                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['keteranganAbsen'] =
                            'Sudah dipanggil'
                                : _foundUsers[index]['keteranganAbsen'] =
                            'Sudah dipanggil';

                            var absenSakit = {
                              "nis": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "nisn": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "idsetjadwal": _foundUsers.isEmpty
                                  ? '${dataSiswaAbsen[index]['idsetjadwal']}'
                                  : '${_foundUsers[index]['idsetjadwal']}',
                              "status": 'Sakit',
                              "angka": '0',
                              "id_tahun": '${dataTahunAjaran['idsettingtahun']}'
                            };
                            // print(absenHadir);
                            PresensiResponse.inputPresensiSiswa(
                                absenSakit, context);
                          });
                        },
                        child: Chip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          avatar: Icon(
                            Icons.sick,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: kColorBlue,
                          label: Text("Sakit", style: mTitleStyleColorWhite),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['statusAbsen'] = 'Izin'
                                : _foundUsers[index]['statusAbsen'] = 'Izin';

                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['keteranganAbsen'] =
                            'Sudah dipanggil'
                                : _foundUsers[index]['keteranganAbsen'] =
                            'Sudah dipanggil';

                            var absenIzin = {
                              "nis": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "nisn": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "idsetjadwal": _foundUsers.isEmpty
                                  ? '${dataSiswaAbsen[index]['idsetjadwal']}'
                                  : '${_foundUsers[index]['idsetjadwal']}',
                              "status": 'Izin',
                              "angka": '0',
                              "id_tahun": '${dataTahunAjaran['idsettingtahun']}'
                            };
                            // print(absenHadir);
                            PresensiResponse.inputPresensiSiswa(
                                absenIzin, context);
                          });
                        },
                        child: Chip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          avatar: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: kColorYellow,
                          label: Text("Izin", style: mTitleStyleColorWhite),
                        ),
                      )
                    ],
                  )),
                ],
              ),
              Row(
                children: [
                  Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['statusAbsen'] = 'Alpha'
                                : _foundUsers[index]['statusAbsen'] = 'Alpha';

                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['keteranganAbsen'] =
                            'Sudah dipanggil'
                                : _foundUsers[index]['keteranganAbsen'] =
                            'Sudah dipanggil';

                            var absenAlpha = {
                              "nis": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "nisn": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "idsetjadwal": _foundUsers.isEmpty
                                  ? '${dataSiswaAbsen[index]['idsetjadwal']}'
                                  : '${_foundUsers[index]['idsetjadwal']}',
                              "status": 'Alpha',
                              "angka": '0',
                              "id_tahun": '${dataTahunAjaran['idsettingtahun']}'
                            };
                            // print(absenHadir);
                            PresensiResponse.inputPresensiSiswa(
                                absenAlpha, context);
                          });
                        },
                        child: Chip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          avatar: Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: kColorRedSlow,
                          label: Text("Alpha", style: mTitleStyleColorWhite),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['statusAbsen'] = 'Dispensasi'
                                : _foundUsers[index]['statusAbsen'] = 'Dispensasi';

                            _foundUsers.isEmpty
                                ? dataSiswaAbsen[index]['keteranganAbsen'] =
                            'Sudah dipanggil'
                                : _foundUsers[index]['keteranganAbsen'] =
                            'Sudah dipanggil';

                            var absenDispen = {
                              "nis": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "nisn": _foundUsers.isEmpty
                                  ? dataSiswaAbsen[index]['nis']
                                  : _foundUsers[index]['nis'],
                              "idsetjadwal": _foundUsers.isEmpty
                                  ? '${dataSiswaAbsen[index]['idsetjadwal']}'
                                  : '${_foundUsers[index]['idsetjadwal']}',
                              "status": 'Dispensasi',
                              "angka": '0',
                              "id_tahun": '${dataTahunAjaran['idsettingtahun']}'
                            };
                            // print(absenHadir);
                            PresensiResponse.inputPresensiSiswa(
                                absenDispen, context);
                          });
                        },
                        child: Chip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          avatar: Icon(
                            Icons.restore,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: kPrimaryColor,
                          label: Text("Dispen", style: mTitleStyleColorWhite),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              // Text("Hadir", style: mTitleStyleColorTeal)
            ],
          ),
        ],
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
          "${jadwalSiswaByNipGuru}${AbsenKelasScreen.dataMapel['idMapel']}/${AbsenKelasScreen.dataMapel['NamaKelompokKelas']}/${AbsenKelasScreen.dataMapel['nip']}/${AbsenKelasScreen.dataMapel['Tahun']}/${AbsenKelasScreen.dataMapel['Semester']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          // dataSiswaAbsen = responseJson['result'];
          dataSiswaAbsen = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
          // print(dataSiswaAbsen);
        } else if (status == false && code == 403) {
          // totalKelas = responseJson['total'];
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
                        context, HomeGuru.routeName, (r) => false);
                  },
                  btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }

    return 'success';
  }

  _search() {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: SizeConfig.screenWidth * 0.8,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => {_runFilter(value)},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Cari Mata Pelajaran...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = dataSiswaAbsen;
    } else {
      results = dataSiswaAbsen
          .where((siswa) => siswa["nama_siswa"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
      print(_foundUsers);
    });
  }
}
