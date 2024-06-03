import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/authentication/presentation/screens/login_screen.dart';
import 'package:skori/modules/authentication/presentation/screens/sign_up__screen.dart';

class ShouldSignUp extends StatelessWidget {
  const ShouldSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MainText(text: LocaleKeys.shouldSignUp.tr(),font: 18,family: TextFontApp.boldFont,),
        SizedBox(height: 30,),
        AppButton(title: LocaleKeys.createAcc.tr(),hor: 30,onPressed: (){
          RouteManager.navigateAndPopAll(SignUpScreen());
        },),
        SizedBox(height: 30,),
        AppButton(title: LocaleKeys.login.tr(),hor: 30,onPressed: (){
          RouteManager.navigateAndPopAll(LoginScreen());
        },),

      ],
    );
  }
}
