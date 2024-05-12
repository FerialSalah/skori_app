import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_assets.dart';
import '../constant/constants.dart';
import '../theme/color_app.dart';
import '../theme/textFont_app.dart';


class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? upperText;
  final TextInputType? type;
  final Function(String?)? onChange;
  final String? Function(String?)? valid;
  final String? icon;
  final String? eIcon;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final VoidCallback? onTap;
  final String? dIcon;
  final  FocusNode? focus;
  final bool? read;
  final bool? withBorder;
  final int? line;
  final double? hor;
  final double? ver;
  final double? height;
  final Color? fillColor;
  final String? errorKey;
  final Map<String,dynamic>? errors;

  CustomTextField({ this.hint, this.onChange, this.onTap,
    this.icon, this.type,  this.valid,  this.controller, this.focus,
    this.dIcon, this.read, this.eIcon, this.hor, this.fillColor, this.line, this.ver,
    this.textDirection, this.errorKey, this.errors, this.upperText, this.withBorder, this.height,});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.upperText != null)
          Padding(
            padding:  EdgeInsets.only(bottom: 15.sp),
            child: Text(widget.upperText!,
                style: TextStyle(fontFamily: TextFontApp.mediumFont,
                    color: ColorApp.black,
                    fontSize: 14.sp)),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:widget.hor==null?
          0:widget.hor!,vertical:widget.ver==null?0:widget.ver!),
          child:SizedBox(
            height: widget.height??null,
            child: TextFormField(
              onTap: widget.onTap,
              validator: widget.valid,
              controller: widget.controller,
              cursorColor: ColorApp.black,
              focusNode: widget.focus,
              readOnly: widget.read==true?true:false,
              maxLines: widget.line??1,
              obscureText: widget.icon !=null  ? _isHidden : false,
              keyboardType:widget.type, onChanged: (widget.onChange),
               style: TextStyle(color: ColorApp.black,fontSize: 16),
              decoration: InputDecoration(
                hintText: widget.hint,
                errorText: _getErrorText(widget.errorKey??""),
                prefixIconConstraints:BoxConstraints(
                  minWidth: 20,
                  minHeight: 10
                ),
                prefixIcon: widget.dIcon!=null?
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 0),
                  child: Image.asset(
                    widget.dIcon!,height: 20,width: 20,),
                ):null,
                suffixIcon: widget.icon != null
                    ? IconButton(
                  onPressed: _visibility,
                  alignment: Alignment.center,
                  icon: _isHidden
                      ? Image.asset(AppIcons.disEye,height: 20,color: ColorApp.hintGray,)
                      : Image.asset(AppIcons.eye,height: 15,color: ColorApp.yellow,),
                ): widget.eIcon!=null? Image.asset(getAsset(widget.eIcon!),height: 10,width: 10,
                color: ColorApp.primary,):null,
                fillColor:widget.fillColor??ColorApp.white,
                filled: true,
                hintStyle: TextStyle(fontSize: 14.sp,color:
                ColorApp.hintGray, fontFamily: TextFontApp.regularFont,),
                enabledBorder:OutlineInputBorder (
                  borderSide: BorderSide(color:ColorApp.borderGray,width: widget.withBorder==false?0:1),
                  borderRadius: BorderRadius.circular(1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:ColorApp.borderGray,width: widget.withBorder==false?0:1),
                  borderRadius: BorderRadius.circular(1),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red,width: widget.withBorder==false?0:1),
                   borderRadius: BorderRadius.circular(1),

                ),

              ),
            ),
          ),
        ),
      ],
    );
  }
  String? _getErrorText(String key) {
    if (widget.errors != null) {
      return widget.errors!.keys.contains(key) ? widget.errors![key][0] : null;
    } else {
      return null;
    }
  }
}
