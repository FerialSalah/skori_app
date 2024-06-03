import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../bloc/delete_account/delete_account_cubit.dart';


class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r)),
      content:  Container(
        height:MediaQuery.of(context).size.height*.4,
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(getLottie("error"),
                height: 120,width: 120,fit: BoxFit.cover),
            MainText(
              center: true,
              text:  context.locale == Locale('en', 'US')?
              "Are you sure you want to Delete Account?":
              "هل انت متأكد انك تريد حذف الحساب؟",
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  width: 115.w,
                  onPressed: (){
                    RouteManager.pop();
                    },
                  title: "cancel",
                  hor: 0,
                  color: ColorApp.red,
                  textColor: ColorApp.white,
                ),
                SizedBox(width: 20,),
                AppButton(
                  hor: 0,
                  width: 115.w,
                  color: ColorApp.green,
                  onPressed: (){
                    DeleteAccountCubit.of(context).deleteAccount();
                  }, title: "yes",

                ),

              ],
            ),
          ],
        ) ,),
    );
  }
}
