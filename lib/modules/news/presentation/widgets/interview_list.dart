import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/news/presentation/bloc/interview_news_bloc.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../bloc/news_event.dart';
import 'news_card.dart';

class InterviewNewsList extends StatefulWidget {
  const InterviewNewsList({Key? key}) : super(key: key);

  @override
  State<InterviewNewsList> createState() => _InterviewNewsListState();
}

class _InterviewNewsListState extends State<InterviewNewsList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<InterviewNewsBloc>(context)
          ..add(InterviewNewsPagination());
      }
    });
    super.initState();
    // scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {

    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewNewsBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<InterviewNewsBloc>(context).interviewNews;
        if (state is LoadingState) {
          return ShimmerWidget();
        } else if (state is SuccessState ||state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical:15.h),
                      itemBuilder: (context,index)=>NewsCart(
                        newsEntity: result[index],
                        isPlayer: false,
                        isTeam: false,
                      ),
                      separatorBuilder: (context,_)=>SizedBox(height: 10.h,),
                      itemCount: result.length),
                ),
                if(state is PaginateState)
                  ColorLoader(),
                SizedBox(height: 80,),
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
