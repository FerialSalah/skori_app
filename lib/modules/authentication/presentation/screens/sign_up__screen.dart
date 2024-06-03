 import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skori/core/cubit/gender_cubit.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/hud_loader.dart';
import 'package:skori/modules/authentication/presentation/bloc/sign_up/bloc.dart';
import 'package:skori/modules/authentication/presentation/bloc/sign_up/state.dart';
import 'package:skori/modules/authentication/presentation/screens/login_screen.dart';
import 'package:skori/modules/nav_bar/presentation/screens/nav_bar.dart';
import 'package:skori/modules/profile/presentation/screens/terms_and_condetions.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/dialog_app/custom_dialog.dart';
import '../../../../core/widgets/dialog_app/error_dialog.dart';
import '../../../../core/widgets/donot_have.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../social_login/google_sign_in_api.dart';
import '../bloc/sign_up/event.dart';
import '../bloc/social_cubit.dart';
import '../widgets/sign_up/sign_up_form.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  bool check= true;



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
      appBar: AppBars.appBarTitle(search: false,onBack: (){
        RouteManager.navigateAndPopAll(LoginScreen());
      }),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpOffline) {
            showSnackBar(state.msg);
          } else if (state is SignUpSuccess) {
            RouteManager.navigateAndPopAll(NavBarScreen());
          } else if (state is SignUpField) {
            CustomDialog(theDialog: ErrorDialog(msg:state.msg ,),dismiss: true);
            // showSnackBar(state.msg);
          }
        },
  builder: (context, state) {
    return LoaderHud(
        isCall: state is SignUpLoading?true:false,
        child: Form(
          key: signUpKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
              vertical: 0,
            ),
            children: [
              SizedBox(
                height: 0.h,
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
                  text: LocaleKeys.createYourAcc.tr(),
                  font: 22,
                  center: true,
                  color: ColorApp.black,
                  family: TextFontApp.blackFont,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SignUpForm(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                birthDateController: birthDateController,

              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 12,
                      width: 20,
                      child: Checkbox(
                        value: check,
                        onChanged: (v) {
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
                  GestureDetector(
                    onTap: (){
                      RouteManager.navigateTo(TermsAndConditionsScreen());
                    },
                    child: SizedBox(
                      width: 220.w,
                      child: Text.rich(TextSpan(
                        children: [
                         TextSpan(text: LocaleKeys.iAgree.tr(),style: TextStyle(
                           fontSize: 14,color: ColorApp.black,fontFamily: TextFontApp.regularFont
                         )),
                          TextSpan(text: "  "),
                          TextSpan(text: LocaleKeys.termsAndCondition.tr(),

                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                              fontSize: 14,color: ColorApp.red,fontFamily: TextFontApp.semiBoldFont
                          )),
                        ]
                      )),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              ///SignUp Button
              AppButton(title: LocaleKeys.createAcc.tr(), height: 50.h,onPressed: (){

                if(signUpKey.currentState!.validate()){
                  if(check==false){
                    return showSnackBar("You should accept terms and Conditions");
                  }else{
                    BlocProvider.of<SignUpBloc>(context)
                      ..add(signUpCall(firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          phone: phoneController.text??null,
                          gender: GenderCubit.of(context).theGender??null,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text
                      ));
                  }
                }else{
                  return;
                }
              },),
              // Center(
              //   child: Padding(
              //     padding:  EdgeInsets.symmetric(vertical: 25.h),
              //     child: MainText(
              //       text: LocaleKeys.orRegister.tr(),
              //       font: 16,
              //
              //       color: ColorApp.black,
              //       family: TextFontApp.mediumFont,
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //   AppButton(title: "Facebook",height: 50.h,color: ColorApp.face,width:150.w ,),
              //   AppButton(title: "Google",height: 50.h,color: ColorApp.red,width:150.w ),
              // ],),

              SizedBox(
                height: 30.h,
              ),
              DoNotHave(
                have: LocaleKeys.haveAcc.tr(),
                text: LocaleKeys.loginNow.tr(),
                route: () {
                  RouteManager.navigateTo( LoginScreen());
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
                title: "Apple",
                height: 50.h,
                color: ColorApp.black,
                width:150.w,
                onPressed: (){
                  _loginWithApple();
                },
              ),
              SizedBox(
                height: 40.h,
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


