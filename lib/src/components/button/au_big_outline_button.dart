import 'package:arce_ui/src/components/button/au_big_ghost_button.dart';
import 'package:arce_ui/src/components/button/au_normal_button.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:flutter/material.dart';

/// 页面的边框按钮,没有背景颜色，占据父节点分配的最大空间
///
/// 按钮是圆角矩形的形状，不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// AuBigOutlineButtonWidget(
///    title: '提交',
/// )
///
/// AuBigOutlineButtonWidget(
///   title: '提交',
///   isEnable: false,
///   onTap: () {
///     AuToast.show('点击了AuBigOutlineButtonWidget', context);
///   },
/// ),
///
/// 其他按钮如下：
///  * [AuBigMainButton], 大主色调按钮
///  * [AuBigGhostButton], 大幽灵按钮
///

/// 默认线宽
const double _BBorderWith = 1;

class AuBigOutlineButton extends StatelessWidget {
  ///按钮显示文案,默认'确认'
  final String? title;

  ///边框的颜色
  final Color? lineColor;

  ///点击回调
  final VoidCallback? onTap;

  ///显示的文案的颜色
  final Color? textColor;

  ///是否可用，默认为true。false为不可用：置灰、不可点击。
  final bool isEnable;

  ///默认父布局可用空间
  final double? width;
  final AuButtonConfig? themeData;

  const AuBigOutlineButton({
    super.key,
    this.title,
    this.lineColor,
    this.textColor,
    this.isEnable = true,
    this.width,
    this.onTap,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    AuButtonConfig defaultThemeConfig = themeData ?? AuButtonConfig();

    defaultThemeConfig = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeConfig.configId)
        .buttonConfig
        .merge(defaultThemeConfig);

    Color? lineColor =
        this.lineColor ?? defaultThemeConfig.commonConfig.borderColorBase;

    return AuNormalButton.outline(
      borderWith: _BBorderWith,
      radius: defaultThemeConfig.bigButtonRadius,
      text: title ?? AuIntl.of(context).localizedResource.confirm,
      disableLineColor: lineColor,
      lineColor: lineColor,
      textColor: textColor ?? defaultThemeConfig.commonConfig.colorTextBase,
      disableTextColor: const Color(0xFFCCCCCC),
      isEnable: isEnable,
      alignment: Alignment.center,
      fontWeight: FontWeight.bold,
      fontSize: defaultThemeConfig.bigButtonFontSize,
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity,
          height: defaultThemeConfig.bigButtonHeight),
      onTap: onTap,
      backgroundColor: Colors.white,
      disableBackgroundColor: const Color(0xffcccccc).withOpacity(0.1),
    );
  }
}
