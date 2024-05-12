import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/button/button_app.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../modules/profile/presentation/screens/packages.dart';
import '../../routes/navigator_push.dart';
class ChangePackageDialog extends StatelessWidget {
  const ChangePackageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3)),
      content:  Container(
        height:350.h,
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(getLottie("error"),
            //     height: 100,width: 100,fit: BoxFit.cover),
            Image.asset(AppIcons.confirm,height: 70.h,width: 70.w,),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 20),
              child: Text(
                  LocaleKeys.changePackage.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: TextFontApp.boldFont,
                    fontSize: 15,
                    color: ColorApp.black,)
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5),
              child: Text(
                  LocaleKeys.confirmChangePackage.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: TextFontApp.mediumFont,
                    fontSize: 15,
                    color: ColorApp.hintGray,)
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                children: [
                  Expanded(child: AppButton(title: LocaleKeys.sure.tr(),
                    onPressed: (){
                      RouteManager.navigateTo(PackagesScreen());

                    },)),
                  SizedBox(width: 15,),
                  Expanded(child: AppButton(title: LocaleKeys.cancel.tr(),color: ColorApp.borderGray,
                    textColor: ColorApp.primary,
                    onPressed: (){
                      RouteManager.pop(context);
                    },

                  )),

                ],),
            ),
          ],
        ) ,),
    );
  }
}
