import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/search/presentation/screens/search_screen.dart';
import '../../constant/app_assets.dart';
import '../../routes/navigator_push.dart';
import '../../theme/color_app.dart';
import '../../theme/textFont_app.dart';
import '../main_text.dart';

class AppBars {
  static appBarTitle({String? title, double? elevation,Color? color,bool? back,bool? search,VoidCallback? onBack}) =>
      AppBar(
        elevation: elevation ?? 0,
        centerTitle: true,
        shadowColor: ColorApp.borderGray,
        backgroundColor:color?? Colors.white,
        title: MainText(
          text: title??" ",
          family: TextFontApp.extraBoldFont,
          font: 15,
        ),
        leading: back==false?SizedBox(): GestureDetector(
          onTap:onBack??(){
            RouteManager.pop();
          },
          child: Icon(
                Icons.arrow_back,
                color: ColorApp.black,
              ),
        ),
        actions: [
          search==false?SizedBox():Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
                onTap: (){
                  RouteManager.navigateTo(SearchScreen());
                },
                child: Image.asset(AppIcons.search,height: 22.h,width: 22.w,)),
          ),

        ],
      );

  static appBarLogo({double? elevation,Color? color,bool? back}) =>
      AppBar(
        elevation: elevation ?? 0,
        centerTitle: true,
        shadowColor: ColorApp.borderGray,
        backgroundColor:color?? Colors.white,
        title:Image.asset(AppImages.logo,height: 30,width: 70,),
        leading: back==false?SizedBox(): GestureDetector(
          onTap: (){
            RouteManager.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorApp.black,
          ),
        ),
        actions: [
          // GestureDetector(
          //   onTap: (){
          //
          //   },
          //   child: Image.asset(ProfileIcons.favorite,height: 24.h,width: 24.w,),
          // ),
          // SizedBox(width: 15.w,),
          // Image.asset(ProfileIcons.edit,height: 20.h,width: 20.w,),
          // SizedBox(width: 20.w,),
        ],

      );

  static appBarWithFilter({String? title,VoidCallback? onTap})=>AppBar(
    elevation: 0,
    centerTitle: true,
    shadowColor: ColorApp.borderGray,
    backgroundColor: Colors.white,
    title: MainText(
      text: title??" ",
      family: TextFontApp.extraBoldFont,
      font: 15,
    ),
    actions: [
     Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: GestureDetector(
          onTap: onTap,
            child: Image.asset(AppIcons.filter,height: 20.h,width: 20.w,)),
      ),

    ],
  );
}
