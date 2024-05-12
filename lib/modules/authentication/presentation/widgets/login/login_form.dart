import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/validation/validations.dart';
import '../../../../../core/widgets/customTextFeild.dart';
import '../../../../../generated/locale_keys.g.dart';


class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({Key? key, required this.emailController, required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: "Ex:info@azraqna.com",
          dIcon: AuthIcons.mail,
          controller: emailController,
          upperText: LocaleKeys.emailAddress.tr(),
          valid: Validations.validateEmail,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          hint: "*******",
          dIcon: AuthIcons.pass,
          icon: "p",
          controller: passwordController,
          upperText: LocaleKeys.password.tr(),
          valid: Validations.validatePassword,
        ),
      ],
    );
  }
}
