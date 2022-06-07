// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/default_button_custome_color.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/respones/bahanMengajarResponse.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/update_bahan_ajar_screens.dart';

import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';

class FormUpdateBahanAjar extends StatefulWidget {
  @override
  _InputBahanAjar createState() => _InputBahanAjar();
}

class _InputBahanAjar extends State<FormUpdateBahanAjar> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  TextEditingController judulKontenText = TextEditingController(),
      keteranganText = TextEditingController();

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
                Text("Mata Pelajaran",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Chip(
                  backgroundColor: kColorTeal,
                  label: Text(UpdateBahanAjar.dataMapelPerIndex['Namamapel'],
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
                      '${UpdateBahanAjar.dataMapelPerIndex['KelompokKelas']} ${UpdateBahanAjar.dataMapelPerIndex['Jurusan']} ${UpdateBahanAjar.dataMapelPerIndex['NamaKelompokKelas']}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          // edsy-xavepa-balam
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNamaBahaMengajar(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildKeterangan(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KomponenBahanAjarResponse.updateBahanAjar(
                    '${UpdateBahanAjar.dataMapelPerIndex['bahanAjar']['id']}',
                    judulKontenText.text,
                    keteranganText.text,
                    context);

                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButtonCustomeColor(
            text: "Hapus",
            color: kColorRedSlow,
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KomponenBahanAjarResponse.hapusBahanAjar(
                    '${UpdateBahanAjar.dataMapelPerIndex['bahanAjar']['id']}',
                    context);

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

  TextFormField buildNamaBahaMengajar() {
    judulKontenText.text =
        '${UpdateBahanAjar.dataMapelPerIndex['bahanAjar']['judul']}';
    return TextFormField(
      controller: judulKontenText,
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
        hintText: "Masukan judul bahan mengajar",
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildKeterangan() {
    keteranganText.text =
        '${UpdateBahanAjar.dataMapelPerIndex['bahanAjar']['keterangan']}';
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
