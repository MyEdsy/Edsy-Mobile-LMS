import 'dart:convert';

// import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/components/form_error.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/response/soalResponse.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import '../../../../../../size_config.dart';
import '../input_soal.dart';

class FormInputSoalEsay extends StatefulWidget {
  @override
  _FormInputSoalEsay createState() => _FormInputSoalEsay();
}

class _FormInputSoalEsay extends State<FormInputSoalEsay> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];
  var data = jsonDecode(dataUserLogin);

  List<dynamic> dataSoal = [];

  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType? fileType;
  String? fileName;
  String? path;
  Map<String, String>? paths;
  List<String>? extensions;
  String? name;
  String? filePath;
  String? files;
  var jumlahSoal;

  int myInt = 0;
  late List<TextEditingController> namaSoalText;

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
    namaSoalText = List.generate(
        InputSoalEssay.data['jumlahSoal'], (i) => TextEditingController());
  }

  @override
  void dispose() {
    namaSoalText.forEach((c) => c.dispose());
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
    // if(InputSoalEssay.data['typeSoal'] == "Essay") {
    //   jumlahSoal = InputSoalEssay.data['jumlahSoal'];
    // }else {
    //   jumlahSoal = 1;
    // }
    jumlahSoal = InputSoalEssay.data['jumlahSoal'];
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Buat Soal ${InputSoalEssay.data['typeSoal']}',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          _getTextWidgets(jumlahSoal),
          FormError(errors: errors),
          DefaultButton(
            text: "Submit",
            press: () {
              if (InputSoalEssay.data['typeSoal'] == "Essay") {
                int length = InputSoalEssay.data['jumlahSoal'];
                for (var i = 0; i < length; i++) {
                  dataSoal.add({
                    "soal": namaSoalText[i].text,
                    "id_tugas": '${InputSoalEssay.data['idTugas']}',
                    "jumlahSoal": '${InputSoalEssay.data['jumlahSoal']}',
                    "idTugas": '${InputSoalEssay.data['idTugas']}',
                    "type": '${InputSoalEssay.data['typeSoal']}'
                  });
                }
                SoalResponse.inputSoalRes(dataSoal, context);
              } else {
                SoalResponse.inputSoalFileRes(
                    namaSoalText[0].text,
                    filePath,
                    '${InputSoalEssay.data['idTugas']}',
                    '${jumlahSoal}',
                    '${InputSoalEssay.data['typeSoal']}',
                    context);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  _getTextWidgets(data) {
    List<Widget> list = <Widget>[];
    if (InputSoalEssay.data['typeSoal'] == "Essay") {
      for (var i = 0; i < data; i++) {
        list.add(SizedBox(height: 10));
        list.add(buildSoal(i));
        list.add(SizedBox(height: 10));
      }
      return Column(children: list);
    } else if (InputSoalEssay.data['typeSoal'] == "File") {
      for (var i = 0; i < data; i++) {
        list.add(SizedBox(height: 10));
        list.add(buildSoal(i));
        list.add(SizedBox(height: 10));
        // list.add(_judulFiles(i));
        list.add(SizedBox(height: 10));
      }
      return Column(children: list);
    } else {
      print('PG');
      return Container();
    }
  }

  TextFormField buildSoal(index) {
    // String blah = index;
    return TextFormField(
      controller: namaSoalText[index],
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
        labelText: 'Soal ke ${index + 1}',
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
  //           onTap: () => file(index),
  //           child: Chip(
  //               backgroundColor: kColorTealToSlow,
  //               avatar: Icon(Icons.add, color: Colors.white,),
  //               label: Text("Pilih File Pembelajaran", style: TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white),)
  //           ),
  //         ),),
  //         _files(index)
  //       ],
  //     );
  //   });
  // }

  // void file (index) async{
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

  _files(i) {
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
