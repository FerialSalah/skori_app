import 'package:flutter/material.dart';

import '../theme/color_app.dart';


class MainText extends StatelessWidget {
  final String? text;
  final String? family;
  final double? font;
  final double? height;
  final double? hor;
  final double? ver;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? center;
  final bool? line;

  const MainText(
      {Key? key,
      this.text,
      this.font,
      this.overflow,
      this.maxLines,
      this.fontWeight,
      this.color,
      this.family,
      this.center, this.line, this.height, this.hor, this.ver})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:hor??0 ,vertical: ver??0),
      child: Text(text!,
          textAlign: center == true ? TextAlign.center : TextAlign.start,
          maxLines: maxLines,
          style: TextStyle(
              overflow: overflow,
              fontWeight: fontWeight,
              color: color ?? ColorApp.black,
              height: height??1.1,
              decoration:line==null?TextDecoration.none: TextDecoration.underline,
              fontFamily:family,
              fontSize: font ?? 18)),
    );
  }
}
