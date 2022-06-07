import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/respones/bahanMengajarResponse.dart';

import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';
import '../input_file_screens.dart';

class FormTambahFile extends StatefulWidget {
  @override
  _FormTambahVideo createState() => _FormTambahVideo();
}

class _FormTambahVideo extends State<FormTambahFile> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  bool isLoadingPath = false;
  bool isMultiPick = false;
  // FileType? fileType;
  String? fileName;
  String? path;
  Map<String, String>? paths;
  List<String>? extensions;
  String? name;
  var filePath;

  TextEditingController judulFileText = TextEditingController();

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
                  label: Text(InputFile.dataMapelPerIndex['Namamapel'],
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
                      '${InputFile.dataMapelPerIndex['KelompokKelas']} ${InputFile.dataMapelPerIndex['Jurusan']} ${InputFile.dataMapelPerIndex['NamaKelompokKelas']}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildJudulFile(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: GestureDetector(
              // onTap: () => file(),
              child: const Chip(
                  backgroundColor: kColorTealToSlow,
                  avatar: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Pilih File Pembelajaran",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
          ),
          _files(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KomponenBahanAjarResponse.inputFileBahanAjar(
                    '${InputFile.dataMapelPerIndex['idBahanAjar']}',
                    judulFileText.text,
                    filePath,
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

  TextFormField buildJudulFile() {
    return TextFormField(
      controller: judulFileText,
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
        labelText: "Judul File *",
        hintText: "Masukan judul file",
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  // void file () async{
  //   setState(() => isLoadingPath = true);
  //   try {
  //     if (isMultiPick) {
  //       path = null;
  //       paths = await FilePicker.getMultiFilePath(
  //           type: fileType ?? FileType.any,
  //           allowedExtensions: extensions);
  //     } else {
  //       path = await FilePicker.getFilePath(
  //           type: fileType ?? FileType.any,
  //           allowedExtensions: extensions);
  //       paths = null;
  //     }
  //   } on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     isLoadingPath = false;
  //     fileName = path != null
  //         ? path!.split('/').last
  //         : paths != null
  //         ? paths!.keys.toString()
  //         : '...';
  //   });
  // }

  _files() {
    return Builder(
      builder: (BuildContext context) => isLoadingPath
          ? new Container()
          : path != null || paths != null
              ? Container(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  height: 60,
                  child: Scrollbar(
                      child: ListView.separated(
                    itemCount:
                        paths != null && paths!.isNotEmpty ? paths!.length : 1,
                    itemBuilder: (BuildContext context, int index) {
                      final bool isMultiPath =
                          paths != null && paths!.isNotEmpty;
                      // final int fileNo = index + 1;
                      name = (isMultiPath
                          ? paths!.keys.toList()[index]
                          : fileName ?? '...');
                      filePath = isMultiPath
                          ? paths!.values.toList()[index].toString()
                          : path;
                      return ListTile(
                          title: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name!,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xFF4B4B4B)
                                    // letterSpacing: .6
                                    )),
                          ],
                        ),
                      )
                          // subtitle: new Text(filePath),
                          );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        new Container(),
                  )),
                )
              : new Container(),
    );
  }
}
