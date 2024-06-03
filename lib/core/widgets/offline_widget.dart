import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constant/constants.dart';
import '../theme/color_app.dart';
import 'main_text.dart';
class OfflinePage extends StatelessWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(getLottie("nowifi"),
              height: 100,width: 100,fit: BoxFit.cover),
          SizedBox(height: 20,),
          MainText(
            text: "Please Check your Internet",
            fontWeight: FontWeight.w500,
            font: 16,
            color: ColorApp.black,
          ),


        ],
      ),
    );
  }
}

