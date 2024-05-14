import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/core/widgets/offline_widget.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/players/presentation/bloc/player_info_bloc.dart';
import '../../../../../core/widgets/main_text.dart';
import '../bloc/players_event.dart';

class PlayerInfo extends StatefulWidget {
  final int id;

  const PlayerInfo({super.key, required this.id});
  @override
  State<PlayerInfo> createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  @override
  void initState() {
    BlocProvider.of<PlayerInfoBloc>(context)..add(GetPlayerInfo(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerInfoBloc, BaseState>(
      builder: (context, state) {
        final playerInfo =
            BlocProvider.of<PlayerInfoBloc>(context).playerEntity;
        if (state is LoadingState) {
          print("player data is loading");
          return ColorLoader();
        } else if (state is SuccessState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 300.h,
                  margin:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                        width: 280.w,
                        height: 100.h,
                        decoration: BoxDecoration(color: ColorApp.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: 70.w,
                                              child: MainText(
                                                text: playerInfo!.teamEntity.id
                                                    .toString(),
                                                font: 14,
                                                color: ColorApp.red,
                                                family: TextFontApp.boldFont,
                                                center: true,
                                              )),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SizedBox(
                                              width: 70.w,
                                              child: MainText(
                                                text: 'LW',
                                                font: 14,
                                                color: ColorApp.red,
                                                family: TextFontApp.mediumFont,
                                                center: true,
                                              )),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Image.network(
                                            playerInfo.teamEntity.logo,
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.network(
                                            playerInfo.avatar,
                                            height: 100.h,
                                            width: 100.w,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            playerInfo.teamEntity.countryFlag,
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: ColorApp.borderGray,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin:EdgeInsets.symmetric(vertical: 10.h),
                                  child: MainText(
                                    text: playerInfo.name.toString(),
                                    font: 14,
                                    color: ColorApp.black,
                                    family: TextFontApp.boldFont,
                                    center: true,
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50.w,vertical: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainText(
                                        text: playerInfo.fifaCardEntity.playingTime.toString(),
                                        font: 15,
                                        family: TextFontApp.boldFont,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      MainText(
                                        text: 'Min',
                                        font: 12,
                                        color: ColorApp.hintGray,
                                      ),
                                    ],
                                  ),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainText(
                                        text: playerInfo.fifaCardEntity.goalsNo.toString(),
                                        font: 15,
                                        family: TextFontApp.boldFont,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      MainText(
                                        text: LocaleKeys.goals.tr(),
                                        font: 12,
                                        color: ColorApp.hintGray,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 30.h),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      MainText(
                                        text: playerInfo.fifaCardEntity.attemptsAtGoalNo.toString(),
                                        font: 15,
                                        family: TextFontApp.boldFont,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      MainText(
                                        text: 'AGN',
                                        font: 12,
                                        color: ColorApp.hintGray,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        )),
                  ),
                ),
                Container(
                  height: 400.h,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorApp.borderGray, width: 1),
                      color: Colors.white),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Image.network(
                                    playerInfo!.teamEntity.logo,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  MainText(
                                    text: playerInfo.teamEntity.name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  MainText(
                                    text: LocaleKeys.club.tr(),
                                    font: 12,
                                    color: ColorApp.hintGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 1,
                            color: ColorApp.borderGray,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  playerInfo.countryLogo == ""
                                      ? SizedBox()
                                      : Image.network(
                                          playerInfo.countryLogo,
                                          width: 30,
                                        ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  MainText(
                                    text: playerInfo.countryName,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  MainText(
                                    text: LocaleKeys.nationality.tr(),
                                    font: 12,
                                    color: ColorApp.hintGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        height: .5,
                        color: ColorApp.borderGray,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.position,
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.playerCategory.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.age.toString(),
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.age.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.gender,
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.gender.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          )
                        ],
                      ),
                      ////////////////////////////////////Row2
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.height ?? "" + " " + "CM",
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.height.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.weight ?? "" + " " + "KG",
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.weight.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.clubShirtNumber,
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.shirtNum.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          )
                        ],
                      ),
                      //////////////////////////////////////Row3
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.countryName ?? "",
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.nationalTeam.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: playerInfo.nationalShirtNumber ?? "",
                                font: 15,
                                family: TextFontApp.boldFont,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MainText(
                                text: LocaleKeys.shirtNum.tr(),
                                font: 12,
                                color: ColorApp.hintGray,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is OfflineState) {
          return OfflinePage();
        } else {
          return Text("Something Error");
        }
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyClipper oldClipper) => false;
}
