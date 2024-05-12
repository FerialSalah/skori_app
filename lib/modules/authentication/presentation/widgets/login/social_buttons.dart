import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/button_app.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';


class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 25.h),
            child: MainText(
              text: LocaleKeys.orLoginThrough.tr(),
              font: 16,

              color: ColorApp.black,
              family: TextFontApp.mediumFont,
            ),
          ),
        ),
        AppButton(title: LocaleKeys.login.tr(),height: 50.h,color: ColorApp.blue,),
        AppButton(title: LocaleKeys.login.tr(),ver:10.h,height: 50.h,color: ColorApp.black,),
        AppButton(title: LocaleKeys.login.tr(),height: 50.h,color: ColorApp.red,),
      ],
    );
  }
}
