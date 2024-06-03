import 'package:flutter/material.dart';

import '../../theme/color_app.dart';
import '../../theme/textFont_app.dart';


class BorderButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String? image;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? hor;
  final double? ver;
  final double? verText;
  final double? horText;
  final double? font;
  BorderButton({ this.onPressed,required this.title,
    this.color, this.width, this.hor, this.height, this.font, this.textColor, this.borderColor, this.ver,  this.image, this.verText, this.horText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: hor==null?0:hor!,vertical: ver==null?0:ver!),
        padding: EdgeInsets.symmetric(vertical:verText??11 ,horizontal: horText??0),
        height:height,
        width: width,
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color:borderColor?? ColorApp.primary,width: 1),
          // border: Border.all(width: 1,
          //     color:borderColor!)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           image==null?SizedBox(): Image.asset(image!,height: 20,),
            SizedBox(width: 5,),
            Text(title,
              style: TextStyle(
                  color:textColor??ColorApp.primary,
                  fontFamily: TextFontApp.regularFont,
                  fontSize:font??16),),
          ],
        ),
      ),
    );
  }
}
