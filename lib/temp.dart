import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';
import 'main.dart';
import 'package:get/get.dart';
import 'package:save_in_gallery/save_in_gallery.dart';

final _imageSaver = ImageSaver();

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
  GlobalKey key1;
  Uint8List bytes1;
  var id;
  @override
  void initState() {
    // TODO: implement initState
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
                index: widget.index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uint8List bytes1 = await Utils.capture(key1);
          setState(() {
            this.bytes1 = bytes1;
          });
          final result = await _imageSaver.saveImage(
              imageBytes: bytes1,
              directoryName: 'DSC Certificate',
              imageName: '${widget.name}\'s Certificate_$id');
          print(result);
          result
              ? Get.snackbar('DONE', 'Image Saved',
                  snackPosition: SnackPosition.BOTTOM)
              : Get.snackbar('Failed', 'Check your connection');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class MyTemp extends StatelessWidget {
  final String name, fontFamily;
  final num fontSize;
  final Color color;
  final index;
  MyTemp(
      {@required this.fontFamily,
      @required this.name,
      @required this.fontSize,
      this.color = Colors.black,
      this.index});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/c/$index.jpg'),
        //TODO: Implement Responsive position depended on fontFamily AND fontSize
        Positioned(
          top: 140,
          left: 130,
          child: Text(
            name,
            style: TextStyle(
                fontSize: fontSize.toDouble(),
                fontFamily: fontFamily,
                color: color),
          ),
        ),
      ],
    );
  }
}

class WidgetToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const WidgetToImage({
    @required this.builder,
    Key key,
  }) : super(key: key);

  @override
  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}

class Utils {
  static Future capture(GlobalKey key) async {
    if (key == null) return null;

    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData.buffer.asUint8List();

    return pngBytes;
  }
}
