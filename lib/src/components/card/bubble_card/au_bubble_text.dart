import 'package:arce_ui/src/components/text/au_expandable_text.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:flutter/material.dart';

/// 具备展开收起功能的气泡背景文字面板
/// 气泡：背景色为Color(0xFFF8F8F8)的灰色Container
///      右上角为不规则小三角
///
/// 布局规则：
///     组件的背景是气泡背景
///     包装了[AuExpandableText]组件，具备了展开收起的能力
///
/// ```dart
///   AuBubbleText(
///      text: '在文本的右下角有更多或者收起按钮',
///   )
///
///   AuBubbleText(
///      text: '具备展开收起功能的文字面板，在文本的右下角有更多或者收起按钮',
///      maxLines: 2,
///   )
///
/// ```
///
/// 相关文本组件如下:
///  * [AuExpandableText], 气泡背景的展开收起文本组件
///  * [AuInsertInfo], 气泡背景的文本组件
///
class AuBubbleText extends StatelessWidget {
  /// 显示的文本
  final String text;

  ///最多显示的行数
  final int? maxLines;

  ///展开收起回调
  final TextExpandedCallback? onExpanded;

  /// 气泡的圆角 默认是4
  final double radius;

  /// 气泡背景色  默认是 Color(0xFFF8F8F8)
  final Color bgColor;

  /// 内容文本样式
  final TextStyle? textStyle;

  /// create AuBubbleText
  const AuBubbleText(
      {super.key,
      this.text = '',
      this.maxLines,
      this.onExpanded,
      this.radius = 4,
      this.bgColor = const Color(0xFFF8F8F8),
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    Image image = BrunoTools.getAssetImageWithColor(
        'icons/icon_right_top_pointer.png', bgColor);
    Widget bubbleText = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        image,
        _buildExpandedWidget(),
      ],
    );
    return bubbleText;
  }

  Widget _buildExpandedWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(0),
                    topRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius))),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
            child: AuExpandableText(
              text: text,
              maxLines: maxLines,
              color: bgColor,
              onExpanded: onExpanded,
              textStyle: textStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AuThemeConfigurator.instance
                        .getConfig()
                        .commonConfig
                        .colorTextBase,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
