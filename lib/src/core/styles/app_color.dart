import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;

  AppColor._();
  static AppColor get instance {
    _instance ??= AppColor._();
    return _instance!;
  }

  Color get primary => const Color(0xFF65858D);
  Color get white => const Color(0xFFFFFFFF);
}

extension AppColorExtensions on BuildContext {
  AppColor get appColor => AppColor.instance;
}