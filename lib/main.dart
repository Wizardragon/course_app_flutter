//import 'package:course_app_flutter/components/text.dart';
//import 'package:course_app_flutter/layouts/column.dart';
//import 'package:course_app_flutter/layouts/row.dart';
//import 'package:course_app_flutter/components/buttom.dart';
import 'package:course_app_flutter/screens/home_screen.dart';
//import 'package:course_app_flutter/components/images.dart';
//import 'package:course_app_flutter/components/textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home : const HomeScreen(),

      );
  }
}
