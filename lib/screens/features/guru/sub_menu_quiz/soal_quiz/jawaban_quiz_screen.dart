import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/soal_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'components/body.dart';
import 'components/body_jawaban_quiz_siswa.dart';

class JawabanQuizSiswaDiGuru extends StatefulWidget {
  static String routeName = "/jawaban_quiz_di_guru";
  static var dataSoal;
  @override
  _JawabanSiswaDiGuru createState() => _JawabanSiswaDiGuru();
}
// {idDetailSoal: 173, keterangan: kerjakan secara kelompok, idTugas: 147}

class _JawabanSiswaDiGuru extends State<JawabanQuizSiswaDiGuru> {
  @override
  Widget build(BuildContext context) {
    JawabanQuizSiswaDiGuru.dataSoal =
        ModalRoute.of(context)!.settings.arguments as Map;
    print(JawabanQuizSiswaDiGuru.dataSoal['soal']);
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   color: Colors.blueGrey,
            //   onPressed: () {
            //     _onBackPressed();
            //   },
            // ),
            // automaticallyImplyLeading: false,
            title: HeadersForMenu('Jawaban Siswa'),
            // actions: [
            //   Container(
            //     child: IconButton(
            //         icon: Icon(Icons.add),
            //         color: Colors.blueGrey,
            //         onPressed: () {
            //           _popUp();
            //         }),
            //   ),
            // ],
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: BodyJawabanQuizSiswa(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, SoalQuiz.routeName, arguments: {
      "idDetailSoal": JawabanQuizSiswaDiGuru.dataSoal['idDetailTugas'],
      "idTugas": JawabanQuizSiswaDiGuru.dataSoal['id_tugas'],
      "keterangan": SoalQuiz.dataTugas['keterangan'],
      "type": SoalQuiz.dataTugas['type'],
      // "keterangan": SoalTugas.dataTugas['keterangan'],
    });
    return Future.value(true);
  }

// _popUp() {
//   // set up the buttons
//   print(SoalTugas.dataTugas['id']);
//   Widget OK = InkWell(
//       onTap: () {
//         var myInt = int.parse(jumlahSoalText.text);
//         assert(myInt is int);
//         Navigator.pushNamed(context, InputSoalEssay.routeName,
//             arguments:  {"typeSoal": type, "jumlahSoal": myInt, "id": SoalTugas.dataTugas['id']});
//       },
//       child: const Chip(
//         avatar: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//         backgroundColor: kColorTealSlow,
//         label: Text("OK",
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),
//       ));
//
//   Widget cancelButton = GestureDetector(
//       onTap: () => {Navigator.of(context).pop()},
//       child: const Chip(
//         avatar: Icon(
//           Icons.cancel,
//           color: Colors.white,
//         ),
//         backgroundColor: kColorRedSlow,
//         label: Text("Batal",
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),
//       ));
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(
//       "Pilih Tipe Tugas",
//       style: mTitleStyle16,
//     ),
//     content: Container(
//       height: 175,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 15,
//           ),
//           dropDownType(),
//           SizedBox(
//             height: 15,
//           ),
//           buildJumlahTugas(),
//         ],
//       ),
//     ),
//     actions: [OK, cancelButton],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
//
// TextFormField buildJumlahTugas() {
//   return TextFormField(
//     controller: jumlahSoalText,
//     keyboardType: TextInputType.number,
//     onSaved: (newValue) => email = newValue,
//     onChanged: (value) {
//       if (value.isNotEmpty) {
//         removeError(error: kJudulBahanyNullError);
//       }
//       // else if (emailValidatorRegExp.hasMatch(value)) {
//       //   removeError(error: kInvalidEmailError);
//       // }
//       return;
//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         addError(error: kJudulBahanyNullError);
//         return "";
//       }
//       return null;
//     },
//     decoration: const InputDecoration(
//       labelText: "Jumlah Soal *",
//       hintText: "Masukan jumlah soal",
//       prefixIcon: Icon(Icons.task),
//       // If  you are using latest version orf flutter then lable text and hint text shown like this
//       // if you r using flutter less then 1.20.* then maybe this is not working properly
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//     ),
//   );
// }
//
// Widget dropDownType() {
//   return DropdownSearch<String>(
//     mode: Mode.MENU,
//     showSelectedItem: true,
//     dropdownSearchDecoration: const InputDecoration(
//       contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
//       prefixIcon: Icon(Icons.merge_type),
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//     ),
//     maxHeight: 120,
//     items: ["Essay", "File"],
//     label: "Type",
//     hint: "Type Tugas",
//     popupItemDisabled: (String s) => s.startsWith('I'),
//     onChanged: (data) => {type = data},
//     // selectedItem: "Essay"
//   );
// }
}
