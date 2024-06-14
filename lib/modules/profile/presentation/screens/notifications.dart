import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/app_bar/app_bar_with_filter.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/profile/presentation/bloc/delete_notification/delete_notification_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/delete_notification/delete_notification_event.dart';
import 'package:skori/modules/profile/presentation/bloc/notifications/notifications_bloc.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../../core/widgets/snack_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !AppStorage.isLogged
        ? ShouldSignUp()
        : Scaffold(
            appBar: AppBarsWithFilter.appBarTitle(
                title: LocaleKeys.notifications.tr(),
                search: false,
                filter: false),
            body: BlocBuilder<NotificationsBloc, BaseState>(
              builder: (context, state) {
                final result =
                    BlocProvider.of<NotificationsBloc>(context).notifications;
                //print("notification body:${result[0].body}");
                if (state is LoadingState) {
                  return ShimmerWidget();
                } else if (state is SuccessState) {
                  if (result.isEmpty) {
                    return emptyShow();
                  } else {
                    return ListView.separated(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05,
                            right: MediaQuery.of(context).size.width * .05,
                            top: 20),
                        itemBuilder: (context, index) => Container(
                                child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      AppIcons.notifictions_list,
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250,
                                          child: MainText(
                                            text: result[index].title,
                                            height: 1.5,
                                            font: 13,
                                            family: TextFontApp.regularFont,
                                            color: Colors.black,
                                          ),
                                        ),
                                        //  SizedBox(height: 5,),
                                        Container(
                                          width: 250,
                                          child: MainText(
                                            text: result[index].body,
                                            height: 1.5,
                                            font: 13,
                                            family: TextFontApp.regularFont,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        MainText(
                                          text: result[index].date,
                                          font: 12,
                                          family: TextFontApp.regularFont,
                                          color: ColorApp.hintGray,
                                        ),
                                      ],
                                    ),
                                    BlocConsumer<DeleteNotificationBloc,
                                        BaseState>(
                                      listener: (context, state) {
                                        if (state is SuccessState) {
                                          showSnackBar(LocaleKeys.deleteNotificationMsg.tr());
                                        } else if(state is ErrorState){
                                          showSnackBar("Delete Fail try again");
                                        }
                                      },
                                      builder: (context, state) {
                                        return GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<DeleteNotificationBloc>(context)
                                              ..add(DeleteNotificationCall(id: result[index].id));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 10.h),
                                            child: Image.asset(
                                              AppIcons.trash,
                                              width: 30,
                                              height: 30,
                                              color: ColorApp.red,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                        separatorBuilder: (context, _) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: result.length);
                  }
                } else if (state is OfflineState) {
                  return OfflinePage();
                } else {
                  return Text("Server error");
                }
              },
            ));
  }
}
