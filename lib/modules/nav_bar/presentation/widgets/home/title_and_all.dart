import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/generated/locale_keys.g.dart';

import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/main_text.dart';

class TitleAndAll extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onPressed;
  const TitleAndAll({required this.title,required this.description, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText(text: this.title,font: 16,family: TextFontApp.extraBoldFont,),
              SizedBox(height: 10,),
              MainText(text:this.description,font:12 ,family: TextFontApp.regularFont,
                color: ColorApp.hintGray,)
            ],
          ),
         onPressed==null?SizedBox(): GestureDetector(
              onTap: onPressed,
              child: Text(LocaleKeys.seeAll.tr(),style: TextStyle(decoration: TextDecoration.underline,fontSize: 13,fontFamily: TextFontApp.boldFont),))
        ],
      ),
    );
  }
}
