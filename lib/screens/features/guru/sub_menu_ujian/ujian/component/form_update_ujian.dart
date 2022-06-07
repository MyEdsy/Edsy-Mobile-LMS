import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/default_button_custome_color.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/model/komponen_nilai_model.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/response/ujian_response.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/update_ujian_screens.dart';
import 'package:school_apps/server/api.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import '../../../../../../size_config.dart';

class FormUpdateUjian extends StatefulWidget {
  @override
  _FormUpdateUjian createState() => _FormUpdateUjian();
}

class _FormUpdateUjian extends State<FormUpdateUjian> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];
  var data = jsonDecode(dataUserLogin);

  String _konten = "pengetahuan";

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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      namaTugasText.text = UpdateUjian.dataMapelPerIndex['nama_tugas'];
      keteranganText.text = UpdateUjian.dataMapelPerIndex['keterangan'];
      txtFilterTglMulai.text = UpdateUjian.dataMapelPerIndex['tgl_mulai'];
      txtFilterTglSelesai.text = UpdateUjian.dataMapelPerIndex['tgl_selesai'];
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
                  label: Text(MenuUjian.dataMapelPerIndex['Namamapel'],
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
                      '${MenuUjian.dataMapelPerIndex['KelompokKelas']} ${MenuUjian.dataMapelPerIndex['Jurusan']} ${MenuUjian.dataMapelPerIndex['NamaKelompokKelas']}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
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
              UjianResponse.updateTugasRes(
                  '${UpdateUjian.dataMapelPerIndex['id']}',
                  namaTugasText.text,
                  keteranganText.text,
                  txtFilterTglMulai.text,
                  txtFilterTglSelesai.text,
                  context);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButtonCustomeColor(
            text: "Hapus",
            color: kColorRedSlow,
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // KomponenBahanAjarResponse.hapusBahanAjar(
                //     '${UpdateBahanAjar.dataMapelPerIndex['bahanAjar']['id']}',
                //     context);

                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
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

  Widget dropDownListKomponeneNilai() {
    var data = DropdownSearch<KomponenNilai>(
      mode: Mode.BOTTOM_SHEET,
      label: 'Komponen Nilai *',
      showSearchBox: true,
      hint: UpdateUjian.dataMapelPerIndex['tb_komponen_nilai']['nama_komponen'],

      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
        prefixIcon: Icon(Icons.compare_arrows_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      // maxHeight: 300,
      onFind: (String filter) async => await getKomponen(_konten),
      itemAsString: (KomponenNilai u) => u.nama_komponen,
      onChanged: (KomponenNilai data) {
        // idKomponen = '${data.id}';
        // namaKomponen = data.nama_komponen;
      },
    );
    return data;
  }

  Widget dropDownType() {
    return DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
        prefixIcon: Icon(Icons.merge_type),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxHeight: 120,
      items: ["Essay", "File"],
      label: "Type",
      hint: UpdateUjian.dataMapelPerIndex['type'],
      popupItemDisabled: (String s) => s.startsWith('I'),
      onChanged: (data) => {type = data},
      // selectedItem: UpdateTugas.dataMapelPerIndex['type']
    );
  }

  Future<List<KomponenNilai>?> getKomponen(filter) async {
    Dio dio = new Dio();
    dio.options.headers["x-access-token"] = data['access_token'];
    dio.options.headers["username"] = data['username'];
    var response = await dio.get(
      '${komponenNilaiAll}$filter/${UpdateUjian.dataMapelPerIndex['NIP']}/${UpdateUjian.dataMapelPerIndex['idMapel']}/${UpdateUjian.dataMapelPerIndex['idkelompokkls']}',
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
      print(dateTime);
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
