import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/hud_loader.dart';
import 'package:skori/core/widgets/snack_bar.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/edit_profile/edit_profile_event.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/gender_cubit.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/validation/validations.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/main_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstNameController =
  TextEditingController(text: AppStorage.getUserModel.firstName);
  TextEditingController lastNameController =
  TextEditingController(text: AppStorage.getUserModel.lastName);
  TextEditingController phoneController =
  TextEditingController(text: AppStorage.getUserModel.phone);
  TextEditingController emailController =
  TextEditingController(text: AppStorage.getUserModel.email);
  final editProfileKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(
          title: LocaleKeys.editProfile.tr(), search: false),
      body: BlocConsumer<EditProfileBloc, BaseState>(
        listener: (_, state) {
          if (state is SuccessState) {
            showSnackBar("Edit Success");
          } else if(state is ErrorState){
            showSnackBar("Edit Fail try again");
          }
        },
        builder: (context, state) {
          return LoaderHud(
            isCall: state is LoadingState ? true : false,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              color: ColorApp.white,
              child: Form(
                key: editProfileKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  children: [
                    CustomTextField(
                      hint: "Ex:name",
                      controller: firstNameController,
                      dIcon: AuthIcons.name,
                      upperText: LocaleKeys.firstName.tr(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hint: "Ex:last name",
                      controller: lastNameController,
                      dIcon: AuthIcons.name,
                      upperText: LocaleKeys.lastName.tr(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hint: "Ex:info@azraqna.com",
                      controller: emailController,
                      dIcon: AuthIcons.mail,
                      upperText: LocaleKeys.emailAddress.tr(),
                      valid: Validations.validateEmail,

                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hint: "Ex:05*********",
                      controller: phoneController,
                      dIcon: AuthIcons.phone,
                      upperText: LocaleKeys.mobileNum.tr(),
                      valid:Validations.validatePhone ,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MainText(
                      text: LocaleKeys.gender.tr(),
                      font: 14,
                      color: ColorApp.black,
                      family: TextFontApp.semiBoldFont,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BlocBuilder<GenderCubit, BaseState>(
                      builder: (context, state) {
                        final cubit = GenderCubit.of(context);
                        return Row(
                          children: [
                            Checkbox(
                              value:  cubit.male,
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
                              value:  cubit.female,
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
                    SizedBox(
                      height: 40.h,
                    ),
                   AppButton(
                  title: LocaleKeys.save.tr(),
                  height: 50,
                  onPressed: () {
    if(editProfileKey.currentState!.validate()){
      print("trueeeeee");
      // BlocProvider.of<EditProfileBloc>(context)
      //   ..add(EditProfileDate(
      //       firstName: firstNameController.text,
      //       lastName: lastNameController.text,
      //       phone: phoneController.text,
      //       email: emailController.text,
      //       gender: GenderCubit
      //           .of(context)
      //           .theGender));
    }

                  },
                )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
