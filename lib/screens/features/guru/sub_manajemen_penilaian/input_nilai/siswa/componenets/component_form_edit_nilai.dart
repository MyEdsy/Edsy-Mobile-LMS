import 'package:flutter/material.dart';
import 'package:school_apps/components/custom_surfix_icon.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../size_config.dart';



class EditNilaiForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<EditNilaiForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

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
                Text("Nama Siswa", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, color: Colors.black)),
                Chip(
                  backgroundColor: kColorTealToSlow,
                  label: Text("John Petrucci", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold, color: Colors.white)),
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
                Text("Jurusan", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, color: Colors.black)),
                Chip(
                  backgroundColor: kColorBlue,
                  label: Text("X IPA 1", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTugas1FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTugas2FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUtsFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUasFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
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


  TextFormField buildTugas1FormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => email = newValue,
      initialValue: "86",
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
        labelText: "Tugas 1 *",
        hintText: "Masukan nilai tugas",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildTugas2FormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: "80",
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
        labelText: "Tugas 2 *",
        hintText: "Masukan nilai tugas",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildUtsFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: "86",
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kPengetahuanNullError);
        // }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kPengetahuanNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: const InputDecoration(
        labelText: "UTS *",
        hintText: "Masukan nilai uts",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildUasFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: "90",
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kPersentaseBobotNullError);
        // }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return;
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kPersentaseBobotNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: const InputDecoration(
        labelText: "UAS *",
        hintText: "Masukan nilai uas",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
