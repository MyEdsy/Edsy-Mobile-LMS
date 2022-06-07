import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/no_account_text.dart';
import 'package:school_apps/helper/keyboard.dart';
import 'package:school_apps/screens/features/siswa/profile/response/usersResponse.dart';

import '../../../../constants.dart';
import '../../../../main.dart';
import '../../../../size_config.dart';

class UbahPassword extends StatefulWidget {
  static String routeName = "/ubah_password_siswa";
  @override
  _UbahPassword createState() => _UbahPassword();
}

class _UbahPassword extends State<UbahPassword> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  TextEditingController txtPasswordLama = TextEditingController(),
      txtPasswordBaru = TextEditingController();

  var data = jsonDecode(dataUserLogin);

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
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildPasswordLamaFormField(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      buildPasswordBaruFormField(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      DefaultButton(
                        text: "Kirim",
                        press: () {
                          KeyboardUtil.hideKeyboard(context);
                          UpdateProfiile.updateProfile(
                              {
                                "passwordLama": txtPasswordLama.text,
                                "passwordBaru": txtPasswordBaru.text,
                                "username" : data['username']
                              }, context);
                        },
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordLamaFormField() {
    return TextFormField(
      obscureText: true,
      controller: txtPasswordLama,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password Lama",
        hintText: "Masukan password lama",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordBaruFormField() {
    return TextFormField(
      obscureText: true,
      controller: txtPasswordBaru,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password Baru",
        hintText: "Masukan password baru",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
