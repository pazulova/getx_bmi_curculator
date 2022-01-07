
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bmi_curculator/app_constants/app-colors.dart';
//mport 'package:getx_bmi_curculator/modules/home/screens/home_screen.dart';
import 'package:getx_bmi_curculator/screens/home/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX BMI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      // ignore: prefer_const_constructors
      home: HomeScreen(),
     
    );
  }
}

