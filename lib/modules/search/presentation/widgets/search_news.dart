import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/empty.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../../../news/presentation/screens/news_details.dart';


class SearchNews extends StatelessWidget {
  final List<NewsEntity> news;
  const SearchNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20),
        itemCount: news.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context,_)=>Padding(
          padding:  EdgeInsets.symmetric(vertical: 10),
          child: Divider(),
        ),
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              RouteManager.navigateTo(NewsDetailsScreen(
                newsEntity: news[index],


              ));
            },
            child: Container(
              height: 60.h,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,

                    child:CachedImageNetwork(image: news[index].cover,) ,
                  ),
                  SizedBox(width: 20.h,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                          child: MainText(text:news[index].title,font: 14,family: TextFontApp.boldFont,maxLines: 2,)),
                      SizedBox(height: 8,),
                      MainText(text:news[index].date,font: 12,family: TextFontApp.regularFont,
                        color: ColorApp.hintGray,hor:2,),

                    ],
                  ),

                ],
              ),
            ),
          );
        });
  }
}
