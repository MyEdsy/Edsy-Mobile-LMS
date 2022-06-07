import 'dart:convert';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/response/soalResponse.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/update_soal.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import '../../../../../../size_config.dart';

class FormUpdateSoalEsay extends StatefulWidget {
  @override
  _FormUpdateSoalEsay createState() => _FormUpdateSoalEsay();
}

class _FormUpdateSoalEsay extends State<FormUpdateSoalEsay> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];
  var data = jsonDecode(dataUserLogin);

  bool isLoadingPath = false;
  bool isMultiPick = false;
  // FileType? fileType;
  String? fileName;
  String? path;
  Map<String, String>? paths;
  List<String>? extensions;
  String? name;
  var filePath;

  TextEditingController namaSoalText = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      namaSoalText.text = UpdateSoalEssay.data['soal'];
    });
  }

  @override
  void dispose() {
    super.dispose();
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
    // print(InputSoalEssay.data['idTugas']);
    // if(InputSoalEssay.data['typeSoal'] == "Essay") {
    //   jumlahSoal = InputSoalEssay.data['jumlahSoal'];
    // }else {
    //   jumlahSoal = 1;
    // }
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Update Soal',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildSoal(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (UpdateSoalEssay.data['file'] == null) {
                SoalResponse.updateSoalRes(namaSoalText.text,
                    '${UpdateSoalEssay.data['idSoal']}', context);
              } else {
                print("soal file");
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  TextFormField buildSoal() {
    // String blah = index;
    return TextFormField(
      controller: namaSoalText,
      keyboardType: TextInputType.multiline,
      maxLines: null,
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
      decoration: InputDecoration(
        labelText: 'Soal',
        hintText: "Masukan soal",
        prefixIcon: Icon(Icons.task),
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  // Builder _judulFiles(index) {
  //   return Builder(builder: (context) {
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(height: getProportionateScreenHeight(10)),
  //         Padding(padding: EdgeInsets.only(left: 5), child: GestureDetector(
  //           onTap: () => file(),
  //           child: Chip(
  //               backgroundColor: kColorTealToSlow,
  //               avatar: Icon(Icons.add, color: Colors.white,),
  //               label: Text("Pilih File Pembelajaran", style: TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white),)
  //           ),
  //         ),),
  //         _files()
  //       ],
  //     );
  //   });
  // }

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
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, color: Color(0xFF4B4B4B)
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
