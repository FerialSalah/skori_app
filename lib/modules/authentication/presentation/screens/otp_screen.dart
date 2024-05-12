import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/authentication/presentation/screens/reset_password_screen.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/button/button_app.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController phoneController= TextEditingController();
  final forgetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBars.appBarTitle(search: false),
      body: Form(
        key: forgetPasswordKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 0),
          children: [
            SizedBox(height: 135.h,),
            Image.asset(AppImages.otpPass,height: 80.h,width: 75.w,),
            SizedBox(height: 30.h,),
            Center(
              child: MainText(
                text: LocaleKeys.resetPassword.tr(),
                font: 20,
                center: true,
                color: ColorApp.black,
                family: TextFontApp.extraBoldFont,
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: Text.rich(
                    TextSpan(children: [
                   TextSpan(text: LocaleKeys.otpDesc.tr(),
                       style: TextStyle(
                     fontSize: 16,color: ColorApp.hintGray,
                     fontFamily: TextFontApp.regularFont
                   )),
                   TextSpan(text: "  omar@gmail.com",style: TextStyle(
                       fontSize: 16,color: ColorApp.red,
                       fontFamily: TextFontApp.regularFont
                   )),
                ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 50.h,),
            CustomTextField(
              hint: LocaleKeys.codeHint.tr(),
              dIcon: AuthIcons.code,
              upperText: LocaleKeys.code.tr(),
            ),
            SizedBox(height: 25.h,),
            AppButton(title: LocaleKeys.resetNow.tr(), height: 50.h,onPressed: (){
               RouteManager.navigateTo(ResetPasswordScreen());
            },),

          ],
        ),
      ),
    );
  }
}
