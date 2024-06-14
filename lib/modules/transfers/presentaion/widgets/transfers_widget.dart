import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/transfers/presentaion/bloc/transfers_event.dart';
import 'package:skori/modules/transfers/presentaion/widgets/transfer_card.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../bloc/transfers_bloc.dart';
class TransfersItems extends StatefulWidget {
  const TransfersItems({super.key});

  @override
  State<TransfersItems> createState() => _TransfersItemsState();
}

class _TransfersItemsState extends State<TransfersItems> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("here all Player Transfers");
        await BlocProvider.of<TransfersBloc>(context)
          ..add(TransfersPagination());

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TransfersBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<TransfersBloc>(context).transfers;
        print("transfers: $result");
        if (state is LoadingState) {
          return ShimmerWidget();
        } else if (state is SuccessState || state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            return Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        controller: scrollController,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .02,
                            right: MediaQuery.of(context).size.width * .02,
                            top: 10,
                            bottom: 10),

                        itemBuilder: (context, index) =>
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.w),
                              child:
                              TransferCard(
                                playerName: result[index].player!.name,
                                playerImage: result[index].player!.avatar,
                                playerMovedDate: result[index].joinDate!,
                                playerTeamMovedFromImage:result[index].teamMovedFrom!=null? result[index].teamMovedFrom!.logo:"",
                                playerTeamMovedFromName: result[index].teamMovedFrom!=null?result[index].teamMovedFrom!.name:"",
                                playerTeamMovedToImage:result[index].teamMovedTo!=null? result[index].teamMovedTo!.logo:"",
                                playerTeamMovedToName: result[index].teamMovedTo!=null? result[index].teamMovedTo!.name:"",
                                fee: result[index].fee??"",
                                playerId: result[index].player!.id,
                                teamMovedFromId:result[index].teamMovedFrom!=null?result[index].teamMovedFrom!.id:0,
                                teamMovedToId:result[index].teamMovedTo!=null?result[index].teamMovedTo!.id:0,
                                countryName:result[index].player!.country!.name,
                                countryFlag:result[index].player!.country!.flag,
                              ),
                            ),
                        separatorBuilder: (context, _) => SizedBox(
                          height: 10,
                        ),
                        itemCount: result.length)),
                if (state is PaginateState) ColorLoader(),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          }
        } else if (state is OfflineState) {
          return OfflinePage();
        } else {
          return Text("Server error");
        }
      },
    );
  }
}
