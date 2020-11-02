import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'choose_temp.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(child: welcomeWidget(context)),
      ),
    );
  }

  Column welcomeWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Certificate Maker',
            style: GoogleFonts.openSans(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Expanded(flex: 3, child: SvgPicture.asset('assets/wel.svg')),
        Expanded(
          flex: 1,
          child: Text(
            'by',
            style: GoogleFonts.openSans(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Text(
          'Developer Student Club',
          style: GoogleFonts.openSans(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Spacer(),
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
        Spacer()
      ],
    );
  }
}
