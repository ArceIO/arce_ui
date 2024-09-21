import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';

/// 卡片标题 配置类
class AuCardTitleConfig extends AuBaseConfig {
  AuCardTitleConfig({
    AuTextStyle? titleWithHeightTextStyle,
    AuTextStyle? detailTextStyle,
    AuTextStyle? accessoryTextStyle,
    EdgeInsets? cardTitlePadding,
    AuTextStyle? titleTextStyle,
    AuTextStyle? subtitleTextStyle,
    PlaceholderAlignment? alignment,
    Color? cardBackgroundColor,
    super.configId,
  })  : _titleWithHeightTextStyle = titleWithHeightTextStyle,
        _detailTextStyle = detailTextStyle,
        _accessoryTextStyle = accessoryTextStyle,
        _cardTitlePadding = cardTitlePadding,
        _titleTextStyle = titleTextStyle,
        _subtitleTextStyle = subtitleTextStyle,
        _alignment = alignment,
        _cardBackgroundColor = cardBackgroundColor;

  /// 标题外边距间距
  ///
  /// EdgeInsets.only(
  ///   top: [AuCommonConfig.vSpacingXl],
  ///   bottom: [AuCommonConfig.vSpacingMd],
  /// )
  EdgeInsets? _cardTitlePadding;

  EdgeInsets get cardTitlePadding =>
      _cardTitlePadding ??
      AuDefaultConfigUtils.defaultCardTitleConfig.cardTitlePadding;

  /// 标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  ///   fontWeight: FontWeight.w600,
  ///   height: 25 / 18,
  /// )
  AuTextStyle? _titleWithHeightTextStyle;

  AuTextStyle get titleWithHeightTextStyle =>
      _titleWithHeightTextStyle ??
      AuDefaultConfigUtils.defaultCardTitleConfig.titleWithHeightTextStyle;

  /// 标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _titleTextStyle;

  AuTextStyle get titleTextStyle =>
      _titleTextStyle ??
      AuDefaultConfigUtils.defaultCardTitleConfig.titleTextStyle;

  /// 标题右边的副标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _subtitleTextStyle;

  AuTextStyle get subtitleTextStyle =>
      _subtitleTextStyle ??
      AuDefaultConfigUtils.defaultCardTitleConfig.subtitleTextStyle;

  /// 详情文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _detailTextStyle;

  AuTextStyle get detailTextStyle =>
      _detailTextStyle ??
      AuDefaultConfigUtils.defaultCardTitleConfig.detailTextStyle;

  /// 辅助文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _accessoryTextStyle;

  AuTextStyle get accessoryTextStyle =>
      _accessoryTextStyle ??
      AuDefaultConfigUtils.defaultCardTitleConfig.accessoryTextStyle;

  /// 对齐方式
  /// 默认为 [PlaceholderAlignment.middle]
  PlaceholderAlignment? _alignment;

  PlaceholderAlignment get alignment =>
      _alignment ?? AuDefaultConfigUtils.defaultCardTitleConfig.alignment;

  /// 卡片背景
  /// 默认为 [AuCommonConfig.fillBase]
  Color? _cardBackgroundColor;

  Color get cardBackgroundColor =>
      _cardBackgroundColor ??
      AuDefaultConfigUtils.defaultCardTitleConfig.cardBackgroundColor;

  /// cardTitleConfig  获取逻辑详见 [AuThemeConfigurator.getConfig] 方法
  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    AuCardTitleConfig cardTitleConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .cardTitleConfig;

    _cardBackgroundColor ??= commonConfig.fillBase;
    _cardTitlePadding ??= EdgeInsets.only(
      left: cardTitleConfig.cardTitlePadding.left,
      top: commonConfig.vSpacingXl,
      right: cardTitleConfig.cardTitlePadding.right,
      bottom: commonConfig.vSpacingMd,
    );
    _titleWithHeightTextStyle = cardTitleConfig.titleWithHeightTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_titleWithHeightTextStyle),
    );
    _titleTextStyle = cardTitleConfig.titleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_titleTextStyle),
    );
    _subtitleTextStyle = cardTitleConfig.subtitleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_subtitleTextStyle),
    );
    _accessoryTextStyle = cardTitleConfig.accessoryTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_accessoryTextStyle),
    );
    _detailTextStyle = cardTitleConfig.detailTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_detailTextStyle),
    );
    _alignment ??= cardTitleConfig._alignment;
  }

  AuCardTitleConfig copyWith({
    EdgeInsets? cardTitlePadding,
    AuTextStyle? titleWithHeightTextStyle,
    AuTextStyle? titleTextStyle,
    AuTextStyle? subtitleTextStyle,
    AuTextStyle? detailTextStyle,
    AuTextStyle? accessoryTextStyle,
    PlaceholderAlignment? alignment,
    Color? cardBackgroundColor,
  }) {
    return AuCardTitleConfig(
      cardTitlePadding: cardTitlePadding ?? _cardTitlePadding,
      titleWithHeightTextStyle:
          titleWithHeightTextStyle ?? _titleWithHeightTextStyle,
      titleTextStyle: titleTextStyle ?? _titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? _subtitleTextStyle,
      detailTextStyle: detailTextStyle ?? _detailTextStyle,
      accessoryTextStyle: accessoryTextStyle ?? _accessoryTextStyle,
      alignment: alignment ?? _alignment,
      cardBackgroundColor: cardBackgroundColor ?? _cardBackgroundColor,
    );
  }

  AuCardTitleConfig merge(AuCardTitleConfig? other) {
    if (other == null) return this;
    return copyWith(
      cardTitlePadding: other._cardTitlePadding,
      titleWithHeightTextStyle:
          titleWithHeightTextStyle.merge(other._titleWithHeightTextStyle),
      titleTextStyle: titleTextStyle.merge(other._titleTextStyle),
      subtitleTextStyle: subtitleTextStyle.merge(other._subtitleTextStyle),
      detailTextStyle: detailTextStyle.merge(other._detailTextStyle),
      accessoryTextStyle: accessoryTextStyle.merge(other._accessoryTextStyle),
      alignment: other._alignment,
      cardBackgroundColor: other._cardBackgroundColor,
    );
  }
}
