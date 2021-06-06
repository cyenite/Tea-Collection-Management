import 'package:flutter/material.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/screens/landing/landing_body.dart';

import 'landing/header.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.white1, MyColors.white2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[Header(), Body()],
          ),
        ),
      ),
    );
  }
}
