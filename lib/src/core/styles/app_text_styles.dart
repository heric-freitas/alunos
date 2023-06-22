import 'package:alunos/src/core/styles/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;

  AppTextStyles._();
  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get textThin => TextStyle(
        fontWeight: FontWeight.w100,
        color: AppColor.instance.white,
      );
  TextStyle get textExtraLight => TextStyle(
        fontWeight: FontWeight.w200,
        color: AppColor.instance.white,
      );
  TextStyle get textLight => TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColor.instance.white,
      );
  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        color: AppColor.instance.white,
      );
  TextStyle get textMedium => TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColor.instance.white,
      );
  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColor.instance.white,
      );
  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColor.instance.white,
      );
  TextStyle get textExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        color: AppColor.instance.white,
      );
  TextStyle get textBlack => TextStyle(
        fontWeight: FontWeight.w900,
        color: AppColor.instance.white,
      );

  TextStyle get headlineBold => textBold.copyWith(fontSize: 24);
  TextStyle get subtitle3 => textBold.copyWith(fontSize: 10);
  TextStyle get subtitle2 => textBold.copyWith(fontSize: 12);
  TextStyle get subtitle1 => textBold.copyWith(fontSize: 14);
  TextStyle get body3 => textRegular.copyWith(fontSize: 10);
  TextStyle get body2 => textRegular.copyWith(fontSize: 12);
  TextStyle get body1 => textRegular.copyWith(fontSize: 14);
  TextStyle get caption => textRegular.copyWith(fontSize: 8);
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
