import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/componenets/component_siswa.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/response/responseNilai.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../main.dart';
import '../../../../../../../size_config.dart';
import '../../../../home_guru.dart';
import '../input_nilai_screen.dart';

class InputNilaiForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<InputNilaiForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  var isLoading = false;
  var responseJson, dataNilaiFinal, status, code;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  List<dynamic> kirimData = [];

  late List<TextEditingController> nilaiSiswaText;
  TextEditingController keteranganText = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(InputNilai.dataDetailNilaiSiswa['totalDataKomponen']);
    // print(InputNilai.dataDetailNilaiSiswa['dataKomponen']);
    keteranganText.text = InputNilai.dataDetailNilaiSiswa['keterangan'];
    nilaiSiswaText = List.generate(
        InputNilai.dataDetailNilaiSiswa['totalDataKomponen'],
        (i) => TextEditingController());
    // _getDataNilai();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Siswa",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Chip(
                  backgroundColor: kColorTealToSlow,
                  label: Text(
                      "${InputNilai.dataDetailNilaiSiswa['nama_siswa']}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jurusan",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Chip(
                  backgroundColor: kColorBlue,
                  label: Text(
                      "${InputNilai.dataDetailNilaiSiswa['kode_kelompok']}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          _getTextWidgets(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildKeterangan(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                int length =
                    InputNilai.dataDetailNilaiSiswa['totalDataKomponen'];
                var idKomponen;
                for (var i = 0; i < length; i++) {
                  if (InputNilai.dataDetailNilaiSiswa['udahNilai'] == true) {
                    idKomponen =
                        '${InputNilai.dataDetailNilaiSiswa['dataKomponen'][i]['id_komponen_nilai']}';
                  } else {
                    idKomponen =
                        '${InputNilai.dataDetailNilaiSiswa['dataKomponen'][i]['id']}';
                  }
                  kirimData.add({
                    'nisn': '${InputNilai.dataDetailNilaiSiswa['nisn']}',
                    'nip': '${InputNilai.dataDetailNilaiSiswa['nip']}',
                    'id_komp_penilaian':
                        '${InputNilai.dataDetailNilaiSiswa['idkomponen']}',
                    'id_komponen_nilai': '${idKomponen}',
                    'idMapel':
                        '${InputNilai.dataDetailNilaiSiswa['kode_mapel']}',
                    'id_kelompok_kelas':
                        '${InputNilai.dataDetailNilaiSiswa['idkelompokkls']}',
                    'tahun':
                        '${InputNilai.dataDetailNilaiSiswa['tahunakademik']}',
                    'semester':
                        '${InputNilai.dataDetailNilaiSiswa['semester']}',
                    'id_user_input': '${data['id']}',
                    'nilai_mentah': '${nilaiSiswaText[i].text}',
                    'keterangan': keteranganText.text
                  });
                }
                print(kirimData);
                Nilairesponse.inputNilai(kirimData, context);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  _getTextWidgets() {
    List<Widget> list = <Widget>[];
    for (var i = 0;
        i < InputNilai.dataDetailNilaiSiswa['totalDataKomponen'];
        i++) {
      list.add(SizedBox(height: 10));
      list.add(buildTugas1FormField(i));
      list.add(SizedBox(height: 10));
    }
    return Column(children: list);
  }

  TextFormField buildTugas1FormField(index) {
    nilaiSiswaText[index].text = InputNilai.dataDetailNilaiSiswa['dataKomponen']
    [index]['nilai_mentah'] ??
         '${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['nilai']}';
    var text, text2;
    if (InputNilai.dataDetailNilaiSiswa['udahNilai'] == true) {
      text =
          "${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['sub_komponen']} ${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['bobot']} %";
      text2 =
          "Nilai ${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['sub_komponen']}";
    } else {
      text =
          "${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['nama_komponen']} ${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['bobot']} %";
      text2 =
          "Nilai ${InputNilai.dataDetailNilaiSiswa['dataKomponen'][index]['nama_komponen']}";
    }
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: nilaiSiswaText[index],
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kKategoryNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kKategoryNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: text,
        hintText: text2,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildKeterangan() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: keteranganText,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kKategoryNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kKategoryNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Keterangan",
        hintText: "Masukan keterangan",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
