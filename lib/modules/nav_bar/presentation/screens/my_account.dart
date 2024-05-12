import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/core/cubit/availability_cubit.dart';
import 'package:skori/core/cubit/setting/setting_model.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/authentication/presentation/screens/login_screen.dart';
import 'package:skori/modules/profile/presentation/bloc/delete_account/delete_account_cubit.dart';
import 'package:skori/modules/profile/presentation/screens/favorites.dart';
import 'package:skori/modules/profile/presentation/screens/manage_your_package.dart';
import 'package:skori/modules/profile/presentation/screens/notifications.dart';
import 'package:skori/modules/profile/presentation/screens/profile.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/dialog_app/custom_dialog.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../authentication/presentation/screens/sign_up__screen.dart';
import '../../../authentication/social_login/google_sign_in_api.dart';
import '../../../profile/presentation/screens/about_us.dart';
import '../../../profile/presentation/screens/change_password.dart';
import '../../../profile/presentation/screens/contact_us.dart';
import '../../../profile/presentation/screens/following_list.dart';
import '../../../profile/presentation/screens/language.dart';
import '../../../profile/presentation/screens/packages.dart';
import '../../../profile/presentation/screens/terms_and_condetions.dart';
import '../../../profile/presentation/widgets/deleteAcc_dialog.dart';
import '../widgets/profile_list_tile.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("user is logged :${AppStorage.isLogged}");
    return Scaffold(
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 0),
              children: [
                !AppStorage.isLogged?SizedBox():Container(
                  height: 185.h,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: ColorApp.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 63.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AppImages.logo,
                            height: 34.h,
                            width: 79.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              RouteManager.navigateTo(NotificationsScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.5.w, vertical: 9.h),
                              color: ColorApp.red,
                              child: Image.asset(
                                AppIcons.notifications,
                                height: 21.h,
                                width: 20.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      MainText(
                        text: "Hello,${AppStorage.getUserModel.firstName}",
                        family: TextFontApp.extraBoldFont,
                        font: 15,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MainText(
                        text: AppStorage.getUserModel.email,
                        family: TextFontApp.regularFont,
                        font: 12,
                        color: ColorApp.hintGray,
                      ),
                    ],
                  ),
                ),
                !AppStorage.isLogged?SizedBox():BlocBuilder<AvailabilityCubit, BaseState>(
                  builder: (context, state) {
                    return AvailabilityCubit.of(context).availability==false?SizedBox(): AppButton(
                      title: LocaleKeys.manageYourPackage.tr(),
                      height: 50.h,
                      hor: 16,
                      ver: 15,
                      onPressed: () {
                        RouteManager.navigateTo(ManageYourPackageScreen());
                      },
                    );
                  },
                ),

                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  color: ColorApp.white,
                  child: Column(
                    children: [
                       AppStorage.isLogged?SizedBox():SizedBox(height: 100,),
                      !AppStorage.isLogged?SizedBox():ProfileListTile(
                        title: LocaleKeys.editProfile.tr(),
                        icon: ProfileIcons.edit,
                        route: ProfileScreen(),
                      ),
                      !AppStorage.isLogged?SizedBox(): Divider(),
                      !AppStorage.isLogged?SizedBox():ProfileListTile(
                        title: LocaleKeys.changePassword.tr(),
                        icon: ProfileIcons.code,
                        route: ChangePasswordScreen(),
                      ),
                      !AppStorage.isLogged?SizedBox():Divider(),
                      !AppStorage.isLogged?SizedBox():ProfileListTile(
                        title: LocaleKeys.favorites.tr(),
                        icon: ProfileIcons.favorite,
                        route: FavoritesScreen(),
                      ),
                      !AppStorage.isLogged?SizedBox():Divider(),
                      !AppStorage.isLogged?SizedBox():ProfileListTile(
                        title: LocaleKeys.followingList.tr(),
                        icon: ProfileIcons.following,
                        route: FollowingListScreen(),
                      ),
                      !AppStorage.isLogged?SizedBox():Divider(),
                      !AppStorage.isLogged?SizedBox(): BlocBuilder<AvailabilityCubit, BaseState>(
                        builder: (context, state) {
                          return AvailabilityCubit.of(context).availability==false?SizedBox():ProfileListTile(
                            title: LocaleKeys.packages.tr(),
                            icon: ProfileIcons.packages,
                            route: PackagesScreen(),
                          );
                        },
                      ),
                      !AppStorage.isLogged?SizedBox():AvailabilityCubit.of(context).availability==false?SizedBox():Divider(),
                      ProfileListTile(
                        title: LocaleKeys.language.tr(),
                        icon: ProfileIcons.global,
                        route: LanguageScreen(),
                      ),
                      Divider(),
                      ProfileListTile(
                        title: LocaleKeys.contactUs.tr(),
                        icon: ProfileIcons.contact,
                        route: ContactUsScreen(),
                      ),
                      Divider(),
                      ProfileListTile(
                        title: LocaleKeys.aboutUs.tr(),
                        icon: ProfileIcons.information,
                        route: AboutUsScreen(),
                      ),
                      Divider(),
                      ProfileListTile(
                        title: LocaleKeys.termsConditions.tr(),
                        icon: ProfileIcons.terms,
                        route: TermsAndConditionsScreen(),
                      ),
                      Divider(),
                      !AppStorage.isLogged?SizedBox():ProfileListTile(
                        title: LocaleKeys.deleteAccount.tr(),
                        icon: ProfileIcons.trash,
                        onTap: () {
                          CustomDialog(
                            dismiss: true,
                            theDialog: DeleteAccountDialog(),
                          );
                        },
                      ),
                      !AppStorage.isLogged?SizedBox():Divider(),
                      !AppStorage.isLogged?SizedBox():ProfileListTile(
                        title: LocaleKeys.logout.tr(),
                        icon: ProfileIcons.logout,
                        onTap: () async{
                          AppStorage.signOut();
                          await GoogleSignInApi.signOut();

                        },
                      ),
                      AppStorage.isLogged?SizedBox():SizedBox(height: 100,),
                      AppStorage.isLogged?SizedBox():AppButton(title: LocaleKeys.createAcc.tr(),hor: 30,onPressed: (){
                        RouteManager.navigateAndPopAll(SignUpScreen());
                      },),
                      SizedBox(
                        height: 30,
                      ),
                      AppStorage.isLogged?SizedBox():AppButton(title: LocaleKeys.login.tr(),hor: 30,onPressed: (){
                        RouteManager.navigateAndPopAll(LoginScreen());
                      },),

                    ],
                  ),
                ),
                SizedBox(height: 110.h),
              ],
            ),
          );
  }
}
