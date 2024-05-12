import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/hud_loader.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/profile/presentation/bloc/change_password/bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/change_password/event.dart';
import 'package:skori/modules/profile/presentation/bloc/change_password/state.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/validation/validations.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/dialog_app/custom_dialog.dart';
import '../../../../core/widgets/dialog_app/error_dialog.dart';
import '../../../../core/widgets/snack_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final changePasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(
          title: LocaleKeys.changePassword.tr(), search: false),
      body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordOffline) {
            showSnackBar(state.msg);
          } else if (state is ChangePasswordSuccess) {
            showSnackBar("password update successful");
            RouteManager.pop();
          } else if (state is ChangePasswordField) {
            CustomDialog(theDialog: ErrorDialog(msg:state.msg ,),dismiss: true);
            // showSnackBar(state.msg);
          }
        },
        builder: (context, state) {
          return LoaderHud(
            isCall: state is ChangePasswordLoading ? true : false,
            child: Form(
              key: changePasswordKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
                children: [
                  CustomTextField(
                    hint: "*******",
                    dIcon: AuthIcons.code,
                    icon: "p",
                    valid: Validations.validatePassword,
                    controller: oldPasswordController,
                    upperText: LocaleKeys.oldPass.tr(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    hint: "*******",
                    controller: passwordController,
                    valid: Validations.validatePassword,
                    errors: state is ChangePasswordValidate ? state.errors : null,
                    errorKey: "new_password",
                    dIcon: AuthIcons.code,
                    icon: "p",
                    upperText: LocaleKeys.password.tr(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    hint: "*******",
                    controller: confirmPasswordController,
                    valid: (v) {
                      return Validations.validateConfirmPassword(
                          v, passwordController.text);
                    },
                    dIcon: AuthIcons.code,
                    icon: "p",
                    upperText: LocaleKeys.confirmPassword.tr(),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppButton(title: LocaleKeys.save.tr(), height: 50,onPressed: (){
                    if(changePasswordKey.currentState!.validate()){
                      BlocProvider.of<ChangePasswordBloc>(context)
                        ..add(ChangePasswordCall(
                            oldPassword: oldPasswordController.text,
                            newPassword: passwordController.text,
                            newPasswordConfirm: confirmPasswordController.text,

                        ));
                    }else{
                      return;
                    }
                  },)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
