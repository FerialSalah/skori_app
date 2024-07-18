import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skori/core/dio_helper/dio_helper.dart';
import 'package:skori/core/notification_helper/notification_helper.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/modules/authentication/presentation/screens/forget_password_screen.dart';
import 'package:skori/modules/authentication/presentation/screens/sign_up__screen.dart';
import 'package:skori/modules/authentication/social_login/google_sign_in_api.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/dialog_app/custom_dialog.dart';
import '../../../../core/widgets/dialog_app/error_dialog.dart';
import '../../../../core/widgets/donot_have.dart';
import '../../../../core/widgets/hud_loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../nav_bar/presentation/screens/nav_bar.dart';
import '../../../profile/presentation/bloc/notifications/notifications_bloc.dart';
import '../../../profile/presentation/bloc/notifications/notifications_event.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../bloc/social_cubit.dart';
import '../widgets/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    NotificationHelper.onInit();
    BlocProvider.of<NotificationsBloc>(context)..add(GetNotificationsData());

    super.initState();
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool check = true;
  GoogleSignInAccount? user;
  String? token;
 Future googleSignIn()async{
   await GoogleSignInApi.signOut();
   user = await GoogleSignInApi.login();
   print(user);
   if(user ==null){
     CustomDialog(theDialog: ErrorDialog(msg:"Error" ,),dismiss: true);
   }else{
     getUserToken();

   }
 }
  Future getUserToken()async{
    await user?.authentication.then((value){
      SocialLoginCubit.of(context).googleSocialLogin(value.accessToken!);
      setState(() {
        token = value.accessToken;
      });
      print("value.accessToken=======");
      print(value.accessToken);
    });
  }

  Future<void> _loginWithApple() async {
    final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    print('======= success sign in with apple ==========');
    print(credential);

    if (credential.email == null) {
      print('identityToken: ${credential.identityToken}');
      SocialLoginCubit.of(context).appleSocialLogin(credential.identityToken!);
      // Get user from backend by identity token
    } else {
      // ToDo
      // Register user to backend
      print('Name: ${credential.givenName} ${credential.familyName}');
      print('Email: ${credential.email}');
      print('userIdentifier: ${credential.userIdentifier}');
      print('identityToken: ${credential.identityToken}');
    }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginOffline) {
            showSnackBar(state.msg);
          } else if (state is LoginSuccess) {
            RouteManager.navigateAndPopAll(NavBarScreen());
          } else if (state is LoginField) {
            print(state.msg);
            CustomDialog(theDialog: ErrorDialog(msg:state.msg ,),dismiss: true);
          }
        },
  builder: (context, state) {
    return LoaderHud(
        isCall: state is LoginLoading || state is LoadingState?true:false,
        child: Form(
          key: loginKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            children: [
              SizedBox(
                height: 75.h,
              ),
              Image.asset(
                AppImages.logo,
                height: 45.h,
                width: 110.h,
              ),
              SizedBox(
                height: 35.h,
              ),
              Center(
                child: MainText(
                  text: LocaleKeys.signInToAcc.tr(),
                  font: 22,
                  center: true,
                  color: ColorApp.black,
                  family: TextFontApp.blackFont,
                ),
              ),
              SizedBox(
                height: 57.h,
              ),
              LoginForm(emailController: emailController,passwordController: passwordController,),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                      height: 12,
                      width: 20,
                      child: Checkbox(
                        value: check,
                        onChanged: (v) {
                          print(v);
                          setState(() {
                            check=v!;
                          });
                        },
                        side: BorderSide(color: ColorApp.hintGray,width: .7),
                        activeColor: ColorApp.red,
                      )),
                  SizedBox(
                    width: 8.w,
                  ),
                  MainText(
                    text: LocaleKeys.rememberMe.tr(),
                    font: 14.sp,
                    color: ColorApp.black,
                    family: TextFontApp.semiBoldFont,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      RouteManager.navigateTo(ForgetPasswordScreen());
                    },
                    child: MainText(
                      text: LocaleKeys.forgetPassword.tr(),
                      font: 14.sp,
                      color: ColorApp.red,
                      line: true,
                      family: TextFontApp.semiBoldFont,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              AppButton(title: LocaleKeys.login.tr(), height: 50.h,onPressed: (){
               if(loginKey.currentState!.validate()){
                 print("NotificationHelper.firebaseToken:${NotificationHelper.firebaseToken}");


                 BlocProvider.of<LoginBloc>(context)
                   ..add(LoginCall(email: emailController.text,
                      password: passwordController.text,
                   firebaseId:NotificationHelper.firebaseToken ));
                // print(AppStorage.notificationCount);
               }else{
                 return;
               }
              },),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: ()async{
                      await DioHelper.init();
                      RouteManager.navigateTo(NavBarScreen());
                    },
                      child: MainText(text: LocaleKeys.guest.tr(),family: TextFontApp.boldFont,font: 18,color: ColorApp.green,))),
              // SocialButtons(),
              SizedBox(
                height: 30.h,
              ),
              DoNotHave(
                have: LocaleKeys.doNotHaveAcc.tr(),
                text: LocaleKeys.createNow.tr(),
                route: () {
                  RouteManager.navigateTo( SignUpScreen());
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Platform.isIOS?SizedBox():AppButton(
                title: "Google",
                  height: 50.h,
                color: ColorApp.red,
                width:150.w,
                onPressed: (){
                  googleSignIn();
                },
              ),
              SizedBox(height: 10,),
              Platform.isAndroid?SizedBox():AppButton(
                title: LocaleKeys.loginWithApple.tr(),
                  height: 50.h,
                color: ColorApp.black,
                width:150.w,
               horText: 15.h,
               icon: AuthIcons.apple,
                onPressed: (){
                  _loginWithApple();
                },
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }
}
