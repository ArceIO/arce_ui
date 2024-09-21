import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:flutter/widgets.dart';

/// 文本工具类
class AuTextUtil {
  const AuTextUtil._();

  /// 根据 TextStyle 计算 text 宽度。
  static Size textSize(String text, TextStyle style) {
    if (BrunoTools.isEmpty(text)) return const Size(0, 0);
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
