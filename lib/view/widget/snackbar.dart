import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';


  void customSnackBar({required ctx,required text}){
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(text,
        style: ElaTextStyle.subTitle,),
        backgroundColor: ElaColors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
    ),
        ),
    );
   
  }
