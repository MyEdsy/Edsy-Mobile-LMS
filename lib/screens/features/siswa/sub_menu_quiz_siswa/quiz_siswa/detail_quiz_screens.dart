import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/input_soal_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_quiz_siswa/quiz_siswa/quiz_screens_.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import 'component/body_detail_quiz.dart';

class DetailQuizSiswa extends StatefulWidget {
  static String routeName = "/detail_quiz_siswa";
  static var dataTugasFromDetailTugas;
  @override
  _DetailQuiz createState() => _DetailQuiz();
}

class _DetailQuiz extends State<DetailQuizSiswa> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  final List<String?> errors = [];
  String type = '';
  TextEditingController jumlahSoalText = TextEditingController();

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
    DetailQuizSiswa.dataTugasFromDetailTugas = ModalRoute.of(context)!.settings.arguments as Map;
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
            title: HeadersForMenu('Detail Quiz'),
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
          body: BodyDetailQuizSiswa(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuQuizSiswa.routeName,
        arguments: MenuQuizSiswa.dataMapelPerIndex);
    return Future.value(true);
  }

  _popUp() {
    // set up the buttons
    Widget OK = GestureDetector(
        onTap: () async{
          var myInt = int.parse(jumlahSoalText.text);
          assert(myInt is int);
          var data = ModalRoute.of(context)!.settings.arguments as Map;
          print({
            "typeSoal": type,
            "jumlahSoal": myInt,
            "idTugas": data['id']
          });
          await Navigator.pushNamed(context, InputSoalQuiz.routeName, arguments: {
            "typeSoal": type,
            "jumlahSoal": myInt,
            "idTugas": data['id']
          });
        },
        child: const Chip(
          avatar: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: kColorTealSlow,
          label: Text("OK",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));

    Widget cancelButton = GestureDetector(
        onTap: () => {Navigator.of(context).pop()},
        child: const Chip(
          avatar: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          backgroundColor: kColorRedSlow,
          label: Text("Batal",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Pilih Tipe Tugas",
        style: mTitleStyle16,
      ),
      content: Container(
        height: 175,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            dropDownType(),
            SizedBox(
              height: 15,
            ),
            _buildJumlahTugas()
          ],
        ),
      ),
      actions: [OK, cancelButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _buildJumlahTugas() {
    return TextFormField(
      controller: jumlahSoalText,
      keyboardType: TextInputType.number,
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
        labelText: "Jumlah Soal *",
        hintText: "Masukan jumlah soal",
        prefixIcon: Icon(Icons.task),
        // If  you are using latest version orf flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Widget dropDownType() {
    return DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(43, 15, -40, 0),
        prefixIcon: Icon(Icons.merge_type),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxHeight: 120,
      items: ["Essay", "File"],
      label: "Type",
      // selectedItem: 'Essay',
      hint: "Type Tugas",
      popupItemDisabled: (String s) => s.startsWith('I'),
      onChanged: (data) => {type = data},
      // selectedItem: "Essay"
    );
  }
}
