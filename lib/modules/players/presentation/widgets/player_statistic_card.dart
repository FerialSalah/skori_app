import 'package:flutter/material.dart';
import 'package:skori/core/constant/app_assets.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../domain/entity/player_statistics_entity.dart';

class PlayerStatisticCard extends StatelessWidget {
  final List<StatisticValue>  statistics;
  final String  title;
  const PlayerStatisticCard({Key? key, required this.statistics, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(text: title,font: 18,family: TextFontApp.boldFont),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            decoration: BoxDecoration(
                border: Border.all(color: ColorApp.borderGray,width: 1),
                color: ColorApp.white
            ),
            child: Column(
              children: [

                Container(
                  child: ListView.separated(
                      shrinkWrap: true,
                     // physics: NeverScrollableScrollPhysics(),
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context,index){
                        print("value is : ${statistics[index].value.toString()}");
                        if(statistics[index].value.toString().contains("%")){
                        print("prescent:${(double.parse(statistics[index].value.toString().substring(0,(statistics[index].value.toString().lastIndexOf("%")))))}"
                        );}
                        return  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            statistics[index].icon==null? SizedBox(
                              width:170,
                              child:  MainText(text: "${statistics[index].name}",font: 14,family: TextFontApp.semiBoldFont,
                              ) ,
                            ):
                            SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  MainText(text: "${statistics[index].name}",font: 14,family: TextFontApp.semiBoldFont,),
                                  statistics[index].icon=="yellow" || statistics[index].icon=="red"?SizedBox(width: 5,):SizedBox(),
                                  statistics[index].icon=="yellow"? Image.asset(AppIcons.yellowCard,height: 20,width: 20,):
                                  statistics[index].icon=="red"? Image.asset(AppIcons.redCard,height: 20,width: 20,): SizedBox(),
                                ],
                              ),
                            ),
                            Spacer(),
                            MainText(text:"${statistics[index].value}",font: 16,family:TextFontApp.boldFont,hor: 5,color:
                                statistics[index].value.toString().contains("%")?

                                double.parse(statistics[index].value.toString().substring(0,(statistics[index].value.toString().lastIndexOf("%"))))>=50
                                    ?
                            Colors.green:Colors.red
                                    :Colors.black
                              ),

                            statistics[index].value=="premium"?Image.asset(AppIcons.premium,height: 24,width: 24,):SizedBox(),
                          ],
                        );
                      },
                      separatorBuilder: (_,c)=>Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                      itemCount: statistics.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
