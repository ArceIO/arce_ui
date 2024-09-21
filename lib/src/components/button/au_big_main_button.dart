import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:flutter/material.dart';

import 'au_normal_button.dart';

/// 页面中的主按钮,支持动态设置背景颜色，置灰
///
/// 和[AuSmallMainButton]相比，该按钮是占据父节点分配的最大可用空间，按钮文案居中对齐
///
/// 按钮是圆角矩形的形状，不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// 大的 提交 按钮
/// AuBigMainButtonWidget(
///    title: '提交',
/// )
///
/// AuBigMainButtonWidget(
///   title: '提交',
///   isEnable: false,
///   onTap: () {
///     AuToast.show('点击了主按钮', context);
///   },
/// ),

/// 其他按钮如下：
///  * [AuBigGhostButton], 大主色调的幽灵按钮
///  * [AuBigOutlineButton], 大边框按钮
class AuBigMainButton extends StatelessWidget {
  ///按钮显示文案,默认'确认'
  final String? title;

  ///是否可用,false 是置灰效果
  final bool isEnable;

  ///点击回调
  final VoidCallback? onTap;

  ///默认父布局可用空间
  final double? width;

  ///背景颜色
  final Color? bgColor;

  /// button theme config
  final AuButtonConfig? themeData;

  /// create AuBigMainButton
  const AuBigMainButton({
    super.key,
    this.title,
    this.width,
    this.isEnable = true,
    this.onTap,
    this.themeData,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    AuButtonConfig defaultThemeConfig = themeData ?? AuButtonConfig();

    defaultThemeConfig = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeConfig.configId)
        .buttonConfig
        .merge(defaultThemeConfig);

    return AuNormalButton(
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity,
          height: defaultThemeConfig.bigButtonHeight),
      alignment: Alignment.center,
      isEnable: isEnable,
      text: title ?? AuIntl.of(context).localizedResource.confirm,
      borderRadius:
          BorderRadius.all(Radius.circular(defaultThemeConfig.bigButtonRadius)),
      fontSize: defaultThemeConfig.bigButtonFontSize,
      backgroundColor: bgColor ?? defaultThemeConfig.commonConfig.brandPrimary,
      disableBackgroundColor: const Color(0xFFCCCCCC),
      onTap: onTap,
      textColor: Colors.white,
      disableTextColor:
          defaultThemeConfig.commonConfig.colorTextBaseInverse.withOpacity(0.7),
    );
  }
}
