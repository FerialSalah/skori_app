import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/snack_bar.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';




class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  List<String> types = [ LocaleKeys.all.tr(), LocaleKeys.teams.tr(), LocaleKeys.players.tr(), LocaleKeys.news.tr() , LocaleKeys.leagues.tr()];
  List<String> searchKey = [ "all", "teams", "players", "news" , "tournaments"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430.h,
      color: Colors.transparent,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight:
                  Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText(
                text:  LocaleKeys.searchType.tr(),
                font: 20,
                family: TextFontApp.boldFont,
              ),
              SizedBox(height: 10,),
              MainText(
                text:  LocaleKeys.chooseSearch.tr(),
                font: 14,
                color: ColorApp.hintGray,
                family: TextFontApp.regularFont,
              ),
              SizedBox(height: 40,),
              Expanded(
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index)=>GestureDetector(
                      onTap: () {
                       setState(() {
                         BlocProvider.of<SearchBloc>(context).type = searchKey[index];
                         print(  BlocProvider.of<SearchBloc>(context).type);
                       });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainText(
                              text: types[index],
                              font: 14,
                              family: TextFontApp.boldFont,
                            ),
                            BlocProvider.of<SearchBloc>(context).type==searchKey[index] ?
                                Icon(Icons.check_circle,color: ColorApp.green,)
                            :SizedBox()
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (_,c)=>Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    ),
                    itemCount: types.length),
              ),
              AppButton(title:  LocaleKeys.search.tr(),height: 45.h,onPressed: (){
                if( BlocProvider.of<SearchBloc>(context).key ==null){
                  RouteManager.pop();
                  showSnackBar("empty search field");
                }else{
                  BlocProvider.of<SearchBloc>(context)
                    ..add(GetSearch());
                  RouteManager.pop();
                }

              },),


              SizedBox(
                height: 10,
              ),

            ],
          )),
    );
  }
}
