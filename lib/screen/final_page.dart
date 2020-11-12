import 'package:certificate_dsc_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import 'package:get/get.dart';
import 'package:certificate_dsc_app/screen/temp.dart';
import 'package:certificate_dsc_app/model/consts.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

//TODO: Implement  +++ form validation (VI) +++ , more responsive as possible AND refactoring #CODE#
class EditAndSave extends StatelessWidget {
  final int index;
  EditAndSave({this.index});
  final dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus;
    void unFocus() {
      currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return GestureDetector(
      onTap: unFocus,
      child: GetX<DataController>(
        builder: (c) => Scaffold(
          appBar: AppBar(
            centerTitle: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  unFocus();
                  Get.back();
                }),
            title: text,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.done,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Get.to(BuildTemp(
                    fontFamily: c.dataModel.value.fontFamily,
                    name: c.dataModel.value.name,
                    fontSize: c.dataModel.value.textFontSize,
                    color: c.dataModel.value.textColor,
                    index: index,
                  ));
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                editCertificate(size, isLandscape),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      textField(UNIVERSITY_NAME, DSC_NAME, size, isLandscape,
                          context),
                      textField(AWARD, DESCRIPTION, size, isLandscape, context),
                      selectFont(isLandscape, size, FONTS, context),
                      fontSize(isLandscape, size, FONT_SIZE, context),
                      selectColor("Colors :", size, isLandscape, context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectFont(bool isLandscape, Size size, String lable, context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    width: 1, color: Theme.of(context).primaryColor)),
            width: isLandscape ? size.width * .4 : size.width * .6,
            height: isLandscape ? size.height * .1 : size.height * .070,
            child: DropdownButton(
              underline: DropdownButtonHideUnderline(
                child: SizedBox.shrink(),
              ),
              isExpanded: true,
              hint: Text('Select Font'),
              value: dataController.dataModel.value.fontFamily,
              items: fontList
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                dataController.changeFontFamily(val);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget fontSize(bool isLandscape, Size size, String lable, context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 1, color: Theme.of(context).primaryColor)),
              width: isLandscape ? size.width * .3 : size.width * .5,
              height: isLandscape ? size.height * .1 : size.height * .070,
              child: DropdownButton(
                underline: DropdownButtonHideUnderline(
                  child: SizedBox.shrink(),
                ),
                isExpanded: true,
                hint: Text('Select Font'),
                value: dataController.dataModel.value.textFontSize,
                items: fontSizeList
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text("${e.toString()} px"),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  dataController.changeFontSize(value);
                },
              ))
        ],
      ),
    );
  }

  Widget selectColor(String lable, Size size, bool isLandscape, context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                colors(size, isLandscape),
                InkWell(
                  onTap: () {
                    Alert(
                      context: context,
                      title: 'Pick Color',
                      content: new ColorPicker(
                        color: Colors.brown,
                        onChanged: (value) {
                          dataController.changeFontColor(value);
                        },
                      ),
                    ).show();
                  },
                  child: Container(
                    child: Icon(Icons.add),
                    width: isLandscape ? size.width * .13 : size.width * .16,
                    height: isLandscape ? size.height * .2 : size.height * .08,
                    decoration: BoxDecoration(
                      border: Border.all(width: .2),
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                          colors: [Colors.purpleAccent, Colors.blueAccent]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget colors(Size size, bool isLandscape) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: colorsList
            .map(
              (color) => InkWell(
                onTap: () {
                  dataController.changeFontColor(color);
                },
                child: Container(
                  width: isLandscape ? size.width * .13 : size.width * .16,
                  height: isLandscape ? size.height * .2 : size.height * .08,
                  decoration: BoxDecoration(
                    border: Border.all(width: .2),
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            )
            .toList());
  }

  Widget editCertificate(Size size, bool isLandscape) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Stack(
          children: [
            Image.asset('assets/c/$index.jpg'),
            Positioned(
              top: isLandscape ? size.height * .55 : size.height * .135,
              left: isLandscape ? size.width * .2 : size.width * .16,
              child: Text('Change Text'),
            ),
            Positioned(
              top: isLandscape ? size.height * .6 : size.height * .16,
              left: isLandscape ? size.width * .2 : size.width * .16,
              child: SvgPicture.asset('assets/rect.svg',
                  width: isLandscape ? size.width * .55 : size.height * .3),
            ),
            Positioned(
              top: isLandscape ? size.height * .68 : size.height * .15,
              left: isLandscape ? size.width * .24 : size.width * .2,
              child: Container(
                width: size.width * .34,
                child: TextField(
                  style: TextStyle(
                    color: dataController.dataModel.value.textColor,
                    fontFamily: dataController.dataModel.value.fontFamily,
                  ),
                  onChanged: (val) {
                    dataController.dataModel.value.name = val;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(
      String hintText, String lable, Size size, bool isLandscape, context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: size.height * .01),
          Container(
            width: isLandscape ? size.width * .5 : size.width * .7,
            height: isLandscape ? size.height * .1 : size.height * .070,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 0, color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 0, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
