import 'package:flutter/material.dart';

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
    final size = MediaQuery.of(context).size;
    final isLandescape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      width: double.infinity,
      height: isLandescape ? size.height * .8 : size.height * 4,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: fontSize.toDouble(),
            fontFamily: fontFamily,
            color: color,
          ),
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/c/$index.jpg',
        ),
      )),
    );
  }
}
