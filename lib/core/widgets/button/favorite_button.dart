import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/cubit/favorite_cubit.dart';

import '../../app_storage/app_storage.dart';
import '../../constant/app_assets.dart';
import '../../state/base_state.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final int id;
  final String type;
  const FavoriteButton(
      {Key? key,
      required this.isFavorite,
      required this.id,
      required this.type})
      : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool? isFav;
  @override
  void initState() {
    isFav = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = FavoriteCubit.of(context);
    return  AppStorage.isLogged==false?SizedBox():BlocConsumer<FavoriteCubit, BaseState>(
      listener: (context, state) {
        if (state is SuccessState) {
          setState(() {
            isFav = !isFav!;
          });
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            cubit.toggleFavorite(id: widget.id, type: widget.type);
          },
          child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                isFav==true?ProfileIcons.fillFav:ProfileIcons.favorite,
                height: 18.h,
                width: 20.w,
              )),
        );
      },
    );
  }
}
