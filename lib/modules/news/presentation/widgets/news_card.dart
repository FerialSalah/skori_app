import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../core/widgets/main_text.dart';
import '../screens/news_details.dart';

class NewsCart extends StatelessWidget {
 final  NewsEntity newsEntity;
 final bool? isPlayer;
  const NewsCart({Key? key, required this.newsEntity,  this.isPlayer, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RouteManager.navigateTo(
            NewsDetailsScreen(
              newsEntity: newsEntity,
              isPlayer: isPlayer,
        ));

      },
      child: Container(
        height: 150.h,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              height: 140.h,
              width: 130.w,
              // color: Colors.red,
             child:CachedImageNetwork(image: newsEntity.cover,fit: BoxFit.cover,) ,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:15,vertical:10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text: newsEntity.date,
                    color:ColorApp.hintGray,
                    font: 12,
                    family: TextFontApp.regularFont,
                  ),
                  SizedBox(
                    width: 180.w,
                    child: MainText(
                      text: newsEntity.title,
                      maxLines: 2,
                      height: 1.5,
                      overflow: TextOverflow.clip,
                      font: 14,
                      family: TextFontApp.boldFont,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(NewsImages.redUser,width: 14.w,height: 17.h,),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 70.w,
                        child: MainText(
                          text: newsEntity.writerName,
                          color:ColorApp.red,
                          font: 12,
                          overflow: TextOverflow.ellipsis,
                          family: TextFontApp.mediumFont,
                        ),
                      ),

                      newsEntity.playerId==0?SizedBox():Image.asset(NewsImages.redUser,width: 14.w,height: 17.h,),
                      SizedBox(width: 5.w,),
                      newsEntity.playerId==0?SizedBox():SizedBox(
                        width: 70.w,
                        child: MainText(
                          text: newsEntity.playerName,
                          color:ColorApp.red,
                          font: 12,
                          overflow: TextOverflow.ellipsis,
                          family: TextFontApp.mediumFont,
                        ),
                      ),

                    ],
                  ),
                  Row(children: [
                    newsEntity.leagueName==null?SizedBox():SizedBox(
                      height: 17,width: 17,
                        child: CachedImageNetwork(image:newsEntity.leagueLogo,fit: BoxFit.cover,)),
                    SizedBox(width: 5.w,),
                    newsEntity.leagueName==null?SizedBox():SizedBox(
                      // width: 80.w,
                      child: MainText(
                        text: newsEntity.leagueName,
                        color:ColorApp.red,
                        font: 12,
                        overflow: TextOverflow.ellipsis,
                        family: TextFontApp.mediumFont,
                      ),
                    ),
                  ],),
                  Row(children: [
                    newsEntity.teamId==0?SizedBox(): Image.network(newsEntity.teamLogo??"",width: 14.w,height: 17.h,),
                    SizedBox(width: 5.w,),
                    newsEntity.teamId==0?SizedBox():SizedBox(
                      // width: 80.w,
                      child: MainText(
                        text: newsEntity.teamName,
                        color:ColorApp.red,
                        font: 12,
                        overflow: TextOverflow.ellipsis,
                        family: TextFontApp.mediumFont,
                      ),
                    ),
                  ],)
                ],),
            ),
          ],
        ),
      ),
    );
  }
}
