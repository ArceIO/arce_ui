import 'package:arce_ui/src/theme/configs/au_dialog_config.dart';
import 'package:flutter/material.dart';

/// 弹窗的工具类
class AuDialogUtils {
  /// dialog标题配置
  static TextStyle getDialogTitleStyle(AuDialogConfig themeData) {
    return themeData.titleTextStyle.generateTextStyle();
  }

  /// dialog圆角配置
  static double getDialogRadius(AuDialogConfig themeData) {
    return themeData.radius;
  }
}
