
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/cubit/gender_cubit.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/validation/validations.dart';
import 'package:skori/modules/authentication/presentation/bloc/sign_up/bloc.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/customTextFeild.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../bloc/sign_up/state.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController birthDateController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  SignUpForm({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.birthDateController,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  void _displayDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendarOnly,

    )
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        // AbsenceRequestCubit.get(context).dateController.text = reformatDate(pickedDate);
        print("Picked Date: "+pickedDate.toString());
        widget.birthDateController.text=pickedDate.toString().substring(0,10);
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hint: "Ex:name",
              dIcon: AuthIcons.name,
              upperText: LocaleKeys.firstName.tr(),
              controller: widget.firstNameController,
              valid: Validations.validateField,
              errors: state is SignUpValidate ? state.errors : null,
              errorKey: "first_name",
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              hint: "Ex:last name",
              dIcon: AuthIcons.name,
              upperText: LocaleKeys.lastName.tr(),
              controller: widget.lastNameController,
              errors: state is SignUpValidate ? state.errors : null,
              errorKey: "last_name",
              valid: Validations.validateField,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              hint: "Ex:info@azraqna.com",
              dIcon: AuthIcons.mail,
              upperText: LocaleKeys.emailAddress.tr(),
              controller: widget.emailController,
              errors: state is SignUpValidate ? state.errors : null,
              errorKey: "email",
              valid: Validations.validateEmail,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              hint: "Ex:05*********",
              dIcon: AuthIcons.phone,
              upperText: "${LocaleKeys.mobileNum.tr()}    (${LocaleKeys.optional.tr()})",
              controller: widget.phoneController,
              valid: Validations.validatePhone,
              errors: state is SignUpValidate ? state.errors : null,
              errorKey: "phone",
              // valid: Validations.validatePhone,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              upperText: "Birth date  (${LocaleKeys.optional.tr()})",
              hint: "Birth date",
              read: true,
              controller: widget.birthDateController,
              // valid: Validations.validateField,
              onTap: (){
                _displayDatePicker();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            MainText(
              text: "${LocaleKeys.gender.tr()}    (${LocaleKeys.optional.tr()})",
              font: 14,
              color: ColorApp.black,
              family: TextFontApp.semiBoldFont,
            ),
            SizedBox(
              height: 5.h,
            ),
            BlocBuilder<GenderCubit, BaseState>(
              builder: (context, state) {
                final cubit = GenderCubit.of(context);
                return Row(
                  children: [
                    Checkbox(
                      value: cubit.male,
                      onChanged: (v) {
                        cubit.selectGender(v!,0);
                      },
                      side: BorderSide(color: ColorApp.red, width: .7),
                      activeColor: ColorApp.red,
                    ),
                    // SizedBox(
                    //   width: 8.w,
                    // ),
                    MainText(
                      text: LocaleKeys.maleGender.tr(),
                      font: 14.sp,
                      color: ColorApp.black,
                      family: TextFontApp.semiBoldFont,
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Checkbox(
                    value: cubit.female,
                      onChanged: (v) {
                        cubit.selectGender(v!,1);
                      },
                      side: BorderSide(color: ColorApp.red, width: .7),
                      activeColor: ColorApp.red,
                    ),
                    // SizedBox(
                    //   width: 8.w,
                    // ),
                    MainText(
                      text: LocaleKeys.femaleGender.tr(),
                      font: 14.sp,
                      color: ColorApp.black,
                      family: TextFontApp.semiBoldFont,
                    ),
                  ],
                );
              },
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            // DropDownTextField(
            //   title: LocaleKeys.type.tr(),
            //   hint: "fan",
            //   icon: AuthIcons.fan,
            //   isModel: false,
            //   items: [],
            //   staticItems:["1","2","3"],
            //   paddingVer: 5,
            //   onChanged: (val) {
            //
            //   },
            //  ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              hint: "*******",
              dIcon: AuthIcons.code,
              icon: "p",
              upperText: LocaleKeys.password.tr(),
              controller: widget.passwordController,
              valid: Validations.validatePassword,
              errors: state is SignUpValidate ? state.errors : null,
              errorKey: "password",
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              hint: "*******",
              dIcon: AuthIcons.code,
              icon: "p",
              upperText: LocaleKeys.confirmPassword.tr(),
              controller: widget.confirmPasswordController,
              errors: state is SignUpValidate ? state.errors : null,
              errorKey: "password_confirmation",
              valid: (v) {
                return Validations.validateConfirmPassword(
                    v, widget.passwordController.text);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }
}
