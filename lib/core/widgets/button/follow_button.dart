import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/cubit/follow_cubit.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';

import '../../app_storage/app_storage.dart';
import '../../constant/app_assets.dart';
import '../../theme/color_app.dart';
import 'button_app.dart';

class FollowButton extends StatefulWidget {
  final int id;
  final bool isFollow;
  final String type;
  final Color color;
  final double? width;
  final double? height;

  const FollowButton(
      {Key? key,
      required this.id,
      required this.type,
      required this.color,
      this.width,
      required this.isFollow,
      this.height})
      : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool loading = false;
  bool? isFollow;
  @override
  void initState() {
    isFollow = widget.isFollow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowCubit, BaseState>(
      listener: (_, state) {
        if (state is SuccessState) {
          setState(() {
            loading = false;
            isFollow = !isFollow!;
          });
        }
      },
      builder: (context, state) {
        final cubit = FollowCubit.of(context);
        return AppStorage.isLogged == false
            ? SizedBox()
            : loading == true
                ? SizedBox(
                    height: 15,
                    child: ColorLoader(
                      radius: 8,
                      dotRadius: 2,
                    ))
                : AppButton(
                    title: isFollow == true
                        ? LocaleKeys.unfollow.tr()
                        : LocaleKeys.follow.tr(),
                    height: widget.height ?? 35.h,
                    color: widget.color ?? ColorApp.yellow,
                    // width: widget.width,
                    horText: 5,
                    icon: isFollow == true
                        ? ProfileIcons.add
                        : ProfileIcons.remove,
                    font: 12,
                    onPressed: () {
                      setState(() {
                        loading = true;
                      });
                      cubit.toggleFollow(id: widget.id, type: widget.type);
                    },
                  );
      },
    );
  }
}
