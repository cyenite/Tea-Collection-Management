import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/screens/navigation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tea Logistics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: NavigationPage(),
    );
  }
}
