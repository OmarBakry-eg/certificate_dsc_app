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
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
