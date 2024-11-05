import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';


  void customSnackBar({required ctx,required text,required color,}){
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(text,
        style: ElaTextStyle.subTitle,),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
    ),
        ),
    );
   
  }
