import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/domain/entity/player_statistics_entity.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistics_info_card.dart';


class PlayerStatisticsInfo extends StatelessWidget {
  final List<StatisticValue>  mainStats;

  PlayerStatisticsInfo({
    super.key, required this.mainStats,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      child: new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4/3,
          physics: NeverScrollableScrollPhysics(),
          children: new List.generate(mainStats.length, (index) {
            return new PlayStatisticInfoCard(
              title: mainStats[index].name,
              value: mainStats[index].value.toString(),
            );


          })),
    );
  }
}
