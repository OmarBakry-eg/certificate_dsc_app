import 'package:certificate_dsc_app/final_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'package:get/get.dart';

///TODO : Implement Responsive on sizes and padding
class ChooseTemplatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 18.0),
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
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            height: 500,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image(
                            image: AssetImage('assets/c/$index.jpg'),
                          ),
                          width: 370,
                        ),
                        onTap: () {
                          Get.to(EditAndSave(
                            index: index,
                          ));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }),
            // child: ListWheelScrollView(
            //   itemExtent: 350,
            //   diameterRatio: 1,
            //   children: img.map((e) {
            //     return InkWell(
            //       onTap: () {
            //         print(e);
            //       },
            //       child: Container(
            //         child: Image(
            //           image: AssetImage(e),
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // ),
          ),
        ],
      ),
    );
  }
}
