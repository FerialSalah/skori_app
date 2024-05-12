import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/widgets/hud_loader.dart';
import 'package:skori/modules/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:skori/modules/authentication/presentation/screens/otp_screen.dart';
import 'package:skori/modules/authentication/presentation/screens/reset_password_screen.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/validation/validations.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/button/button_app.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/forget_password/forget_password_event.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final forgetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBars.appBarTitle(search: false),
      body: BlocConsumer<ForgetPasswordBloc, BaseState>(
        listener: (context, state) {
          if (state is OfflineState) {
            showSnackBar(state.msg!);
          } else if (state is SuccessState) {
            RouteManager.navigateTo(ResetPasswordScreen(

            ));
          } else if (state is ErrorState) {
            showSnackBar(state.msg!);
          }
        },
        builder: (context, state) {
          return LoaderHud(
            isCall:  state is LoadingState?true:false,
            child: Form(
              key: forgetPasswordKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
                children: [
                  SizedBox(height: 135.h,),
                  Image.asset(AppImages.forgetPass, height: 80.h, width: 75.w,),
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
                  Center(
                    child: MainText(
                        text: LocaleKeys.forgetDesc.tr(),
                        font: 16,
                        color: ColorApp.hintGray,
                        family: TextFontApp.regularFont),
                  ),
                  SizedBox(height: 50.h,),
                  CustomTextField(
                    hint: "Ex:info@azraqna.com",
                    errors: state is ValidateState?state.errors:null,
                    errorKey: "email",
                    valid: Validations.validateEmail,
                    controller: emailController,
                    dIcon: AuthIcons.mail,
                    upperText: LocaleKeys.emailAddress.tr(),
                  ),
                  SizedBox(height: 25.h,),
                  AppButton(title: LocaleKeys.resetPassword.tr(),
                    height: 50.h,
                    onPressed: () {
                    if(forgetPasswordKey.currentState!.validate()){
                      BlocProvider.of<ForgetPasswordBloc>(context)
                        ..add(SendForgetPasswordEvent(email: emailController.text,));
                    }else{
                      return;
                    }
                    },),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
