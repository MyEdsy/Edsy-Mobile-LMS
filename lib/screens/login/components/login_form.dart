import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/helper/keyboard.dart';
import 'package:school_apps/screens/forgot_password/forgot_password_screen.dart';
import 'package:school_apps/screens/login/response/response_users.dart';
import 'package:school_apps/screens/login_success/login_success_screen.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../login_screens.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  var isLoading = false;
  var status, code, dataTahunAjaran;

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

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
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kColorTealSlow,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Tetap Masuk"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "MASUK",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                usersResponse.loginResponse(txtUserName.text, txtPassword.text, context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: txtPassword,
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
        labelText: "Password",
        hintText: "Masukan password anda",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: txtUserName,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUsernameNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kUsernameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Username",
        hintText: "Masukan username anda",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Future<String> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    try {
      final response = await http.get("${tahunAjaran}", headers: headers);
      responseJson = json.decode(response.body);
      // Future.delayed(Duration(seconds: 2)).then((value) {
      //   utilsApps.hideDialog(context);
      // });
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataTahunAjaran = responseJson['result'];
          sharedPreferences.setString(
              'tahunAjaran', jsonEncode(dataTahunAjaran));
          sharedPreferences.commit();
          // Navigator.pushNamed(context, HomeGuru.routeName);
        } else {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['message'],
              btnOkOnPress: () {},
              btnOkIcon: Icons.check,
              onDissmissCallback: (type) {
                //SignInScreen
                Navigator.pushNamedAndRemoveUntil(
                    context, SignInScreen.routeName, (r) => false);
                // Navigator.pushNamed(
                //     context, SignInScreen.routeName);
              },
              btnOkColor: kColorYellow)
              .show();
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
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
                  context, SignInScreen.routeName, (r) => false);
            },
            btnOkColor: kColorRedSlow)
            .show();
      });
    }

    return 'success';
  }
}
