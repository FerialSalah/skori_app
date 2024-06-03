import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skori/modules/profile/presentation/widgets/manage_package_whatsup_widget.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/packages/my_packages_cubit.dart';

class ManageYourPackageScreen extends StatefulWidget {
  const ManageYourPackageScreen({Key? key}) : super(key: key);

  @override
  State<ManageYourPackageScreen> createState() => _ManageYourPackageScreenState();
}

class _ManageYourPackageScreenState extends State<ManageYourPackageScreen> {
  @override
  void initState() {
    MyPackagesCubit.of(context).getMyPackages();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBars.appBarTitle(title: LocaleKeys.manageYourPackage.tr(), search: false),
      body:ManagePackagesWhatsAppWidget()

      // BlocBuilder<MyPackagesCubit, BaseState>(
      //   builder: (context, state) {
      //     if (state is OfflineState) {
      //       return OfflinePage();
      //     } else if (state is LoadingState) {
      //       return ShimmerWidget();
      //     } else if (state is SuccessState) {
      //       final packages = MyPackagesCubit.of(context).myPackageModel;
      //       return ListView(
      //         children: [
      //           Container(
      //             margin: EdgeInsets.symmetric(vertical: 15),
      //             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      //             color: ColorApp.white,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   height: 80.h,
      //                   child: Row(
      //                     children: [
      //                       Container(
      //                         height: 80.h,
      //                         width: 80.w,
      //                         // color: ColorApp.yellow.withOpacity(.1),
      //                         decoration: BoxDecoration(
      //                             image: DecorationImage(
      //                                 image: NetworkImage(
      //                                      packages!.data!.plan!.image!),
      //                                 fit: BoxFit.cover)),
      //                       ),
      //                       SizedBox(
      //                         width: 15.w,
      //                       ),
      //                       Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           MainText(
      //                             text:  packages.data!.plan!.title!,
      //                             font: 14,
      //                             family: TextFontApp.boldFont,
      //                           ),
      //                           Text.rich(TextSpan(children: [
      //                             TextSpan(
      //                                 text:  packages.data!.plan!.price!,
      //                                 style: TextStyle(
      //                                     fontSize: 18,
      //                                     fontFamily: TextFontApp.boldFont,
      //                                     color: ColorApp.red)),
      //                             TextSpan(
      //                               text: "  ",
      //                             ),
      //                             TextSpan(
      //                                 text: "SAR",
      //                                 style: TextStyle(
      //                                     fontSize: 12,
      //                                     fontFamily:
      //                                     TextFontApp.semiBoldFont,
      //                                     color: ColorApp.red)),
      //                           ])),
      //                           Text.rich(TextSpan(children: [
      //                             TextSpan(
      //                                 text: "End Date : ",
      //                                 style: TextStyle(
      //                                     fontSize: 14,
      //                                     fontFamily: TextFontApp.regularFont,
      //                                     color: ColorApp.hintGray)),
      //                             TextSpan(
      //                               text: "  ",
      //                             ),
      //                             TextSpan(
      //                                 text:  packages.data!.endDate!,
      //                                 style: TextStyle(
      //                                     fontSize: 14,
      //                                     fontFamily:
      //                                     TextFontApp.semiBoldFont,
      //                                     color: ColorApp.primary)),
      //                           ]))
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.symmetric(vertical: 15.h),
      //                   child: Divider(
      //                     color: ColorApp.borderGray,
      //                     thickness: .5,
      //                   ),
      //                 ),
      //                 Text.rich(TextSpan(children: [
      //                   TextSpan(
      //                       text: "Subscription Date : ",
      //                       style: TextStyle(
      //                           fontSize: 14,
      //                           fontFamily: TextFontApp.regularFont,
      //                           color: ColorApp.hintGray)),
      //                   TextSpan(
      //                     text: "  ",
      //                   ),
      //
      //                   TextSpan(
      //                       text: packages.data!.startDate!,
      //                       style: TextStyle(
      //                           fontSize: 14,
      //                           fontFamily:
      //                           TextFontApp.semiBoldFont,
      //                           color: ColorApp.primary)),
      //                 ])),
      //                 SizedBox(height: 10,),
      //                 Text.rich(TextSpan(children: [
      //                   TextSpan(
      //                       text: "End In :  ",
      //                       style: TextStyle(
      //                           fontSize: 14,
      //                           fontFamily: TextFontApp.regularFont,
      //                           color: ColorApp.hintGray)),
      //                   TextSpan(
      //                     text: "  ",
      //                   ),
      //                   TextSpan(
      //                       text: "${packages.data!.endInDays!} Days",
      //                       style: TextStyle(
      //                           fontSize: 14,
      //                           fontFamily:
      //                           TextFontApp.semiBoldFont,
      //                           color: ColorApp.red)),
      //                 ])),
      //
      //               ],
      //             ),
      //           ),
      //           Container(
      //             color: ColorApp.white,
      //             child: ListView(
      //               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      //               physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               children: packages.data!.plan!.features!
      //                   .map(
      //                     (e) => Row(
      //                   children: [
      //                     SizedBox(
      //                         height: 0,
      //                         width: 20,
      //                         child: Checkbox(
      //                           value: true,
      //                           onChanged: (v) {},
      //                           side: BorderSide(
      //                               color: ColorApp.red, width: 2),
      //                           activeColor: ColorApp.red,
      //                           checkColor: ColorApp.white,
      //                         )),
      //                     SizedBox(
      //                       width: 8,
      //                     ),
      //                     Column(
      //                       crossAxisAlignment:
      //                       CrossAxisAlignment.start,
      //                       children: [
      //                         MainText(
      //                           text: e.title,
      //                           font: 14,
      //                           family: TextFontApp.regularFont,
      //                         ),
      //                         SizedBox(
      //                           height: 5,
      //                         ),
      //                         MainText(
      //                           text: e.description,
      //                           font: 12,
      //                           color: ColorApp.hintGray,
      //                           family: TextFontApp.regularFont,
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               )
      //                   .toList(),
      //             ),
      //           ),
      //           Padding(
      //             padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 40),
      //             child: Row(
      //               children: [
      //               Expanded(child: AppButton(title: LocaleKeys.renew.tr(),
      //               onPressed: (){
      //                 SubscribeCubit.of(context).packageId = packages.data!.id!;
      //                 print( packages.data!.id!);
      //                 SubscribeCubit.of(context).subscribe( );
      //               },)),
      //               SizedBox(width: 15,),
      //               Expanded(child: AppButton(title: LocaleKeys.change.tr(),color: ColorApp.borderGray,
      //               textColor: ColorApp.primary,
      //                 onPressed: (){
      //                   CustomDialog(theDialog: ChangePackageDialog(),dismiss: true,);
      //
      //
      //                 },
      //
      //               )),
      //
      //             ],),
      //           ),
      //         ],
      //       );
      //     } else {
      //       return MainText(
      //         text: "Error",
      //       );
      //     }
      //   },
      // ),

    );
  }
}
