import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/model/master_komponen_penilaian.dart';
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/detail_nilai_screen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../constants.dart';
import '../../../../../main.dart';
import '../../../../../size_config.dart';

class ComponentMataPelajaran extends StatefulWidget {
  const ComponentMataPelajaran({Key? key}) : super(key: key);

  @override
  _ComponentMataPelajaran createState() => _ComponentMataPelajaran();
}

class _ComponentMataPelajaran extends State<ComponentMataPelajaran> {
  var isLoading = false;
  var responseJson;
  var status, code;
  var idKomponen, namaKomponen;

  List<Map<String, dynamic>> dataMapel = [];
  List<Map<String, dynamic>> _foundUsers = [];

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
        : _foundUsers.isEmpty
            ? ListView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _search(),
                  const SizedBox(height: 20,),
                  ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: dataMapel == null ? 0 : dataMapel.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
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
                        // BeforeInputKategoriNilai.dataMapelPerIndex =
                        // dataMapel[index];
                        print(dataMapel[index]['Gelarbelakang']);
                        return _listMataPelajaran(
                          dataMapel[index]['Namamapel'],
                          '${dataMapel[index]['KelompokKelas']} ${dataMapel[index]['Jurusan']} ${dataMapel[index]['NamaKelompokKelas']}',
                          '${gelarDpn}${dataMapel[index]['Nama']} ${dataMapel[index]['Gelarbelakang'] == null ? '' : dataMapel[index]['Gelarbelakang']}',
                          GestureDetector(
                            onTap: () {
                              _popUp(dataMapel[index]);
                            },
                            child: const Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                FontAwesomeIcons.file,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: kColorBlue,
                              label: Text(
                                "Lihat Nilai",
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
              )
            : ListView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _search(),
                  const SizedBox(height: 20,),
                  ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _foundUsers == null ? 0 : _foundUsers.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
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
                        // BeforeInputKategoriNilai.dataMapelPerIndex =
                        // dataMapel[index];
                        print(_foundUsers[index]['Gelarbelakang']);
                        return _listMataPelajaran(
                          _foundUsers[index]['Namamapel'],
                          '${_foundUsers[index]['KelompokKelas']} ${_foundUsers[index]['Jurusan']} ${_foundUsers[index]['NamaKelompokKelas']}',
                          '${gelarDpn}${_foundUsers[index]['Nama']} ${_foundUsers[index]['Gelarbelakang'] == null ? '' : _foundUsers[index]['Gelarbelakang']}',
                          GestureDetector(
                            onTap: () {
                              _popUp(_foundUsers[index]);
                            },
                            child: const Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              avatar: Icon(
                                FontAwesomeIcons.file,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: kColorBlue,
                              label: Text(
                                "Lihat Nilai",
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

  _listMataPelajaran(
      String mapel,
      String kelas,
      String guru,
      // GestureDetector pengetahuan, GestureDetector keterampilan
      GestureDetector tambahKomponen) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(15),
      height: 120,
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
                padding: const EdgeInsets.all(1.0),
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  mapel,
                  overflow: TextOverflow.ellipsis,
                  style: (TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 5,
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
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                    children: [tambahKomponen],
                  )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _popUp(index) {
    // set up the buttons
    Widget OK = GestureDetector(
        onTap: () async {
          // print(index);
          var newData = {
            "idKomponen": idKomponen,
            "namaKomponen": namaKomponen,
            "Tahun": index['tahunakademik'],
            "NIP": index['Nip'],
            "semester": index['semester'],
            "Namamapel": index['Namamapel'],
            "Semester": index['semester'],
            'idkelompokkls': index['idkelompokkls'],
            'idMapel': index['idMapel'],
          };
          //
          Navigator.pushNamed(context, WaliMuridDetailNilaiSiswaScrenn.routeName,
              arguments: newData);
        },
        child: const Chip(
          avatar: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: kColorTealSlow,
          label: Text("OK",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));

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

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Pilih Komponen",
        style: mTitleStyle16,
      ),
      content: Container(
        padding: const EdgeInsets.all(1.0),
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            dropDownListKomponeneNilai(),
          ],
        ),
      ),
      actions: [OK, cancelButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget dropDownListKomponeneNilai() {
    var data = DropdownSearch<MasterKomponenNilai>(
      mode: Mode.BOTTOM_SHEET,
      label: 'Komponen Nilai *',
      showSearchBox: true,
      hint: "Cari Komponen...",
      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
        prefixIcon: Icon(Icons.compare_arrows_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      // maxHeight: 300,
      onFind: (String filter) async => await getKomponen(),
      itemAsString: (MasterKomponenNilai u) => u.nama_komponen,
      onChanged: (MasterKomponenNilai data) => {
        idKomponen = '${data.idkompnilai}',
        namaKomponen = data.nama_komponen
      },
    );
    return data;
  }

  Future<List<MasterKomponenNilai>?> getKomponen() async {
    Dio dio = new Dio();
    dio.options.headers["x-access-token"] = data['access_token'];
    dio.options.headers["username"] = data['username'];
    var response = await dio.get(
      '${masterKomponen}',
    );
    var models = MasterKomponenNilai.fromJsonList(response.data);
    return models;
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
          "${jadwalSiswaByNisn}${data['nisn']}/${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}",
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
          // dataMapel = responseJson['result'];
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
                        context, HomeWaliMurid.routeName, (r) => false);
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
                        context, Onboarding.routerName, (r) => false);
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
                      context, HomeWaliMurid.routeName, (r) => false);
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
      margin: const EdgeInsets.only(left: 16, right: 16),
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
            prefixIcon: const Icon(Icons.search)),
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
