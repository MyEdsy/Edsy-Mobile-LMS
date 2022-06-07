import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class Onboarding extends StatefulWidget {
  // Onboarding({required Key key}) : super(key: key);
  static String routerName = '/on_boarding';
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
      child: Body(),
    ));
  }
}
