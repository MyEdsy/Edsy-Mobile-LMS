import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_no_jadwal.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../../home_guru.dart';

class KelasHariIni extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<KelasHariIni> {
  var isLoading = false;
  var responseJson, dataMapel;
  var code;
  late bool status;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);
  var totalKelas;
  var date = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData(nameDay(date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        :
      Column(
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
                    "",
                    style: mServiceSeeAll,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 5,
        ),
        status ? ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
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
                  return _dataKelas(
                      '${dataMapel[index]['JamMulai']}',
                      '${dataMapel[index]['Namamapel']}',
                      '${dataMapel[index]['Namakelas']}',
                      '${dataMapel[index]['Nama']}');
                }),
            SizedBox(height: 10)
          ],
        ) : SliderNoJadwal()

      ],
    );
  }

  _dataKelas(jam, mapel, ruang, guru) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            child: Column(
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
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          SizedBox(width: 5,),
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
                  Container(
                    width: 200,
                    child: Text(
                      guru,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<String> getData(hari) async {
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
          "${jadwalGuruHariIni}${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}/${data['username']}/$hari",
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
      if(mounted) {
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
