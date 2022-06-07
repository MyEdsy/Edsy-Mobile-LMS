import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/constants.dart';
import 'package:school_apps/helper/keyboard.dart';
import 'package:school_apps/helper/utils_apps.dart';
import 'package:school_apps/model/model_list_sekolah_edsy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';
import '../SuccessOnBoarding.dart';

class OnBoardingForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<OnBoardingForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  var isLoading = false;
  var status, code, dataBaseUrl = {}, responseJson;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController txtKodeSekolah = TextEditingController();

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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // kodeSekolah(),
          dropDownListKomponeneNilai(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Lanjutkan",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                if (dataBaseUrl.isEmpty) {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.RIGHSLIDE,
                          headerAnimationLoop: true,
                          title: 'Peringatan',
                          desc: "Anda belum memilih sekolah",
                          btnOkOnPress: () {},
                          btnOkIcon: Icons.check,
                          onDissmissCallback: (type) {},
                          btnOkColor: kColorRedSlow)
                      .show();
                } else {
                  setState(() {
                    utilsApps.showDialog(context);
                    Future.delayed(const Duration(seconds: 1)).then((value) {
                      utilsApps.hideDialog(context);
                      sharedPreferences.setString(
                          'dataBaseUrl', jsonEncode(dataBaseUrl));
                      sharedPreferences.setBool('setDataIp', true);
                      sharedPreferences.commit();
                      Navigator.pushNamed(context, SuccessOnboarding.routeName);
                    });
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField kodeSekolah() {
    return TextFormField(
      // obscureText: true,
      controller: txtKodeSekolah,
      decoration: const InputDecoration(
        labelText: "Kode Sekolah",
        hintText: "Masukan Kode Sekolah",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  Widget dropDownListKomponeneNilai() {
    var data = DropdownSearch<ModelMasterSekolah>(
      mode: Mode.BOTTOM_SHEET,
      label: 'Pilih Sekolah',
      showSearchBox: true,
      hint: "Cari Sekolah Kamu...",
      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
        prefixIcon: Icon(Icons.compare_arrows_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      // maxHeight: 300,
      onFind: (String filter) async => await getKomponen(),
      itemAsString: (ModelMasterSekolah u) => u.nama_sekolah,
      onChanged: (ModelMasterSekolah data) {
        setState(() {
          dataBaseUrl = {
            "kode_sekolah": data.kode_sekolah,
            "nama_sekolah": data.nama_sekolah,
            "base_url_api": data.base_url_api,
            "base_url_lms": data.base_url_lms,
            "base_url_admin": data.base_url_admin
          };
        });
      },
    );
    return data;
  }

  Future<List<ModelMasterSekolah>?> getKomponen() async {
    Dio dio = new Dio();
    var response = await dio.get(
      'http://192.168.4.54:5050/data-sekolah/get-data',
    );
    var models = ModelMasterSekolah.fromJsonList(response.data);
    return models;
  }
}
