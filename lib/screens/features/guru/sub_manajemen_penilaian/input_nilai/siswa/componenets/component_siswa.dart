import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/edit_nilai_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/siswa_screen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import '../../../../../../../constants.dart';
import '../../../../../../../main.dart';
import '../../../../../../../size_config.dart';
import '../../../../home_guru.dart';
import '../input_nilai_screen.dart';

import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

class TableSiswa extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<TableSiswa> {
  var isLoading = false,
      isLoadingKomponen = false,
      isLoadingNilaiFinal = false,
      isLoadingDetailNilai = false;

  var responseJson,
      responseJsonDetailNilai,
      responseJsonKomponen,
      responseJsonNilaiFinal,
      // dataNilaiSiswa,
      dataDetailNilai,
      dataNilaiFinal,
      totalBobot = 0,
      selisih = 0,
      totalData = 0;

  List<Map<String, dynamic>> dataNilaiSiswa = [];
  List<Map<String, dynamic>> _foundUsers = [];

  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);

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
                          dataNilaiSiswa == null ? 0 : dataNilaiSiswa.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _dataNilaiSiswa(
                          dataNilaiSiswa[index]['nisn'],
                          dataNilaiSiswa[index]['nama_siswa'],
                          dataNilaiSiswa[index]['nilai'],
                          dataNilaiSiswa[index]['grade'],
                          dataNilaiSiswa[index]['Namamapel'],
                          dataNilaiSiswa[index]['kode_kelompok'],
                          dataNilaiSiswa[index]['keterangan'],
                          dataNilaiSiswa[index],
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
                      itemCount:
                          _foundUsers == null ? 0 : _foundUsers.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _dataNilaiSiswa(
                          _foundUsers[index]['nisn'],
                          _foundUsers[index]['nama_siswa'],
                          _foundUsers[index]['nilai'],
                          _foundUsers[index]['grade'],
                          _foundUsers[index]['Namamapel'],
                          _foundUsers[index]['kode_kelompok'],
                          _foundUsers[index]['keterangan'],
                          _foundUsers[index],
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

  _dataNilaiSiswa(
      nisn, namaSiswa, nilai, grade, namaMapel, kelas, keterangan, data) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 180,
          decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: mBorderColor, width: 1)),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   height: 214,
              //   width: 1,
              //   color: Colors.grey.withOpacity(0.5),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "$nisn - $namaSiswa",
                      overflow: TextOverflow.ellipsis,
                      style: mTitleStyle,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.book_outlined,
                                color: kColorBlue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 125,
                                  child: Text(
                                    namaMapel,
                                    overflow: TextOverflow.ellipsis,
                                    style: mServiceTitleStyle,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.account_balance_sharp,
                                color: Colors.teal,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  // width: MediaQuery.of(context).size.width - 160,
                                  child: Text(
                                kelas,
                                overflow: TextOverflow.ellipsis,
                                style: mServiceTitleStyle,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.add_chart,
                                color: Colors.purpleAccent,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 125,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Nilai Akhir : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: '$nilai',
                                          style: mServiceTitleStyleBold,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.grade,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Grade : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: grade,
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.description,
                                color: kPrimaryColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 125,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: '$keterangan',
                                          style: mServiceTitleStyle,
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => getDetailSiswa(data),
                                // onTap: () => Navigator.pushNamed(context, AbsenKelasScreen.routeName),
                                child: Chip(
                                  avatar: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  backgroundColor: kColorTealToSlow,
                                  label: Text("Detail",
                                      style: mTitleStyleColorWhite),
                                ),
                              ),
                            ],
                          ),
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

  Future<String> getDetailSiswa(datas) async {
    setState(() {
      isLoadingDetailNilai = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.post(detailNilaiSiswa,
          headers: headers,
          body: jsonEncode({
            'idkomponen': '${ListNilaiSiswa.dataMapel['idKomponen']}',
            'nip': '${ListNilaiSiswa.dataMapel['NIP']}',
            'nisn': '${datas['nisn']}',
            'kode_mapel': '${ListNilaiSiswa.dataMapel['idMapel']}',
            'idkelompokkls': '${ListNilaiSiswa.dataMapel['idkelompokkls']}',
            'tahunakademik': '${ListNilaiSiswa.dataMapel['Tahun']}',
            'semester': '${ListNilaiSiswa.dataMapel['semester']}',
          }));

      responseJsonDetailNilai = json.decode(response.body);

      setState(() {
        isLoadingDetailNilai = false;
        status = responseJsonDetailNilai['status'];
        code = responseJsonDetailNilai['code'];
        if (status == true && code == 200) {
          dataDetailNilai = responseJsonDetailNilai['result'];
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              builder: (context) {
                return ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.edit,
                        color: kPrimaryColor,
                      ),
                      title: Text('Detail Nilai ${datas['nama_siswa']}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        var dataYangDikirim = [], ket;
                        bool udahNilai;
                        if (dataDetailNilai.length > 0) {
                          dataYangDikirim = dataDetailNilai;
                          udahNilai = true;
                          ket = datas['keterangan'];
                        } else {
                          dataYangDikirim = datas['komDanNilai'];
                          udahNilai = false;
                        }
                        print(datas['komDanNilai']);
                        var newData = {
                          'idkomponen':
                              '${ListNilaiSiswa.dataMapel['idKomponen']}',
                          'nip': '${ListNilaiSiswa.dataMapel['NIP']}',
                          'nisn': '${datas['nisn']}',
                          'nama_siswa': '${datas['nama_siswa']}',
                          'kode_kelompok': '${datas['kode_kelompok']}',
                          'kode_mapel':
                              '${ListNilaiSiswa.dataMapel['idMapel']}',
                          'idkelompokkls':
                              '${ListNilaiSiswa.dataMapel['idkelompokkls']}',
                          'tahunakademik':
                              '${ListNilaiSiswa.dataMapel['Tahun']}',
                          'semester': '${ListNilaiSiswa.dataMapel['semester']}',
                          'namaKomponen':
                              '${ListNilaiSiswa.dataMapel['namaKomponen']}',
                          'totalDataKomponen': totalData,
                          'keterangan': ket,
                          'udahNilai': udahNilai,
                          'dataKomponen': dataYangDikirim,
                        };

                        Navigator.pushNamed(context, InputNilai.routeName,
                            arguments: newData);
                      },
                    ),
                    Divider(
                      color: kPrimaryColor,
                    ),
                    ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataDetailNilai == null
                            ? 0
                            : dataDetailNilai.length,
                        itemBuilder: (BuildContext context, int index2) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.wysiwyg),
                                title: Text(
                                    "${dataDetailNilai[index2]['sub_komponen']} ${dataDetailNilai[index2]['nilai_mentah']}"),
                                onTap: () {
                                  // _popPlayVideo(
                                  //     dataVideo[index2]['id'],
                                  //     dataVideo[index2]['judul_video'],
                                  //     dataVideo[index2]['link'],
                                  //     context);
                                },
                              ),
                            ],
                          );
                        })
                  ],
                );
              });
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
        isLoadingDetailNilai = false;
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
      final response = await http.post(nilaiSiswa,
          headers: headers,
          body: jsonEncode({
            'idkomponen': '${ListNilaiSiswa.dataMapel['idKomponen']}',
            'nip': '${ListNilaiSiswa.dataMapel['NIP']}',
            'kode_mapel': '${ListNilaiSiswa.dataMapel['idMapel']}',
            'idkelompokkls': '${ListNilaiSiswa.dataMapel['idkelompokkls']}',
            'tahunakademik': '${ListNilaiSiswa.dataMapel['Tahun']}',
            'semester': '${ListNilaiSiswa.dataMapel['semester']}',
          }));
      responseJson = json.decode(response.body);
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          // dataNilaiSiswa = responseJson['result'];
          dataNilaiSiswa = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
          getDataKomponen();
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

  Future<String> getDataKomponen() async {
    setState(() {
      isLoadingKomponen = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };
    try {
      final response = await http.get(
          "${komponenNilai}${ListNilaiSiswa.dataMapel['idKomponen']}/${ListNilaiSiswa.dataMapel['NIP']}/${ListNilaiSiswa.dataMapel['idMapel']}/${ListNilaiSiswa.dataMapel['idkelompokkls']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoadingKomponen = false;
        status = responseJson['status'];
        code = responseJson['code'];
        totalBobot = responseJson['totalBobot'];
        selisih = responseJson['selisih'];
        totalData = responseJson['totalData'];
        if (status == true && code == 200) {
          responseJsonKomponen = responseJson['result'];
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
        isLoadingKomponen = false;
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
            hintText: "Cari Siswa...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = dataNilaiSiswa;
    } else {
      results = dataNilaiSiswa
          .where((nama_siswa) => nama_siswa["nama_siswa"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
}
