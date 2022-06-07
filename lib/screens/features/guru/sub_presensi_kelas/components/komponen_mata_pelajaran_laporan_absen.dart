import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/screens/features/guru/home_guru.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

import '../../../../../size_config.dart';
import '../laporan_absen_kelas_screen.dart';

class MataPelajaranLaporanAbsen extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<MataPelajaranLaporanAbsen> {
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataMapel = [];
  List<Map<String, dynamic>> _foundUsers = [];
  var status, code;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

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
                      itemCount: dataMapel == null ? 0 : dataMapel.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var gelarDpn;
                        if (dataMapel[index]['Gelardepan'] == null) {
                          gelarDpn = '';
                        } else {
                          gelarDpn = dataMapel[index]['Gelardepan'] + ' ';
                        }

                        return _listMataPelajaran(
                          dataMapel[index]['Namamapel'],
                          '${dataMapel[index]['KelompokKelas']} ${dataMapel[index]['Jurusan']} ${dataMapel[index]['NamaKelompokKelas']}',
                          '${gelarDpn}${dataMapel[index]['Nama']} ${dataMapel[index]['Gelarbelakang'] ?? ''}',
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LaporanAbsenKelasScreen.routeName,
                                  arguments: dataMapel[index]);
                              print(dataMapel[index]);
                            },
                            child: const Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                FontAwesomeIcons.clipboard,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: kColorTealSlow,
                              label: Text(
                                "Lihat Absen Siswa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                        var gelarDpn;
                        if (_foundUsers[index]['Gelardepan'] == null) {
                          gelarDpn = '';
                        } else {
                          gelarDpn = _foundUsers[index]['Gelardepan'] + ' ';
                        }

                        return _listMataPelajaran(
                          _foundUsers[index]['Namamapel'],
                          '${_foundUsers[index]['KelompokKelas']} ${_foundUsers[index]['Jurusan']} ${_foundUsers[index]['NamaKelompokKelas']}',
                          '${gelarDpn}${_foundUsers[index]['Nama']} ${_foundUsers[index]['Gelarbelakang'] ?? ''}',
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LaporanAbsenKelasScreen.routeName,
                                  arguments: _foundUsers[index]);
                              print(_foundUsers[index]);
                            },
                            child: const Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                FontAwesomeIcons.clipboard,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: kColorTealSlow,
                              label: Text(
                                "Lihat Absen Siswa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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

  _listMataPelajaran(
      String mapel, String kelas, String guru, GestureDetector pengetahuan) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.all(15),
      height: 150,
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
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  mapel,
                  overflow: TextOverflow.ellipsis,
                  style: (TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                      kelas,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    guru,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                    children: [pengetahuan],
                  )),
                ],
              )
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
          "${matapelajaranGuruRekapAbsen}${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}/${data['username']}",
          headers: headers);
      responseJson = json.decode(response.body);
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataMapel = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
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
      results = dataMapel;
    } else {
      results = dataMapel
          .where((mapel) => mapel["Namamapel"]
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
