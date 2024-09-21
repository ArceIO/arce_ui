import 'package:arce_ui/src/utils/css/au_core_funtion.dart';
import 'package:flutter/material.dart';

/// 将CSS格式的标签转为文本
class AuCSS2Text {
  const AuCSS2Text._();

  static TextSpan toTextSpan(
    String htmlContent, {
    AuHyperLinkCallback? linksCallback,
    TextStyle? defaultStyle,
  }) {
    return TextSpan(
      children: AuConvert(
        htmlContent,
        linkCallBack: linksCallback,
        defaultStyle: defaultStyle,
      ).convert(),
    );
  }

  static Text toTextView(
    String htmlContent, {
    AuHyperLinkCallback? linksCallback,
    TextStyle? defaultStyle,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) {
    return Text.rich(
      toTextSpan(
        htmlContent,
        linksCallback: linksCallback,
        defaultStyle: defaultStyle,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverflow ?? TextOverflow.clip,
    );
  }
}
