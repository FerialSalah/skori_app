import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_storage/app_storage.dart';
import 'core/constant/constants.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/provider_list/provider_list.dart';
import 'core/routes/navigator_push.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme_app.dart';
import 'core/injection/injection_app.dart' as di;
import 'core/widgets/splach_screen.dart';
import 'generated/codegen_loader.g.dart';






void main() async {
  await di.init();
  await DioHelper.init();
  await AppStorage.init();
  await EasyLocalization.ensureInitialized();

  runApp(

    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('ar'),
      startLocale:Locale('en') ,
      path: 'assets/lang',
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),

  );
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    DioHelper.lang=context.locale.languageCode;
    return ScreenUtilInit(
      designSize:
      //Size(375, 812),
      Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      builder: (context,child)=>MultiBlocProvider(
        providers: BlocProvidersList.providersList,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Azraqna',
          theme: getApplicationTheme(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context,child)=>GestureDetector(
            onTap: (){
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
              closeKeyboard();
            },
            child: child,
          ),
          navigatorKey: navigatorKey,
          home: SplashScreen(),
        ),
      ),
    );
  }
}

