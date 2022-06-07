import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/components/slider_no_jadwal.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/response/responseAbsen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../../home_guru.dart';
import '../absensi_kelas_screens.dart';

class MataPelajaranAbsen extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<MataPelajaranAbsen> {
  var isLoading = false;
  var responseJson, dataMapel;
  var code;
  late bool status;

  var dataUser = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);
  var totalKelas;

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  final List<String?> errors = [];
  String type = '';
  TextEditingController beritaAcaraText = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

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
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 10, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Kelas Hari Ini",
                            style: mTitleStyle,
                            children: [
                              TextSpan(
                                text: ' (${totalKelas})',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Text(
                          "Absen Hari Ini",
                          style: mServiceSeeAll,
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 5,
              ),
              status
                  ? ListView(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ListView.separated(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: dataMapel == null ? 0 : dataMapel.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
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
                              return _dataKelas(
                                  '${dataMapel[index]['JamMulai']}/\n${dataMapel[index]['JamSelesai']}',
                                  '${dataMapel[index]['Namamapel']}',
                                  '${dataMapel[index]['KelompokKelas']} ${dataMapel[index]['Jurusan']} ${dataMapel[index]['NamaKelompokKelas']}',
                                  '${gelarDpn}${dataMapel[index]['Nama']} ${dataMapel[index]['Gelarbelakang'] ?? ''}',
                                  dataMapel[index]);
                            }),
                        SizedBox(height: 10)
                      ],
                    )
                  : SliderNoJadwal()
            ],
          );
  }

  _dataKelas(jam, mapel, ruang, guru, data) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.all(10),
      height: 145,
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
              Text(
                "JAM",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                jam,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
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
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      ruang,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    guru,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              _buttonAbsenGuru(data)
            ],
          )
        ],
      ),
    );
  }

  _buttonAbsenGuru(index) {
    if (index['sudahAbsen']) {
      return GestureDetector(
        onTap: () {
          var dataAbsenGuru = {
            'idMapel': index['idMapel'],
            'NamaKelompokKelas': index['NamaKelompokKelas'],
            'nip': index['NIP'],
            'Tahun': index['Tahun'],
            'Semester': index['Semester'],
            'id_setting_jadwal': index['idsetjadwal'],
            'berita_acara': beritaAcaraText.text,
            'id_input': dataUser['id'],
            'status': 'Hadir'
          };
          Navigator.pushNamed(context, AbsenKelasScreen.routeName,
              arguments: dataAbsenGuru);
          // _popUp(dataMapel[index], context);
        },
        child: const Chip(
          avatar: Icon(
            Icons.file_present,
            color: Colors.white,
            size: 20,
          ),
          backgroundColor: kColorTeal,
          label: Text(
            "Edit Absen",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          _popUp(index, context);
        },
        child: const Chip(
          avatar: Icon(
            Icons.file_present,
            color: Colors.white,
            size: 20,
          ),
          backgroundColor: kColorTeal,
          label: Text(
            "Input Absen",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }
  }

  _popUp(index, BuildContext context) {
    // set up the buttons
    Widget OK = GestureDetector(
        onTap: () async {
          var newData = {
            'idMapel': index['idMapel'],
            'NamaKelompokKelas': index['NamaKelompokKelas'],
            'nip': index['NIP'],
            'Tahun': index['Tahun'],
            'Semester': index['Semester'],
            'id_setting_jadwal': index['idsetjadwal'],
            'berita_acara': beritaAcaraText.text,
            'id_input': dataUser['id'],
            'status': 'Hadir',
            "id_tahun": '${dataTahunAjaran['idsettingtahun']}'
          };
          print(newData);
          PresensiResponse.inputPresensiGuru(newData, context);
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
        "Berita Acara",
        style: mTitleStyle16,
      ),
      content: Container(
        height: 105,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            _buildJumlahTugas()
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

  _buildJumlahTugas() {
    return TextFormField(
      controller: beritaAcaraText,
      keyboardType: TextInputType.multiline,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kJudulBahanyNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kJudulBahanyNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Berita Acara ",
        hintText: "Berita acara mengajar",
        prefixIcon: Icon(Icons.task),
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
      'x-access-token': dataUser['access_token'],
      'username': dataUser['username']
    };
    print("${dataUser['username']}");
    try {
      final response = await http.get(
          "${jadwalGuruAbsen}${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}/${dataUser['username']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataMapel = responseJson['result'];
          totalKelas = responseJson['total'];
        } else if (status == false && code == 403) {
          totalKelas = responseJson['total'];
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
          totalKelas = 0;
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
}
