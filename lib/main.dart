import 'package:certificate_dsc_app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///TODO: Do code refactor
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFAB5BB),
        backgroundColor: Color(0xFF32496B),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}
final Text text = Text(
  'Certificate Maker',
  style: GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.w600,
  ),
);