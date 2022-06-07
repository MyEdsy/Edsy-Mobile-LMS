import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../constants.dart';
import '../../../../../main.dart';
import '../../../../../size_config.dart';
import '../../home_guru.dart';
import '../detail_absen_siswa_diguru_screen.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/server/api.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/response/responseAbsen.dart';

import '../laporan_absen_kelas_screen.dart';

class LaporanAbsenSiswa extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<LaporanAbsenSiswa> {
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataRekapAbsenSiswa = [];
  List<Map<String, dynamic>> _foundUsers = [];
  var code;
  late bool status;

  var dataUser = jsonDecode(dataUserLogin);
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
                      itemCount: dataRekapAbsenSiswa == null
                          ? 0
                          : dataRekapAbsenSiswa.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _listRekapAbsenSiswa(
                            dataRekapAbsenSiswa[index]['nisn'],
                            dataRekapAbsenSiswa[index]['nama_siswa'],
                            dataRekapAbsenSiswa[index]['hadir'],
                            dataRekapAbsenSiswa[index]['sakit'],
                            dataRekapAbsenSiswa[index]['izin'],
                            dataRekapAbsenSiswa[index]['alpha'],
                            dataRekapAbsenSiswa[index]['dispensasi']);
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
                        return _listRekapAbsenSiswa(
                            _foundUsers[index]['nisn'],
                            _foundUsers[index]['nama_siswa'],
                            _foundUsers[index]['hadir'],
                            _foundUsers[index]['sakit'],
                            _foundUsers[index]['izin'],
                            _foundUsers[index]['alpha'],
                            _foundUsers[index]['dispensasi']);
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

  _listRekapAbsenSiswa(nisn, nama, hadir, sakit, izin, alpha, dispen) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 129,
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
                      "${nisn} - ${nama}",
                      overflow: TextOverflow.ellipsis,
                      style: mTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      // Image.network(
                      //   "https://st2.depositphotos.com/47577860/46284/v/450/depositphotos_462842714-stock-illustration-account-avatar-businessman-icon-in.jpg",
                      //   height: 60,
                      //   width: 60,
                      //   fit: BoxFit.cover,
                      // ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.present_to_all,
                                color: kColorTealSlow,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 60,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Hadir : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: hadir,
                                          style: mServiceTitleStyleBold,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.sick_rounded,
                                color: kColorBlue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Sakit : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: sakit,
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              ),
                              Icon(
                                Icons.pending_actions,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Izin : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: izin,
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.dangerous,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 60,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Alpha : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: alpha,
                                          style: mServiceTitleStyleBold,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.restore,
                                color: Colors.deepPurpleAccent,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Dispen : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: dispen,
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          //DetailAbsenSiswaPerTanggalDiGuru
                          SizedBox(
                            height: 3,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context,
                                DetailAbsenSiswaPerTanggalDiGuru.routeName,
                                arguments: {"nisn": nisn}),
                            child: const Chip(
                              avatar: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              backgroundColor: kColorBlue,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              label: Text("Detail",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
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
          "${rekapAbsensiswaByIdSetJadwal}/${LaporanAbsenKelasScreen.dataMapelFromRoutes['idsetjadwal']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataRekapAbsenSiswa = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
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
            hintText: "Cari Nama Siswa...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = dataRekapAbsenSiswa;
    } else {
      results = dataRekapAbsenSiswa
          .where((nmSiswa) => nmSiswa["nama_siswa"]
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
