import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

///TODO : Complete all design with responsive sizes

class EditAndSave extends StatefulWidget {
  final int index;
  EditAndSave({this.index});
  @override
  _EditAndSaveState createState() => _EditAndSaveState();
}

class _EditAndSaveState extends State<EditAndSave> {
  // ignore: non_constant_identifier_names
  var UNIVERSITY_NAME = "eg: Suez Canal University...";
  // ignore: non_constant_identifier_names
  var DSC_NAME = "DSC Name: ";
  // ignore: non_constant_identifier_names
  var AWARD = "eg: Awarded for attending flutter session";
  // ignore: non_constant_identifier_names
  var DESCRIPTION = "Description";
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
            textField(AWARD, DESCRIPTION, size, isLandscape)
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
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Text(
              lable,
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
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
          ),
        ],
      ),
    );
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
              top: isLandscape ? size.height * .6 : size.height * .15,
              left: isLandscape ? size.width * .24 : size.width * .2,
              child: Container(width: size.width * .34, child: TextField()),
            ),
          ],
        ),
      ),
    );
  }
}
