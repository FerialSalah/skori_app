import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/modules/nav_bar/presentation/screens/nav_bar.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../generated/locale_keys.g.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late bool Ar;
  late bool En;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (RouteManager.currentContext.locale.languageCode == 'en') {
      setState(() {
        En = true;
        Ar=false;
        DioHelper.lang="en";
      });
    } else {
      Ar = true;
      En=false;
      DioHelper.lang="ar";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(title: LocaleKeys.language.tr(),search: false,),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 17,vertical: 27),
        color: ColorApp.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  context.setLocale(Locale('ar'));
                  DioHelper.lang = context.locale.languageCode;
                  RouteManager.navigateAndPopAll(NavBarScreen());
                });
                recallData();
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Image.asset(ProfileIcons.ar,height: 18.h,width: 27.w,),
                    SizedBox(width: 12.w,),
                    MainText(text: "اللغة العربية",font: 14,family: TextFontApp.semiBoldFont,)
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.h),
              child: Divider(),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  context.setLocale(Locale('en'));
                  DioHelper.lang = context.locale.languageCode;
                  RouteManager.navigateAndPopAll(NavBarScreen());
                });
                recallData();
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Image.asset(ProfileIcons.en,height: 18.h,width: 27.w,),
                    SizedBox(width: 12.w,),
                    MainText(text: "English",font: 14,family: TextFontApp.semiBoldFont,)
                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
