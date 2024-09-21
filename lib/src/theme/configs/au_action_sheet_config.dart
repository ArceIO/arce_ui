import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';

/// AuActionSheet 主题配置
class AuActionSheetConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultActionSheetConfig]
  AuActionSheetConfig({
    AuTextStyle? titleStyle,
    AuTextStyle? itemTitleStyle,
    AuTextStyle? itemTitleStyleLink,
    AuTextStyle? itemTitleStyleAlert,
    AuTextStyle? itemDescStyle,
    AuTextStyle? itemDescStyleLink,
    AuTextStyle? itemDescStyleAlert,
    AuTextStyle? cancelStyle,
    double? topRadius,
    EdgeInsets? contentPadding,
    EdgeInsets? titlePadding,
    super.configId,
  })  : _titleStyle = titleStyle,
        _itemTitleStyle = itemTitleStyle,
        _itemTitleStyleLink = itemTitleStyleLink,
        _itemTitleStyleAlert = itemTitleStyleAlert,
        _itemDescStyle = itemDescStyle,
        _itemDescStyleLink = itemDescStyleLink,
        _itemDescStyleAlert = itemDescStyleAlert,
        _cancelStyle = cancelStyle,
        _topRadius = topRadius,
        _contentPadding = contentPadding,
        _titlePadding = titlePadding;

  /// ActionSheet 的顶部圆角
  /// 默认值为 [AuCommonConfig.radiusLg]
  double? _topRadius;

  /// 标题样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _titleStyle;

  /// 元素标题默认样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize:[AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _itemTitleStyle;

  /// 元素标题链接样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorLink],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemTitleStyleLink;

  /// 元素警示项标题样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandError],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemTitleStyleAlert;

  /// 元素描述默认样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemDescStyle;

  /// 元素标题描述链接样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorLink],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemDescStyleLink;

  /// 元素警示项标题描述样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandError],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemDescStyleAlert;

  /// 取消按钮样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _cancelStyle;

  /// 内容左右间距
  ///
  /// EdgeInsets.symmetric(horizontal: 60, vertical: 12)
  EdgeInsets? _contentPadding;

  /// 标题左右间距
  ///
  /// EdgeInsets.symmetric(horizontal: 60, vertical: 16)
  EdgeInsets? _titlePadding;

  double get topRadius =>
      _topRadius ?? AuDefaultConfigUtils.defaultActionSheetConfig.topRadius;

  AuTextStyle get titleStyle =>
      _titleStyle ?? AuDefaultConfigUtils.defaultActionSheetConfig.titleStyle;

  AuTextStyle get itemTitleStyle =>
      _itemTitleStyle ??
      AuDefaultConfigUtils.defaultActionSheetConfig.itemTitleStyle;

  AuTextStyle get itemTitleStyleLink =>
      _itemTitleStyleLink ??
      AuDefaultConfigUtils.defaultActionSheetConfig.itemTitleStyleLink;

  AuTextStyle get itemTitleStyleAlert =>
      _itemTitleStyleAlert ??
      AuDefaultConfigUtils.defaultActionSheetConfig.itemTitleStyleAlert;

  AuTextStyle get itemDescStyle =>
      _itemDescStyle ??
      AuDefaultConfigUtils.defaultActionSheetConfig.itemDescStyle;

  AuTextStyle get itemDescStyleLink =>
      _itemDescStyleLink ??
      AuDefaultConfigUtils.defaultActionSheetConfig.itemDescStyleLink;

  AuTextStyle get itemDescStyleAlert =>
      _itemDescStyleAlert ??
      AuDefaultConfigUtils.defaultActionSheetConfig.itemDescStyleAlert;

  AuTextStyle get cancelStyle =>
      _cancelStyle ?? AuDefaultConfigUtils.defaultActionSheetConfig.cancelStyle;

  EdgeInsets get contentPadding =>
      _contentPadding ??
      AuDefaultConfigUtils.defaultActionSheetConfig.contentPadding;

  EdgeInsets get titlePadding =>
      _titlePadding ??
      AuDefaultConfigUtils.defaultActionSheetConfig.titlePadding;

  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局组件配置
    AuActionSheetConfig actionSheetConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .actionSheetConfig;

    _titlePadding ??= actionSheetConfig.titlePadding;
    _contentPadding ??= actionSheetConfig.contentPadding;
    _titleStyle = actionSheetConfig.titleStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_titleStyle),
    );
    _itemTitleStyle = actionSheetConfig.itemTitleStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_itemTitleStyle),
    );
    _itemTitleStyleLink = actionSheetConfig.itemTitleStyleLink.merge(
      AuTextStyle(
        color: commonConfig.colorLink,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_itemTitleStyleLink),
    );
    _itemTitleStyleAlert = actionSheetConfig.itemTitleStyleAlert.merge(
      AuTextStyle(
        color: commonConfig.brandError,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_itemTitleStyleAlert),
    );
    _itemDescStyle = actionSheetConfig.itemDescStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_itemDescStyle),
    );
    _itemDescStyleLink = actionSheetConfig.itemDescStyleLink.merge(
      AuTextStyle(
        color: commonConfig.colorLink,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_itemDescStyleLink),
    );
    _itemDescStyleAlert = actionSheetConfig.itemDescStyleAlert.merge(
      AuTextStyle(
        color: commonConfig.brandError,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_itemDescStyleAlert),
    );
    _cancelStyle = actionSheetConfig.cancelStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_cancelStyle),
    );
    _topRadius ??= commonConfig.radiusLg;
  }

  AuActionSheetConfig copyWith({
    double? topRadius,
    AuTextStyle? titleStyle,
    AuTextStyle? itemTitleStyle,
    AuTextStyle? itemTitleStyleLink,
    AuTextStyle? itemTitleStyleAlert,
    AuTextStyle? itemDescStyle,
    AuTextStyle? itemDescStyleLink,
    AuTextStyle? itemDescStyleAlert,
    AuTextStyle? cancelStyle,
    EdgeInsets? contentPadding,
    EdgeInsets? titlePadding,
  }) {
    return AuActionSheetConfig(
      titleStyle: titleStyle ?? _titleStyle,
      itemTitleStyle: itemTitleStyle ?? _itemTitleStyle,
      itemTitleStyleLink: itemTitleStyleLink ?? _itemTitleStyleLink,
      itemTitleStyleAlert: itemTitleStyleAlert ?? _itemTitleStyleAlert,
      itemDescStyle: itemDescStyle ?? _itemDescStyle,
      itemDescStyleLink: itemDescStyleLink ?? _itemDescStyleLink,
      itemDescStyleAlert: itemDescStyleAlert ?? _itemDescStyleAlert,
      cancelStyle: cancelStyle ?? _cancelStyle,
      topRadius: topRadius ?? _topRadius,
      contentPadding: contentPadding ?? _contentPadding,
      titlePadding: titlePadding ?? _titlePadding,
    );
  }

  AuActionSheetConfig merge(AuActionSheetConfig? other) {
    if (other == null) return this;
    return copyWith(
      titleStyle: titleStyle.merge(other._titleStyle),
      itemTitleStyle: itemTitleStyle.merge(other._itemTitleStyle),
      itemTitleStyleLink: itemTitleStyleLink.merge(other._itemTitleStyleLink),
      itemTitleStyleAlert:
          itemTitleStyleAlert.merge(other._itemTitleStyleAlert),
      itemDescStyle: itemDescStyle.merge(other._itemDescStyle),
      itemDescStyleLink: itemDescStyleLink.merge(other._itemDescStyleLink),
      itemDescStyleAlert: itemDescStyleAlert.merge(other._itemDescStyleAlert),
      cancelStyle: cancelStyle.merge(other._cancelStyle),
      topRadius: other._topRadius,
      contentPadding: other._contentPadding,
      titlePadding: other._titlePadding,
    );
  }
}
