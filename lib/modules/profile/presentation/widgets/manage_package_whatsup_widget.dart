import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/setting/setting_cubit.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/button_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';
class ManagePackagesWhatsAppWidget extends StatelessWidget {
  const ManagePackagesWhatsAppWidget({Key? key}) : super(key: key);
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
              child: MainText(
                text: LocaleKeys.packageWhatsUp.tr(),
                font: 16.sp,
                center: true,
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
                child: AppButton(
                  title: LocaleKeys.messageUs.tr(),
                  height: 50,
                  icon:ProfileIcons.whatsapp  ,
                  icon_color: ColorApp.white,
                  onPressed: () {

                    print("setting.settingModel!.contacts!.subscribtionPhone: ${setting.settingModel!.contacts!.subscribtionPhone}");
                    String whatsupPhone=setting.settingModel!.contacts!.subscribtionPhone!;

                    String url="https://wa.me/$whatsupPhone";
                    print(url);
                    _launchUrl(Uri.parse(url));
                  },
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
