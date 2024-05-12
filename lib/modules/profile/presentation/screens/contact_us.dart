import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/hud_loader.dart';
import 'package:skori/core/widgets/snack_bar.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/profile/presentation/bloc/contact_us/bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/contact_us/event.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/setting/setting_cubit.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/validation/validations.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/main_text.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final contactUsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(
          title: LocaleKeys.contactUs.tr(), search: false),
      body: BlocConsumer<ContactUsBloc, BaseState>(
        listener: (context, state) {
          if (state is ErrorState) {
            showSnackBar(state.msg!);
          } else if (state is OfflineState) {
            showSnackBar(state.msg!);
          } else if (state is DoneState) {
            showSnackBar(state.msg!);
            nameController.clear();
            emailController.clear();
            messageController.clear();
          }
        },
        builder: (context, state) {
          return LoaderHud(
            isCall: state is LoadingState ? true : false,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              color: ColorApp.white,
              child: Form(
                key: contactUsKey,
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  children: [
                    CustomTextField(
                      hint: "Ex:omar",
                      controller: nameController,
                      valid: Validations.validateField,
                      dIcon: AuthIcons.name,
                      upperText: LocaleKeys.name.tr(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hint: "Ex:info@azraqna.com",
                      controller: emailController,
                      valid: Validations.validateEmail,
                      dIcon: AuthIcons.mail,
                      upperText: LocaleKeys.emailAddress.tr(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hint: LocaleKeys.message.tr(),
                      valid: Validations.validateField,
                      controller: messageController,
                      upperText: LocaleKeys.message.tr(),
                      line: 5,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    AppButton(
                      title: LocaleKeys.save.tr(),
                      height: 50,
                      onPressed: () {
                        if (contactUsKey.currentState!.validate()) {
                          BlocProvider.of<ContactUsBloc>(context).add(
                              ContactUsCall(
                                  name: nameController.text,
                                  email: emailController.text,
                                  message: messageController.text));
                        } else {
                          return;
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: MainText(
                          text: LocaleKeys.followUs.tr(),
                          font: 16.sp,
                          color: ColorApp.black,
                          family: TextFontApp.mediumFont,
                        ),
                      ),
                    ),
                    BlocBuilder<SettingCubit, BaseState>(
                      builder: (context, state) {
                        final setting = SettingCubit.of(context);
                        return state is LoadingState?SizedBox():Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _socialMedia(ProfileIcons.insta,
                                  setting.settingModel!.contacts!.instagram??""),
                              _socialMedia(ProfileIcons.facebook,
                                  setting.settingModel!.contacts!.facebook??""),
                              _socialMedia(ProfileIcons.twitter,
                                  setting.settingModel!.contacts!.twitter??""),
                              // _socialMedia(ProfileIcons.linkedin,setting.settingModel!.contacts!.),
                            ],
                          ),
                        );
                      },
                    ),
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
Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Widget _socialMedia(String image, String link) {
  return GestureDetector(
    onTap: () {
      _launchUrl(Uri.parse(link));
    },
    child: Container(
        padding: EdgeInsets.all(12),
        height: 40.h,
        width: 40.w,
        color: ColorApp.borderGray.withOpacity(.09),
        child: Image.asset(
          image,
        )),
  );
}
