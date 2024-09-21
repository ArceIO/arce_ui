import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef TextExpandedCallback = Function(bool);

/// 具备展开收起功能的文字面板
///
/// 布局规则：
///     在文本的右下角有更多或者收起按钮
///     当文本超过指定的[maxLines]时，剩余文本隐藏
///     点击更多，则显示全部文本
///
/// ```dart
///   AuExpandableText(
///      text: '在文本的右下角有更多或者收起按钮',
///   )
///
///   AuExpandableText(
///      text: '具备展开收起功能的文字面板，在文本的右下角有更多或者收起按钮',
///      maxLines: 2,
///      onExpanded: (value) {
///      },
///   )
///
///
/// ```
///
/// 相关文本组件如下:
///  * [AuBubbleText], 气泡背景的展开收起文本组件
///  * [AuInsertInfo], 气泡背景的文本组件
///
class AuExpandableText extends StatefulWidget {
  ///显示的文本
  final String text;

  ///显示的最多行数
  final int? maxLines;

  /// 文本的样式
  final TextStyle? textStyle;

  /// 展开或者收起的时候的回调
  final TextExpandedCallback? onExpanded;

  /// 更多按钮渐变色的初始色 默认白色
  final Color? color;

  const AuExpandableText(
      {super.key,
      required this.text,
      this.maxLines = 1000000,
      this.textStyle,
      this.onExpanded,
      this.color});

  @override
  _AuExpandableTextState createState() => _AuExpandableTextState();
}

class _AuExpandableTextState extends State<AuExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = _defaultTextStyle();
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: widget.text, style: style);
        final tp = TextPainter(
            text: span,
            maxLines: widget.maxLines,
            textDirection: TextDirection.ltr,
            ellipsis: 'EllipseText');
        tp.layout(maxWidth: size.maxWidth);
        if (tp.didExceedMaxLines) {
          if (_expanded) {
            return _expandedText(context, widget.text);
          } else {
            return _foldedText(context, widget.text);
          }
        } else {
          return _regularText(widget.text, style);
        }
      },
    );
  }

  Widget _foldedText(context, String text) {
    return Stack(
      children: <Widget>[
        Text(
          widget.text,
          style: _defaultTextStyle(),
          maxLines: widget.maxLines,
          overflow: TextOverflow.clip,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: _clickExpandTextWidget(context),
        )
      ],
    );
  }

  Widget _clickExpandTextWidget(context) {
    Color btnColor = widget.color ?? Colors.white;

    Text tx = Text(
      AuIntl.of(context).localizedResource.more,
      style: TextStyle(
          color: AuThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .brandPrimary,
          fontSize: 14),
    );
    Container cnt = Container(
      padding: const EdgeInsets.only(left: 22),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [btnColor.withAlpha(100), btnColor, btnColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
      child: tx,
    );
    return GestureDetector(
      child: cnt,
      onTap: () {
        setState(() {
          _expanded = true;
          if (null != widget.onExpanded) {
            widget.onExpanded!(_expanded);
          }
        });
      },
    );
  }

  Widget _expandedText(context, String text) {
    return RichText(
        text: TextSpan(text: text, style: _defaultTextStyle(), children: [
          _foldButtonSpan(context),
        ]), textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor));
  }

  TextStyle _defaultTextStyle() {
    TextStyle style = widget.textStyle ??
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AuThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .colorTextBase,
        );
    return style;
  }

  InlineSpan _foldButtonSpan(context) {
    return TextSpan(
        text: ' ${AuIntl.of(context).localizedResource.collapse}',
        style: TextStyle(
          color: AuThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .brandPrimary,
          fontSize: 14,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            setState(() {
              _expanded = false;
              if (null != widget.onExpanded) {
                widget.onExpanded!(_expanded);
              }
            });
          });
  }

  Widget _regularText(text, style) {
    return Text(text, style: style);
  }
}
