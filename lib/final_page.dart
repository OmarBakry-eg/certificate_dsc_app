import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class EditAndSave extends StatefulWidget {
  final int index;
  EditAndSave({this.index});
  @override
  _EditAndSaveState createState() => _EditAndSaveState();
}

class _EditAndSaveState extends State<EditAndSave> {
  // ignore: non_constant_identifier_names
  final UNIVERSITY_NAME = "eg: Suez Canal University...";
  // ignore: non_constant_identifier_names
  final DSC_NAME = "DSC Name: ";
  // ignore: non_constant_identifier_names
  final AWARD = "eg: Awarded for attending flutter session";
  // ignore: non_constant_identifier_names
  final DESCRIPTION = "Description: ";

  // ignore: non_constant_identifier_names
  final FONTS = "Fonts: ";

  // ignore: non_constant_identifier_names
  final FONT_SIZE = "Font Size: ";

  List<Color> colorsList = [
    Colors.white,
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.deepPurpleAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: text,
        actions: [
          IconButton(
            icon: Icon(
              Icons.done,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              print('Done');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            editCertificate(size, isLandscape),
            textField(UNIVERSITY_NAME, DSC_NAME, size, isLandscape),
            textField(AWARD, DESCRIPTION, size, isLandscape),
            selectFont(isLandscape, size, FONTS),
            fontSize(isLandscape, size, FONT_SIZE),
            selectColor("Colors :", size, isLandscape)
          ],
        ),
      ),
    );
  }

  Widget textField(String hintText, String lable, Size size, bool isLandscape) {
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

  Widget selectFont(bool isLandscape, Size size, String lable) {
    int dropDownIndex = 1;
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
                value: dropDownIndex,
                items: [
                  DropdownMenuItem(
                    child: Text('Open Sans'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Times Roman'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Sans serif'),
                    value: 3,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    dropDownIndex = value;
                  });
                },
              ))
        ],
      ),
    );
  }

  Widget fontSize(bool isLandscape, Size size, String lable) {
    int dropDownIndex = 1;
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
                value: dropDownIndex,
                items: [
                  DropdownMenuItem(
                    child: Text('14 px'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('20 px'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('24 px'),
                    value: 3,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    dropDownIndex = value;
                  });
                },
              ))
        ],
      ),
    );
  }

  Widget selectColor(String lable, Size size, bool isLandscape) {
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
                Container(
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                    width: isLandscape ? size.width * .13 : size.width * .16,
                    height: isLandscape ? size.height * .2 : size.height * .08,
                    decoration: BoxDecoration(
                        border: Border.all(width: .2),
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                            colors: [Colors.purpleAccent, Colors.blueAccent]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget colors(Size size, bool isLandscape) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: colorsList
            .map(
              (color) => Container(
                  width: isLandscape ? size.width * .13 : size.width * .16,
                  height: isLandscape ? size.height * .2 : size.height * .08,
                  decoration: BoxDecoration(
                    border: Border.all(width: .2),
                    shape: BoxShape.circle,
                    color: color,
                  )),
            )
            .toList());
  }

  Widget editCertificate(Size size, bool isLandscape) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Stack(
          children: [
            Image.asset('assets/c/${widget.index}.jpg'),
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
              child: Container(width: size.width * .34, child: TextField()),
            ),
          ],
        ),
      ),
    );
  }
}
