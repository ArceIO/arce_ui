import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:flutter/material.dart';

/// 用于分割页面组件元素的横向分割线
/// 支持自定义颜色、左右间距、和高度
///
/// 系统提供的[Divider]组件，当设置的高度过大时，会出现中间一条线，
///
/// ```dart
///   AuLine()
///
///   AuLine(
///      leftInset: 20,
///   )
///
/// ```
///
/// 相关分割线如下:
///
class AuLine extends StatelessWidget {
  /// 分割线的或者分割条的颜色 可以通过[AuThemeConfigurator]配置默认颜色
  final Color? color;

  /// 分割线的或者分割条的高度 默认0.5
  final double height;

  /// 左边缩进距离
  final double leftInset;

  /// 右边缩进距离
  final double rightInset;

  const AuLine({
    super.key,
    this.color,
    this.height = 0.5,
    this.leftInset = 0,
    this.rightInset = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftInset, right: rightInset),
      child: Divider(
        thickness: height,
        height: height,
        color: color ??
            AuThemeConfigurator.instance
                .getConfig()
                .commonConfig
                .dividerColorBase,
      ),
    );
  }
}
