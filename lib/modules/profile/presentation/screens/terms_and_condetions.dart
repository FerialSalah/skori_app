import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/cubit/setting/setting_cubit.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/core/widgets/main_text.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../generated/locale_keys.g.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(
          title: LocaleKeys.termsConditions.tr(), search: false),
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

                HtmlWidget(setting.settingModel!.app!.terms!),
              ],
            );
          },
        ),

      ),
    );
  }
}
