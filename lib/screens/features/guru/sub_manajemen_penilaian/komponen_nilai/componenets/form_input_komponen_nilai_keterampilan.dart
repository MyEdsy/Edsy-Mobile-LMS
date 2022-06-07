import 'package:flutter/material.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/response/response_komponen_nilai.dart';

import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';
import '../input_komponen_nilai_keterampilan_screen.dart';
import '../input_komponen_nilai.dart';
import 'component_komponen_nilai_keterampilan.dart';
import 'component_komponen_nilai_pengetahuan.dart';

class InputKategoriNilaiKeterampilanForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<InputKategoriNilaiKeterampilanForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  TextEditingController namaKomponen = TextEditingController(),
      bobot = TextEditingController();

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
                  label: Text(InputKategoriNilaiKeterampilan.dataMapelFromRoutes['Namamapel'],
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
                      '${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['KelompokKelas']} ${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['Jurusan']} ${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['NamaKelompokKelas']}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildKategoriNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPersentaseBobotFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  KomponenNilaiResponse.inputKomponenNilaiRes(
                      namaKomponen.text,
                      "keterampilan",
                      bobot.text,
                      InputKategoriNilaiKeterampilan.dataMapelFromRoutes['NIP'],
                      '${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['idMapel']}',
                      '${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['Tahun']}',
                      InputKategoriNilaiKeterampilan.dataMapelFromRoutes['Semester'],
                      '${InputKategoriNilaiKeterampilan.dataMapelFromRoutes['idkelompokkls']}',
                      context);
                });
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          KategoriNilaiKeterampilan()
        ],
      ),
    );
  }

  TextFormField buildKategoriNameFormField() {
    return TextFormField(
      controller: namaKomponen,
      keyboardType: TextInputType.text,
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
        labelText: "Komponen *",
        hintText: "Masukan komponen nilai",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPersentaseBobotFormField() {
    return TextFormField(
      controller: bobot,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPersentaseBobotNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPersentaseBobotNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Persentase Bobot *",
        hintText: "Masukan persentase bobot",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
