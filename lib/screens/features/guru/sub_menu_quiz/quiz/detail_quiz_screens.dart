import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/body_detail_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/input_soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class DetailQuiz extends StatefulWidget {
  static String routeName = "/detail_quiz";
  static var dataTugasFromDetailTugas;
  @override
  _DetailQuiz createState() => _DetailQuiz();
}

class _DetailQuiz extends State<DetailQuiz> {
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
    DetailQuiz.dataTugasFromDetailTugas = ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          appBar: AppBar(
            backgroundColor: mBackgroundColor,
            title: HeadersForMenu('Detail Quiz/Ujian'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: BodyDetailQuiz(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, MenuQuiz.routeName,
        arguments: MenuQuiz.dataMapelPerIndex);
    return Future.value(true);
  }
}
