//import 'package:course_app_flutter/components/text.dart';
//import 'package:course_app_flutter/layouts/column.dart';
//import 'package:course_app_flutter/layouts/row.dart';
//import 'package:course_app_flutter/components/buttom.dart';
import 'package:course_app_flutter/components/buttom_home_screen.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('POS Alquilo Todo'),
          centerTitle: true,
          backgroundColor: Color(0xFF232358),
          foregroundColor: Color(0xFFFFFFFF),
        ),
        backgroundColor: Color(0xFFD3D3D3),
        body: ButtomHomeScreen(),
      ),
    );
  }
}
