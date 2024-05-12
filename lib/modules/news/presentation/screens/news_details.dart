import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/validation/validations.dart';
import 'package:skori/core/widgets/app_bar/app_bar_title.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/customTextFeild.dart';
import 'package:skori/core/widgets/empty.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/news/presentation/bloc/add_comment_cubit.dart';
import 'package:skori/modules/news/presentation/bloc/comment_cubit.dart';
import 'package:skori/modules/news/presentation/bloc/news_event.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/injection/injection_app.dart' as di;
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../domain/entity/news_entity.dart';
import '../bloc/news_details_bloc.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsEntity newsEntity;
  final  bool? isPlayer;


  const NewsDetailsScreen({
    Key? key,
    required this.newsEntity, this.isPlayer,
  }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  TextEditingController commentController = TextEditingController();
  final commentKey = GlobalKey<FormState>();

  @override
  void initState() {
    print("widget.articleId ======${widget.newsEntity.id}");
    BlocProvider.of<NewsDetailsBloc>(context).add(GetNewsDetailsData(
        articleId: widget.newsEntity.id,
        playerId:widget.isPlayer==true?widget.newsEntity.playerId:null,
        teamId: widget.isPlayer==false?widget.newsEntity.teamId:null));
    BlocProvider.of<CommentCubit>(context)
        .getComments(id: widget.newsEntity.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBars.appBarLogo(),
            body: BlocBuilder<NewsDetailsBloc, BaseState>(
              builder: (context, state) {
                final result = BlocProvider.of<NewsDetailsBloc>(context).newsDetails;
                if (state is LoadingState) {
                  return ShimmerWidget();
                } else if (state is SuccessState ||state is PaginateState) {
                  return ListView(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 220.h,
                            width: 1.sw,
                            child: CachedImageNetwork(
                              image:result!.cover,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 190.h,
                            ),
                            child: Container(
                              width: 1.sw,
                              padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color: ColorApp.white,
                                  border: Border.all(
                                      color: ColorApp.borderGray, width: .5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainText(
                                    text: result.date,
                                    font: 12,
                                    family: TextFontApp.regularFont,
                                    color: ColorApp.hintGray,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: MainText(
                                      text: result.title,
                                      font: 16,
                                      family: TextFontApp.extraBoldFont,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        NewsImages.redUser,
                                        width: 14.w,
                                        height: 17.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      MainText(
                                        text: result.writerName,
                                        color: ColorApp.red,
                                        font: 12,
                                        family: TextFontApp.mediumFont,
                                      ),
                                      Spacer(),
                                      result.playerId == 0
                                          ? SizedBox()
                                          : Image.asset(
                                        NewsImages.redUser,
                                        width: 14.w,
                                        height: 17.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      result.playerId == 0
                                          ? SizedBox()
                                          : MainText(
                                        text: result.playerName,
                                        color: ColorApp.red,
                                        font: 12,
                                        family: TextFontApp.mediumFont,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      result.leagueId == 0
                                          ? SizedBox()
                                          : Image.network(
                                        result.leagueLogo,
                                        width: 14.w,
                                        height: 17.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      result.leagueId == 0
                                          ? SizedBox()
                                          : MainText(
                                        text: result.leagueName,
                                        color: ColorApp.red,
                                        font: 12,
                                        family: TextFontApp.mediumFont,
                                      ),
                                      Spacer(),
                                      result.teamId == 0
                                          ? SizedBox()
                                          : Image.network(
                                        result.teamLogo,
                                        width: 14.w,
                                        height: 17.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      result.teamId == 0
                                          ? SizedBox()
                                          : MainText(
                                        text: result.teamName,
                                        color: ColorApp.red,
                                        font: 12,
                                        family: TextFontApp.mediumFont,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20.h),
                                    child: Divider(),
                                  ),
                                  // MainText(height: 1.8,text:body),
                                   HtmlWidget(result.body)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Form(
                        key: commentKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                          EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                          decoration: BoxDecoration(
                              color: ColorApp.white,
                              border:
                              Border.all(color: ColorApp.borderGray, width: .5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MainText(
                                text: LocaleKeys.addComment.tr(),
                                family: TextFontApp.semiBoldFont,
                                font: 14,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: CustomTextField(
                                  hint: LocaleKeys.writeHere.tr(),
                                  valid: Validations.validateField,
                                  controller: commentController,
                                  line: 4,
                                ),
                              ),
                              BlocConsumer<AddCommentCubit, BaseState>(
                                listener: (_, state) {
                                  if (state is SuccessState) {
                                    showSnackBar("your comment add successfully");
                                    commentController.clear();
                                    BlocProvider.of<CommentCubit>(context)
                                        .getComments(id: result.id);
                                  } else if (state is ErrorState) {
                                    showSnackBar("Try again");
                                  }
                                },
                                builder: (context, state) {
                                  return state is LoadingState
                                      ? ColorLoader(
                                    dotRadius: 4,
                                    radius: 15,
                                  )
                                      : AppButton(
                                    title: LocaleKeys.addNow.tr(),
                                    height: 40.h,
                                    width: 120.w,
                                    onPressed: () {
                                      if (commentKey.currentState!.validate()) {
                                        AddCommentCubit.of(context).addComment(
                                            id: result.id,
                                            comment: commentController.text);
                                      } else {
                                        return;
                                      }
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<CommentCubit, BaseState>(
                        builder: (context, state) {
                          final comments = CommentCubit.of(context).commentModel;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 24.h),
                            child: Row(
                              children: [
                                MainText(
                                  text: LocaleKeys.previousComments.tr(),
                                  font: 14,
                                  family: TextFontApp.extraBoldFont,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                MainText(
                                  text: state is SuccessState
                                      ? "(${comments.data!.length})"
                                      : "(..)",
                                  font: 14,
                                  family: TextFontApp.extraBoldFont,
                                  color: ColorApp.yellow,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        decoration: BoxDecoration(
                            color: ColorApp.white,
                            border:
                            Border.all(color: ColorApp.borderGray, width: .5)),
                        child: BlocBuilder<CommentCubit, BaseState>(
                          builder: (context, state) {
                            final comments = CommentCubit.of(context).commentModel;
                            return state is SuccessState
                                ? comments.data!.isEmpty
                                ? emptyShow()
                                : ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: comments.data!.length,
                              separatorBuilder: (context, _) => Divider(),
                              itemBuilder: (_, index) => Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(comments
                                              .data![index].userAvatar!),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 220.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        MainText(
                                          text: comments
                                              .data![index].userName,
                                          font: 14,
                                          family: TextFontApp.semiBoldFont,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        MainText(
                                          height: 1.5,
                                          text:
                                          comments.data![index].comment,
                                          font: 12,
                                          family: TextFontApp.regularFont,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : ColorLoader();
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is OfflineState) {
                  return OfflinePage();
                }else if(state is ErrorState){
                  return ShouldSignUp();
                }else {
                  return Text("Server error");
                }
              },
            )


          );
  }
}
