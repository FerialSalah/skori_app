import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';
import 'package:skori/modules/transfers/presentaion/widgets/transfer_card.dart';

class SearchTransfers extends StatelessWidget {
  final List<TransferEntity> transfers;
  const SearchTransfers({super.key, required this.transfers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: transfers.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, _) => SizedBox(
                width: 12.w,
              ),
          itemBuilder: (context, index) {
            return TransferCard(
                playerName: transfers[index].player!.name,
                playerImage: transfers[index].player!.avatar,
                playerMovedDate: transfers[index].joinDate!,
                playerTeamMovedFromImage: transfers[index].teamMovedFrom != null
                    ? transfers[index].teamMovedFrom!.logo
                    : "",
                playerTeamMovedFromName: transfers[index].teamMovedFrom != null
                    ? transfers[index].teamMovedFrom!.name
                    : "",
                playerTeamMovedToImage: transfers[index].teamMovedTo != null
                    ? transfers[index].teamMovedTo!.logo
                    : "",
                playerTeamMovedToName: transfers[index].teamMovedTo != null
                    ? transfers[index].teamMovedTo!.name
                    : "",
                fee: transfers[index].fee ?? "",
                playerId: transfers[index].player!.id,
                teamMovedFromId:transfers[index].teamMovedFrom!=null? transfers[index].teamMovedFrom!.id:0,
                teamMovedToId: transfers[index].teamMovedTo!.id,
                countryName: transfers[index].player!.country!.name,
                countryFlag: transfers[index].player!.country!.flag);

          }),
    );
    ;
  }
}
