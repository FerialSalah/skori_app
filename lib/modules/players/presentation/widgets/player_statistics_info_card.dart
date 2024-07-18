import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';

import '../../../../core/theme/color_app.dart';
class PlayStatisticInfoCard extends StatelessWidget {
  final String  title;
  final String  value;

  const PlayStatisticInfoCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),

      child: Container(
         width: 167.w,
        height: 104.h,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: ColorApp.borderGray,width: 1),
            color: ColorApp.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainText(text: value,font:value=="premium"?20:36,family: TextFontApp.boldFont,color: ColorApp.darkBlue,),
            SizedBox(height: 15,),
            MainText(text: title,font: 15,family: TextFontApp.regularFont,color: ColorApp.hintGray,),

          ],
        ),
      ),
    );
  }
}
