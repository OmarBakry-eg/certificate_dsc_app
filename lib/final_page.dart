import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Stack(
                children: [
                  Image.asset('assets/c/${widget.index}.jpg'),
                  Positioned(
                    top: 115,
                    left: 75,
                    child: Text('Change Text'),
                  ),
                  Positioned(
                    top: 135,
                    left: 91,
                    child: SvgPicture.asset('assets/rect.svg'),
                  ),
                  Positioned(
                    top: 125,
                    left: 93,
                    child: Container(width: 200, child: TextField()),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: Text(
                    'DSC Name :',
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
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 250,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'eg: Suez Canal University',
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
          ),
        ],
      ),
    );
  }
}
