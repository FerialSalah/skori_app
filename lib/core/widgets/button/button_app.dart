import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_app.dart';
import '../../theme/textFont_app.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String? icon;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? hor;
  final double? ver;
  final double? verText;
  final double? horText;
  final double? font;
  final Color? icon_color;
  AppButton(
      {this.onPressed,
      required this.title,
      this.icon_color,
      this.color,
      this.width,
      this.hor,
      this.height,
      this.font,
      this.textColor,
      this.borderColor,
      this.ver,
      this.verText,
      this.icon,
      this.horText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: hor == null ? 0 : hor!,
            vertical: ver == null ? 0 : ver!),
        padding: EdgeInsets.symmetric(
            vertical: verText ?? 0, horizontal: horText ?? 0),
        height: height ?? 45,
        width: width,
        decoration: BoxDecoration(
          color: color ?? ColorApp.primary,
          borderRadius: BorderRadius.circular(0),
          // border: Border.all(width: 1,
          //     color:borderColor!)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null
                ? SizedBox()
                : icon_color == null
                    ? Image.asset(
                        icon!,
                        height: 15.h,
                        width: 15.w,
                      )
                    : Image.asset(
                        icon!,
                        height: 15.h,
                        width: 15.w,
                        color: icon_color,
                      ),
            icon == null
                ? SizedBox()
                : SizedBox(
                    width: 5,
                  ),
            Text(
              title,
              style: TextStyle(
                  color: textColor ?? ColorApp.white,
                  fontFamily: TextFontApp.semiBoldFont,
                  fontSize: font ?? 16),
            ),
          ],
        ),
      ),
    );
  }
}
