import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'choose_temp.dart';

//TODO: Implement Responsive ( for time use media query )

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Certificate Maker',
              style: GoogleFonts.openSans(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SvgPicture.asset('assets/wel.svg'),
            SizedBox(
              height: 30,
            ),
            Text(
              'by',
              style: GoogleFonts.openSans(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Developer Student Club',
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 95,
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(ChooseTemplatePage());
              },
              child: Container(
                width: 211,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.openSans(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
