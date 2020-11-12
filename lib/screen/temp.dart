import 'dart:ffi';
import 'dart:typed_data';
import 'package:certificate_dsc_app/controller/controller.dart';
import 'package:certificate_dsc_app/widgets/convertion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';
import '../main.dart';
import 'package:get/get.dart';
import 'package:save_in_gallery/save_in_gallery.dart';
import 'package:certificate_dsc_app/widgets/my_temp.dart';
import 'package:certificate_dsc_app/widgets/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuildTemp extends StatefulWidget {
  final String name, fontFamily;
  final num fontSize;
  final Color color;
  final int index;
  BuildTemp(
      {@required this.fontFamily,
      @required this.name,
      @required this.fontSize,
      this.color = Colors.black,
      this.index});

  @override
  _BuildTempState createState() => _BuildTempState();
}

class _BuildTempState extends State<BuildTemp> {
  final _imageSaver = ImageSaver();
  GlobalKey key1;
  Uint8List bytes;
  var id;

  handleSaveImage() async {
    final Uint8List bytes1 = await Utils.capture(key1);
    setState(() {
      this.bytes = bytes1;
    });
    final result = await _imageSaver.saveImage(
        imageBytes: bytes1,
        directoryName: 'DSC Certificate',
        imageName: '${widget.name}\'s Certificate_$id');
    print(result);
    result
        ? toast('Image Saved.', Colors.black, Colors.white)
        : toast('Failed. Check your Connection', Colors.black, Colors.white);
  }

  toast(msg, backColor, textColor) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backColor,
        textColor: textColor,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    id = Uuid().v4();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: text,
      ),
      body: Center(
        child: WidgetToImage(
          builder: (key) {
            this.key1 = key;
            return MyTemp(
              name: widget.name,
              fontFamily: widget.fontFamily,
              fontSize: widget.fontSize,
              color: widget.color,
              index: widget.index,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          toast('Waiting', Colors.black, Colors.white);
          await handleSaveImage();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
