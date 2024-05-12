import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/constants.dart';
import 'package:skori/core/widgets/button/follow_button.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/routes/navigator_push.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/button_app.dart';
import '../../../../../core/widgets/button/favorite_button.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';



class FavPlayerCard extends StatelessWidget {
  final int id;
  final String name;
  final String avatar;
  final String position;
  final String number;
  final bool isFav;
  final bool isFollow;
  final bool type;
  const FavPlayerCard({Key? key, required this.name,required this.id ,required this.avatar, required this.position, required this.number, required this.isFav, required this.isFollow, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: Stack(
        children: [

          Container(
            height: 115.h,
            color: ColorApp.white,
            child:Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 115.h,
                      width: 130.w,
                      // color: Colors.red,
                      child: CachedImageNetwork(
                        image: avatar,
                      ),
                    ),
                    type==false?SizedBox():Padding(
                        padding: EdgeInsets.all(12),
                        child: FavoriteButton(isFavorite: isFav,id: id,type: "player",))
                  ],
                ),

                SizedBox(width: 15.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 200,
                        child: MainText(text: name,font: 14,family: TextFontApp.boldFont,)),

                    MainText(text: position,font:13 ,family: TextFontApp.regularFont,color: ColorApp.hintGray,),
                    type==true?SizedBox():FollowButton(id: id, type: "player", color:  ColorApp.yellow,isFollow: isFollow,)

                  ],
                ),



              ],
            ),
          ),
         Positioned(
             bottom: 1,
             left:  RouteManager.currentContext.locale.languageCode == 'en'?45:null,
             right:  RouteManager.currentContext.locale.languageCode == 'en'?null:45,
             child: Stack(
               children: [
                 Image.asset(AppImages.shirt,height: 30.h,width: 36.w,color: ColorApp.yellow,),
                 Positioned(
                     top: 10.h,
                     left: 8.w,
                     child: Container(
                         height: 10.h,
                         width: 20.w,
                         child: Center(
                             child: MainText(text: number,font:12 ,family: TextFontApp.extraBoldFont,color: ColorApp.white,)))),
               ],
             ))

        ],
      ),
    );
  }
}
