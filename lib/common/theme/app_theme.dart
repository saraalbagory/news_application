import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';
import 'package:news_application/main.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainGreen),
      appBarTheme: AppBarTheme(
       // color: Colors.white,
        centerTitle: true,
        backgroundColor: AppColors.mainGreen,
        titleTextStyle: TextStyle(color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
        ),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
        ),
        iconTheme:const  IconThemeData(
          color: Colors.white
        )
      ));
}
