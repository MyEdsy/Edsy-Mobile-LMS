import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/model/komponen_nilai_model.dart';
import 'package:school_apps/model/master_komponen_penilaian.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/input_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/response/ujian_response.dart';
import 'package:school_apps/server/api.dart';
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import '../../../../../../size_config.dart';

class FormInputUjian extends StatefulWidget {
  @override
  _FormInputUjian createState() => _FormInputUjian();
}

class _FormInputUjian extends State<FormInputUjian> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];
  var data = jsonDecode(dataUserLogin);

  String _konten = "pengetahuan";
  String namaKomponen = '', idKomponen = '', namaMaterKomponen = '', idMasterKomponen = '';
  String? type;

  List<String> _status = ["pengetahuan", "keterampilan"];
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  DateTime? tglMulai, tglSelesai;
  String? waktuMulai;
  TextEditingController namaTugasText = TextEditingController(),
      keteranganText = TextEditingController(),
      txtFilterTglMulai = TextEditingController(),
      txtFilterTglSelesai = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
                Text("Mata Pelajaran",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Chip(
                  backgroundColor: kColorTeal,
                  label: Text(InputUjian.dataMapelPerIndex['Namamapel'],
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
                Text("Kelas",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Chip(
                  backgroundColor: kColorBlue,
                  label: Text(
                      "${InputUjian.dataMapelPerIndex['KelompokKelas']} ${InputUjian.dataMapelPerIndex['Jurusan']} ${InputUjian.dataMapelPerIndex['NamaKelompokKelas']}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Komponen",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          dropDownMaterListKomponeneNilai(),
          Divider(
            color: kPrimaryColor,
          ),
          // Column(
          //   children: <Widget>[
          //     RadioGroup<String>.builder(
          //       // direction: Axis.horizontal,
          //       groupValue: _konten,
          //       onChanged: (value) => setState(() {
          //         _konten = value!;
          //         getKomponen(_konten);
          //       }),
          //       items: _status,
          //       itemBuilder: (item) => RadioButtonBuilder(
          //         item,
          //       ),
          //       activeColor: kPrimaryColor,
          //     ),
          //   ],
          // ),
          SizedBox(height: getProportionateScreenHeight(30)),
          dropDownListKomponeneNilai(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNamaTugas(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildKeterangan(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTglMulai(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTglSelesai(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {

              UjianResponse.inputTugasRes(
                  InputUjian.dataMapelPerIndex['NIP'],
                  '${InputUjian.dataMapelPerIndex['idkelompokkls']}',
                  txtFilterTglMulai.text,
                  txtFilterTglSelesai.text,
                  idKomponen,
                  keteranganText.text,
                  '${InputUjian.dataMapelPerIndex['idMapel']}',
                  '${dataTahunAjaran['tahunakademik']}',
                  '${dataTahunAjaran['semester']}',
                  namaTugasText.text,
                  "Ujian",
                  context);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  TextFormField buildNamaTugas() {
    return TextFormField(
      controller: namaTugasText,
      keyboardType: TextInputType.text,
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
        labelText: "Nama *",
        hintText: "Masukan nama tugas",
        prefixIcon: Icon(Icons.task),
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildKeterangan() {
    return TextFormField(
      controller: keteranganText,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kKeteranganNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kKeteranganNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Keterangan *",
        hintText: "Masukan keterangan",
        prefixIcon: Icon(Icons.description),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildTglMulai() {
    return TextFormField(
      controller: txtFilterTglMulai,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => email = newValue,
      onTap: () {
        _tglMulai(context);
      },
      focusNode: AlwaysDisabledFocusNode(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kKeteranganNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kKeteranganNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Tanggal Mulai *",
        hintText: "Tanggal Mulai",
        prefixIcon: Icon(Icons.date_range),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildTglSelesai() {
    return TextFormField(
      controller: txtFilterTglSelesai,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => email = newValue,
      onTap: () {
        _tglSelesai(context);
      },
      focusNode: AlwaysDisabledFocusNode(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kKeteranganNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kKeteranganNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Tanggal Selesai *",
        hintText: "Tanggal Selesai",
        prefixIcon: Icon(Icons.date_range),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Widget dropDownMaterListKomponeneNilai() {
    var data = DropdownSearch<MasterKomponenNilai>(
      mode: Mode.BOTTOM_SHEET,
      label: 'Komponen *',
      showSearchBox: true,
      hint: "Cari Komponen...",
      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
        prefixIcon: Icon(Icons.compare_arrows_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      // maxHeight: 300,
      onFind: (String filter) async => await getMasterKomponen(),
      itemAsString: (MasterKomponenNilai u) => u.nama_komponen,
      onChanged: (MasterKomponenNilai data) =>
      {idMasterKomponen = '${data.idkompnilai}', namaMaterKomponen = data.nama_komponen},
    );
    return data;
  }

  Future<List<MasterKomponenNilai>?> getMasterKomponen() async {
    Dio dio = new Dio();
    dio.options.headers["x-access-token"] = data['access_token'];
    dio.options.headers["username"] = data['username'];
    var response = await dio.get(
      '${masterKomponen}',
    );
    var models = MasterKomponenNilai.fromJsonList(response.data);
    return models;
  }

  Widget dropDownListKomponeneNilai() {
    var data = DropdownSearch<KomponenNilai>(
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
      onFind: (String filter) async => await getKomponen(idMasterKomponen),
      itemAsString: (KomponenNilai u) => u.nama_komponen,
      onChanged: (KomponenNilai data) =>
          {idKomponen = '${data.id}', namaKomponen = data.nama_komponen},
    );
    return data;
  }

  Future<List<KomponenNilai>?> getKomponen(filter) async {
    Dio dio = new Dio();
    dio.options.headers["x-access-token"] = data['access_token'];
    dio.options.headers["username"] = data['username'];
    var response = await dio.get(
      '${komponenNilaiAll}$filter/${InputUjian.dataMapelPerIndex['NIP']}/${InputUjian.dataMapelPerIndex['idMapel']}/${InputUjian.dataMapelPerIndex['idkelompokkls']}',
    );
    print(response.data);
    var models = KomponenNilai.fromJsonList(response.data);
    return models;
  }

  _tglMulai(BuildContext context) async {
    // Intl.systemLocale = await findSystemLocale();
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: tglMulai ?? DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (newSelectedDate != null) {
      final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );
      tglMulai = newSelectedDate;
      var tanggal = tglMulai.toString().split(" ");
      var dateTime = '${tanggal[0]} ${newTime!.format(context)}';
      txtFilterTglMulai
        ..text = dateTime
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: txtFilterTglMulai.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _tglSelesai(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: tglSelesai ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (newSelectedDate != null) {
      final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );
      tglSelesai = newSelectedDate;
      var tanggal = tglSelesai.toString().split(" ");
      var dateTime = '${tanggal[0]} ${newTime!.format(context)}';
      txtFilterTglSelesai
        ..text = dateTime
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: txtFilterTglSelesai.text.length,
            affinity: TextAffinity.upstream));
      // utilsApps.dengerSnack(context, "Sedang dalam pengembangan");

    }
  }
}
