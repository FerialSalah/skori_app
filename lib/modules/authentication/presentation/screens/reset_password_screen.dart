import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/validation/validations.dart';
import 'package:skori/core/widgets/dialog_app/dialog_app.dart';
import 'package:skori/core/widgets/hud_loader.dart';
import 'package:skori/modules/authentication/presentation/bloc/reset_password/reset_password_bloc.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/button/button_app.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/dialog_app/custom_dialog.dart';
import '../../../../core/widgets/dialog_app/error_dialog.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/reset_password/reset_password_event.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final resetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBars.appBarTitle(search: false),
      body: BlocConsumer<ResetPasswordBloc, BaseState>(
        listener: (context, state) {
          if (state is OfflineState) {
            showSnackBar(state.msg!);
          } else if (state is SuccessState) {
            CustomDialog(theDialog: SuccessDialog(msg: "Password Changed Successfully"),dismiss: false,);
          } else if (state is ErrorState) {
            CustomDialog(theDialog: ErrorDialog(msg:state.msg! ,),dismiss: true);
          }
        },
        builder: (context, state) {
          return LoaderHud(
            isCall: state is LoadingState?true:false,
            child: Form(
              key: resetPasswordKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
                children: [
                  SizedBox(height: 80.h,),
                  Image.asset(AppImages.resetPass, height: 80.h, width: 75.w,),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: MainText(
                          text: LocaleKeys.resetDesc.tr(),
                          font: 16,
                          center: true,
                          color: ColorApp.hintGray,
                          family: TextFontApp.regularFont),
                    ),
                  ),
                  SizedBox(height: 50.h,),
                  CustomTextField(
                    hint: LocaleKeys.code.tr(),
                    dIcon: AuthIcons.code,
                    controller: codeController,
                    valid: Validations.validateField,
                    upperText: LocaleKeys.code.tr(),
                    errors: state is ValidateState ? state.errors : null,
                    errorKey: "token",
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextField(
                    hint: "*******",
                    dIcon: AuthIcons.code,
                    icon: "p",
                    controller: passwordController,
                    valid: Validations.validatePassword,
                    upperText: LocaleKeys.password.tr(),
                    errors: state is ValidateState?state.errors:null,
                    errorKey: "password",
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextField(
                    hint: "*******",
                    dIcon: AuthIcons.code,
                    icon: "p",
                    controller: confirmPasswordController,
                    valid: (v){
                      return  Validations.validateConfirmPassword(v, passwordController.text);
                    },
                    errors: state is ValidateState?state.errors:null,
                    errorKey: "password_confirmation",
                    upperText: LocaleKeys.confirmPassword.tr(),
                  ),
                  SizedBox(height: 25.h,),
                  AppButton(
                    title: LocaleKeys.save.tr(), height: 50.h, onPressed: () {
                      if(resetPasswordKey.currentState!.validate()){
                        BlocProvider.of<ResetPasswordBloc>(context)
                          ..add(SendResetPasswordEvent(resetToken: codeController.text,password: passwordController.text,
                          confirmPassword: confirmPasswordController.text));
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
