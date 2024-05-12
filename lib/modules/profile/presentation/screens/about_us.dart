import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skori/core/constant/app_assets.dart';
import '../../../../core/cubit/setting/setting_cubit.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../generated/locale_keys.g.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(title: LocaleKeys.aboutUs.tr(),search: false),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        color: ColorApp.white,
        child: BlocBuilder<SettingCubit, BaseState>(
          builder: (context, state) {
            final setting = SettingCubit.of(context);
            return state is LoadingState?ColorLoader():ListView(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              children: [
                Image.asset(AppImages.logo, height: 43.h, width: 102.w,),
                SizedBox(height: 35.h,),

                HtmlWidget(setting.settingModel!.app!.about!),
              ],
            );
          },
        ),

      ),

    );
  }
}
