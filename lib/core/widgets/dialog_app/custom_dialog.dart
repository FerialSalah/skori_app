import 'package:flutter/material.dart';

import '../../routes/navigator_push.dart';


Future<void> CustomDialog({Widget? theDialog,bool? dismiss}){
  return showDialog(
       barrierDismissible: dismiss==true?true:false,
      context: RouteManager.currentContext,
      builder: (_) => theDialog!);
}