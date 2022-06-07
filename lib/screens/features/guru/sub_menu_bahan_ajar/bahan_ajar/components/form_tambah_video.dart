import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/response/response_komponen_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/respones/bahanMengajarResponse.dart';

import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';
import '../bahan_ajar_screen.dart';
import '../input_bahan_ajar_form.dart';
import '../input_video_screen.dart';

class FormTambahVideo extends StatefulWidget {
  @override
  _FormTambahVideo createState() => _FormTambahVideo();
}

class _FormTambahVideo extends State<FormTambahVideo> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  TextEditingController
      judulVideoText = TextEditingController(),
      linkText = TextEditingController();

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
                  label: Text(InputVideo.dataMapelPerIndex['Namamapel'],
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
                      '${InputVideo.dataMapelPerIndex['KelompokKelas']} ${InputVideo.dataMapelPerIndex['Jurusan']} ${InputVideo.dataMapelPerIndex['NamaKelompokKelas']}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildJudulVideo(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLink(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KomponenBahanAjarResponse.
                  inputVideoBahanAjar('${InputVideo.dataMapelPerIndex['idBahanAjar']}',
                    judulVideoText.text, linkText.text, context);
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

  TextFormField buildJudulVideo() {
    return TextFormField(
      controller: judulVideoText,
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
        labelText: "Judul Video *",
        hintText: "Masukan judul video",
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLink() {
    return TextFormField(
      controller: linkText,
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
        labelText: "Link Youtube *",
        hintText: "Masukan link youtube",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
