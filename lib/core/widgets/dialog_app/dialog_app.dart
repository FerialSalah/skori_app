import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/authentication/presentation/screens/login_screen.dart';
import '../../theme/color_app.dart';
import '../../theme/textFont_app.dart';

class SuccessDialog extends StatefulWidget {
  final String msg;

  const SuccessDialog({Key? key,required this.msg}) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
          () => RouteManager.navigateAndPopAll(LoginScreen()),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3)),
      content:  Container(
        height:220.h,
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(getLottie("error"),
            //     height: 100,width: 100,fit: BoxFit.cover),
            Image.asset(AppImages.success,height: 70.h,width: 70.w,),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 20),
              child: Text(
                  widget.msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: TextFontApp.mediumFont,
                    fontSize: 15,
                    color: ColorApp.black,)
              ),
            ),
          ],
        ) ,),
    );

  }
}


