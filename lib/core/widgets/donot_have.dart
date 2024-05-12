import 'package:flutter/material.dart';
import '../theme/color_app.dart';
import '../theme/textFont_app.dart';


class DoNotHave extends StatelessWidget {
  final String? text;
  final String? have;
  final bool? ali;
  final VoidCallback? route;
   DoNotHave({ this.text, this.route, this.have,this.ali});
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment:ali==true?MainAxisAlignment.end:MainAxisAlignment.center,
        children: [
          Text( have??" ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: TextFontApp.semiBoldFont,
                color: ColorApp.black,
              )
          ),
          SizedBox(width: 5,),
          GestureDetector(
            onTap:route,
            child: Text(text??" ",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: TextFontApp.semiBoldFont,
                  color:ColorApp.yellow,
                )
            ),
          ),
        ],

    );
  }
}
