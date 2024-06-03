import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_bloc.dart';

import '../../../../../core/theme/color_app.dart';
import '../../generated/locale_keys.g.dart';
import '../../modules/teams/domain/entity/team_entity.dart';
import '../theme/textFont_app.dart';
import 'main_text.dart';

class DropDownTextField extends StatefulWidget {
  final List<dynamic>? items;
  final List<TeamEntity>? teams;

  final List? staticItems;
  final Function(dynamic)? onChanged;
  final String hint;
  final String? title;
  final String? teamName;
  final String? icon;
  final Function()? onTap;
  final bool isModel;
  final bool team;
  final bool? country;
  final bool? season;
  final double? paddingHor;
  final double? paddingVer;
  final Color? fillColor;
  final bool isFilterMatchTeam;

  const DropDownTextField({
    required this.hint,
    this.teamName,
    this.items,
    this.onChanged,
    this.onTap,
    this.isModel = false,
    this.icon,
    this.paddingHor,
    this.paddingVer,
    this.fillColor,
    this.staticItems,
    this.teams,
    this.title,
    required this.team,
    this.country,
    this.season, required this.isFilterMatchTeam,
  });

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  String? value;



  String itemSelected = LocaleKeys.teams.tr();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.paddingVer ?? 0, horizontal: widget.paddingHor ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null
              ? SizedBox()
              : MainText(
                  text: widget.title,
                  font: 14,
                  color: ColorApp.black,
                  family: TextFontApp.semiBoldFont,
                ),
          widget.title == null
              ? SizedBox()
              : SizedBox(
                  height: 15,
                ),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2),
              decoration: BoxDecoration(
                color: widget.fillColor ?? ColorApp.white,
                border: Border.all(
                  color: ColorApp.borderGray,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(1),
              ),
              child: Row(
                children: [
                  Image.asset(
                    widget.icon!,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  !widget.isFilterMatchTeam
                      ? Expanded(
                          child: DropdownButton<String>(
                            value: value,
                            borderRadius: BorderRadius.circular(8),
                            dropdownColor: widget.fillColor ?? ColorApp.white,
                            iconEnabledColor: ColorApp.primary,
                            iconSize: 25,
                            isExpanded: true,
                            underline: const SizedBox(height: 0),
                            hint: Text(
                              widget.hint,
                              style: TextStyle(
                                  color: ColorApp.primary,
                                  fontSize: 14,
                                  fontFamily: TextFontApp.regularFont),
                            ),
                            items: widget.isModel == false
                                ? widget.staticItems!
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          onTap: () {
                                            setState(() {
                                              value = e;
                                            });
                                          },
                                          child: Text(e.toString()),
                                        ))
                                    .toList()
                                : widget.items!
                                    .map((e) => DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              value = e.id.toString();
                                            });
                                          },
                                          value: e.id.toString(),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                widget.team == true
                                                    ? Image.network(
                                                        e.logo,
                                                        height: 30,
                                                        width: 30,
                                                      )
                                                    : widget.country == true
                                                        ? Image.network(
                                                            e.image,
                                                            height: 30,
                                                            width: 30,
                                                          )
                                                        : SizedBox(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  widget.team == true
                                                      ? e.name
                                                      : widget.country == true
                                                          ? e.text
                                                          : widget.season ==
                                                                  true
                                                              ? e.name
                                                              : e.title,
                                                  style: TextStyle(
                                                    color: ColorApp.black,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        TextFontApp.mediumFont,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                    .toList(),
                            onChanged: widget.onChanged,
                          ),
                        )
                      : Expanded(
                          child: DropdownSearch<dynamic>(
                            items: widget.teams!.map((e){
                              return e.name;

                            }).toList(),
                            popupProps: PopupProps.dialog(
                                showSearchBox: true,
                                dialogProps: DialogProps(
                                  buttonPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                ),
                                title: MainText(
                                  family: TextFontApp.mediumFont,
                                  text: widget.hint,
                                ),
                                searchFieldProps: TextFieldProps(),
                                // itemBuilder: (context, team, bool i) {
                                //   return Padding(
                                //     padding: EdgeInsets.all(10),
                                //     child: Row(
                                //       children: [
                                //         Image.network(
                                //           team.logo,
                                //           height: 30,
                                //           width: 30,
                                //         ),
                                //         SizedBox(
                                //           width: 10,
                                //         ),
                                //         Text(
                                //           team.name,
                                //           style: TextStyle(
                                //             color: ColorApp.black,
                                //             fontSize: 14,
                                //             fontFamily: TextFontApp.mediumFont,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   );
                                // }
                              ),

                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                                  baseStyle: TextStyle(
                                    fontFamily: "LsMedium"
                                  ),
                              dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,

                              ),
                            ),

                            onChanged: (team){
                              print(team);
                              setState(() {
                                print("valllll :${team}");

                              });
                               final teamSelected= widget.teams!.singleWhere((e)=>e.name==team);
                               setState(() {
                                 itemSelected=teamSelected.name;
                               });
                              BlocProvider.of<MatchesBloc>(context).teamId = teamSelected.id.toString();

                            },
                            selectedItem: itemSelected,
                            dropdownBuilder: (context, item) {

                              return Text(
                                item,
                                style: TextStyle(
                                  fontFamily: TextFontApp.mediumFont,
                                ),
                              );
                            },

                            //  dropdownBuilder  : _customDropDownBuilder
                          ),
                        ),
                  //     :
                  // Expanded(
                  //         child: Padding(
                  //         padding: EdgeInsets.all(20),
                  //         child: DropdownSearch<dynamic>(
                  //           items: widget.items!,
                  //           popupProps: PopupProps.menu(
                  //               showSearchBox: true,
                  //               //   showSelectedItems: true,
                  //               title: MainText(
                  //                 text: widget.hint,
                  //               ),
                  //               searchFieldProps: TextFieldProps()),
                  //
                  //           // dropdownDecoratorProps: DropDownDecoratorProps(
                  //           //   textAlignVertical: TextAlignVertical.center,
                  //           //   dropdownSearchDecoration: InputDecoration(
                  //           //       enabledBorder: OutlineInputBorder(
                  //           //           borderRadius: BorderRadius.circular(20),
                  //           //           borderSide: BorderSide(color: Colors.grey)),
                  //           //       border: OutlineInputBorder(
                  //           //         borderRadius: BorderRadius.circular(20),
                  //           //       )),
                  //           // ),
                  //           onChanged: widget.onChanged,
                  //           selectedItem: widget.hint,
                  //         ),
                  //       ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
