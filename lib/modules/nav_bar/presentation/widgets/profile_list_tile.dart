import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';


class ProfileListTile extends StatelessWidget {
  final String title,icon;
  final String? description;
  final bool? isNotification;
  final Widget? route;
  final VoidCallback? onTap;
  const ProfileListTile({Key? key, required this.title,  this.description, required this.icon, this.isNotification, this.route, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap??(){
        RouteManager.navigateTo(route!);
      },
      child: Container(

        height: 40.h,
        color: Colors.transparent ,
        // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        child: Row(
          children: [
            Image.asset(icon,height: 20.h,width:20.w,color: ColorApp.primary),
            SizedBox(width: 12.w,),
            MainText(text: title,font: 14,family: TextFontApp.semiBoldFont,),
          ],
        ),
      ),
    );


  }
}
