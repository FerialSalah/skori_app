import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../constant/constants.dart';
import '../../theme/color_app.dart';
import '../../theme/textFont_app.dart';

class ErrorDialog extends StatelessWidget {
  final String msg;

  const ErrorDialog({Key? key,required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3)),
      content:  Container(
         height:250.h,
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child:Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(getLottie("error"),
                height: 100,width: 100,fit: BoxFit.cover),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 20),
          child: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
                fontFamily: TextFontApp.mediumFont,
                fontSize: 18,
                color: ColorApp.red,)
          ),
        ),
          ],
        ) ,),
    );

  }
}


