import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/utils/css/au_core_funtion.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 富文本填充生成器

/// 用于链式去生成富文本样式的文案 如果是直接的标签可以用css
class AuRichTextGenerator {
  AuRichTextGenerator();

  final List<InlineSpan> _spanList = [];
  int _maxLine = 100;
  TextOverflow? _overflow;

  /// 添加超链接部分的文案
  /// [text] 显示的文案
  /// [url] 超链接的 url
  /// [textStyle] 文案的样式
  /// [linkColor] 超链接的颜色
  /// [fontSize] 显示大小
  /// [fontWeight] 字体粗细
  /// [richTextLinkClick] 超链接点击的回调
  AuRichTextGenerator addTextWithLink(
    String text, {
    String? url,
    TextStyle? textStyle,
    Color? linkColor,
    double? fontSize,
    FontWeight? fontWeight,
    AuHyperLinkCallback? richTextLinkClick,
  }) {
    _spanList.add(
      TextSpan(
        style: textStyle ??
            TextStyle(
              color: linkColor ??
                  AuThemeConfigurator.instance
                      .getConfig()
                      .commonConfig
                      .brandPrimary,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 16,
            ),
        text: text,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (richTextLinkClick != null) {
              richTextLinkClick(text, url);
            }
          },
      ),
    );
    return this;
  }

  /// 添加自定义文案
  /// [text] 显示的文案
  /// [textStyle] 文案的样式
  /// [fontWeight] 字体的粗细 默认是 normal
  /// [fontSize] 文案大小 默认是16
  /// [color] 文案的颜色 默认是深黑色
  AuRichTextGenerator addText(
    String text, {
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    _spanList.add(
      TextSpan(
        text: text,
        style: textStyle ??
            TextStyle(
              color: color ??
                  AuThemeConfigurator.instance
                      .getConfig()
                      .commonConfig
                      .colorTextBase,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
      ),
    );
    return this;
  }

  /// [icon] 图标
  /// [alignment] 图标的对齐方式 默认是顶部对齐
  AuRichTextGenerator addIcon(
    Widget? icon, {
    PlaceholderAlignment? alignment,
  }) {
    _spanList.add(
      WidgetSpan(
        alignment: alignment ?? PlaceholderAlignment.top,
        child: icon ?? const SizedBox.shrink(),
      ),
    );
    return this;
  }

  /// 设置最多文案显示几行 默认是100行
  AuRichTextGenerator setMaxLines(int maxLine) {
    if (maxLine > 0) {
      _maxLine = maxLine;
    }
    return this;
  }

  /// 设置文案溢出的样式
  AuRichTextGenerator setTextOverflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  /// build出福文本
  Widget build() {
    if (_spanList.isEmpty) {
      return const SizedBox.shrink();
    }
    return ExcludeSemantics(
      excluding: true,
      child: Text.rich(
        TextSpan(children: _spanList),
        maxLines: _maxLine,
        overflow: _overflow,
      ),
    );
  }

  /// 清空文案
  void clear() {
    _spanList.clear();
  }
}
