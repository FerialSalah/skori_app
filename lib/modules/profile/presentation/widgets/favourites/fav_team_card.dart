import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/widgets/button/favorite_button.dart';

import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/follow_button.dart';
import '../../../../../core/widgets/main_text.dart';



class FavTeamCard extends StatelessWidget {
  final int id;
  final String name;
  final String logo;
  final String country;
  final String countryFlag;
  final bool isFav;
  final bool isFollow;
  final bool type;
  const FavTeamCard({Key? key, required this.name,required this.id ,required this.country, required this.countryFlag, required this.logo, required this.isFav, required this.isFollow, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      height: 100.h,
      color: ColorApp.white,
      child:Row(
        children: [
          type==true?Align(
              alignment: Alignment.topCenter,
              child: FavoriteButton(isFavorite: isFav,id: id,type: 'team',)):SizedBox(),
          Image.network(logo,width: 40.w,height: 70.h,),
          SizedBox(width: 15.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150.w,
                  child: MainText(text: name,font: 14,family: TextFontApp.semiBoldFont,)),
              SizedBox(height: 10,),
              Row(

                children: [
                  // Image.network(countryFlag,height: 14.h,width: 20.w,),
                  SizedBox(width: 5,),
                  MainText(text: country,font:12 ,family: TextFontApp.regularFont,color: ColorApp.hintGray,),
                ],
              ),
            ],
          ),
          Spacer(),

          type==true?SizedBox(): FollowButton(id: id, type: "team", color:  ColorApp.yellow,isFollow: isFollow,)

        ],
      ),
    );
  }
}
