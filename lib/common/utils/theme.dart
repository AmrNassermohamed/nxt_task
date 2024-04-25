import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nxt_task/common/constants/color_constants.dart';
import 'dart:io' as IO;

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: ColorConstant.whiteColor,
      secondary: ColorConstant.blackColor,
      background: ColorConstant.whiteColor,
      onPrimary: ColorConstant.grey,
      onSecondary: ColorConstant.grey6,
      outline: ColorConstant.grey7,
      onPrimaryContainer: ColorConstant.grey11,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: ColorConstant.blackColor,
      secondary: ColorConstant.whiteColor,
      background: ColorConstant.grey4,
      onSecondary: ColorConstant.grey5,
      onPrimary: ColorConstant.blackColor,
      outline: ColorConstant.grey8,
      onPrimaryContainer: ColorConstant.grey9,
    ),
  );
}

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);
  bool isIos = IO.Platform.isIOS;

  // Toggle between light and dark themes
  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
