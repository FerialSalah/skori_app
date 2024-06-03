import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skori/modules/profile/presentation/widgets/manage_package_whatsup_widget.dart';

import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../generated/locale_keys.g.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBars.appBarTitle(title: LocaleKeys.packages.tr(), search: false),
      body: ManagePackagesWhatsAppWidget()
      // BlocBuilder<PackagesCubit, BaseState>(
      //   builder: (context, state) {
      //
      //     if (state is OfflineState) {
      //       return OfflinePage();
      //     } else if (state is LoadingState) {
      //       return ShimmerWidget();
      //     } else if (state is SuccessState ) {
      //       final packages = PackagesCubit.of(context).packagesModel;
      //       return ListView.separated(
      //           padding: EdgeInsets.symmetric(vertical: 15.h),
      //           itemBuilder: (context, index) => Container(
      //                 padding:
      //                     EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      //                 // height: 330.h,
      //                 color: ColorApp.white,
      //                 child: Column(
      //                   children: [
      //                     Container(
      //                       height: 60.h,
      //                       child: Row(
      //                         children: [
      //                           Container(
      //                             height: 60.h,
      //                             width: 60.w,
      //                             // color: ColorApp.yellow.withOpacity(.1),
      //                             decoration: BoxDecoration(
      //                                 image: DecorationImage(
      //                                     image: NetworkImage(
      //                                         packages.data![index].image!),
      //                                     fit: BoxFit.cover)),
      //                           ),
      //                           SizedBox(
      //                             width: 15.w,
      //                           ),
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceAround,
      //                             children: [
      //                               MainText(
      //                                 text: packages.data![index].title,
      //                                 font: 14,
      //                                 family: TextFontApp.boldFont,
      //                               ),
      //                               Text.rich(TextSpan(children: [
      //                                 TextSpan(
      //                                     text: packages.data![index].price,
      //                                     style: TextStyle(
      //                                         fontSize: 18,
      //                                         fontFamily: TextFontApp.boldFont,
      //                                         color: ColorApp.red)),
      //                                 TextSpan(
      //                                   text: "  ",
      //                                 ),
      //                                 TextSpan(
      //                                     text: "SAR",
      //                                     style: TextStyle(
      //                                         fontSize: 12,
      //                                         fontFamily:
      //                                             TextFontApp.semiBoldFont,
      //                                         color: ColorApp.red)),
      //                               ]))
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: EdgeInsets.symmetric(vertical: 15.h),
      //                       child: Divider(
      //                         color: ColorApp.borderGray,
      //                         thickness: .5,
      //                       ),
      //                     ),
      //                     ListView(
      //                       physics: NeverScrollableScrollPhysics(),
      //                       shrinkWrap: true,
      //                       children: packages.data![index].features!
      //                           .map(
      //                             (e) => Row(
      //                               children: [
      //                                 SizedBox(
      //                                     height: 0,
      //                                     width: 20,
      //                                     child: Checkbox(
      //                                       value: true,
      //                                       onChanged: (v) {},
      //                                       side: BorderSide(
      //                                           color: ColorApp.red, width: 2),
      //                                       activeColor: ColorApp.red,
      //                                       checkColor: ColorApp.white,
      //                                     )),
      //                                 SizedBox(
      //                                   width: 8,
      //                                 ),
      //                                 Column(
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [
      //                                     MainText(
      //                                       text: e.title,
      //                                       font: 14,
      //                                       family: TextFontApp.regularFont,
      //                                     ),
      //                                     SizedBox(
      //                                       height: 5,
      //                                     ),
      //                                     MainText(
      //                                       text: e.description,
      //                                       font: 12,
      //                                       color: ColorApp.hintGray,
      //                                       family: TextFontApp.regularFont,
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           )
      //                           .toList(),
      //                     ),
      //                     SizedBox(height: 10,),
      //                     BlocConsumer<PaymentCubit, BaseState>(
      //                       listener: (_,state){
      //                         if(state is SuccessState){
      //                      //     RouteManager.navigateTo(WebViewExample(url:  PaymentCubit.of(context).paymentModel!.transaction!.url!,));
      //
      //
      //                         }
      //                       },
      //                       builder: (context, state) {
      //                         return state is LoadingState?AppButton(
      //                           title: LocaleKeys.subscribe.tr(),
      //                           height: 45.h,
      //                         ):AppButton(
      //                           title: LocaleKeys.subscribe.tr(),
      //                           height: 45.h,
      //                           onPressed: (){
      //                             SubscribeCubit.of(context).packageId = packages.data![index].id!;
      //                                  print( packages.data![index].id!);
      //                             SubscribeCubit.of(context).subscribe( );
      //                             // PaymentCubit.of(context).createCharge(amount: packages.data![index].price!,
      //                             //     paymentType: "new_subscription");
      //                           },
      //                         );
      //                       },
      //                     )
      //                   ],
      //                 ),
      //               ),
      //           separatorBuilder: (context, _) => SizedBox(
      //                 height: 10.h,
      //               ),
      //           itemCount: packages!.data!.length);
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
