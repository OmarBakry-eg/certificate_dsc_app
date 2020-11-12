import 'file:///C:/Users/like/AndroidStudioProjects/certificate_dsc_app/lib/screen/final_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'package:get/get.dart';

class ChooseTemplatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: text,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * .01),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Choose Your Template',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .05),
          Container(
            width: double.infinity,
            height: size.height * .6,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return certificateTemp(index, size);
                }),
          ),
        ],
      ),
    );
  }

  Column certificateTemp(int index, Size size) {
    return Column(
      children: [
        InkWell(
          child: Container(
            child: Image(
              image: AssetImage('assets/c/$index.jpg'),
            ),
            width: size.width * .9,
          ),
          onTap: () {
            Get.to(EditAndSave(
              index: index,
            ));
          },
        ),
        SizedBox(
          height: size.height * .01,
        ),
      ],
    );
  }
}
