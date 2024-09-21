import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';

/// TabBar配置类
class AuTabBarConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.tabBarConfig]
  AuTabBarConfig({
    double? tabHeight,
    double? indicatorHeight,
    double? indicatorWidth,
    AuTextStyle? labelStyle,
    AuTextStyle? unselectedLabelStyle,
    Color? backgroundColor,
    AuTextStyle? tagNormalTextStyle,
    Color? tagNormalBgColor,
    AuTextStyle? tagSelectedTextStyle,
    Color? tagSelectedBgColor,
    double? tagRadius,
    double? tagSpacing,
    int? preLineTagCount,
    double? tagHeight,
    super.configId,
  })  : _tabHeight = tabHeight,
        _indicatorHeight = indicatorHeight,
        _indicatorWidth = indicatorWidth,
        _labelStyle = labelStyle,
        _unselectedLabelStyle = unselectedLabelStyle,
        _backgroundColor = backgroundColor,
        _tagNormalTextStyle = tagNormalTextStyle,
        _tagNormalBgColor = tagNormalBgColor,
        _tagSelectedTextStyle = tagSelectedTextStyle,
        _tagSelectedBgColor = tagSelectedBgColor,
        _tagRadius = tagRadius,
        _tagSpacing = tagSpacing,
        _preLineTagCount = preLineTagCount,
        _tagHeight = tagHeight;

  /// TabBar 的整体高度
  /// 默认为 50
  double? _tabHeight;

  /// 指示器的高度
  /// 默认为 2
  double? _indicatorHeight;

  /// 指示器的宽度
  /// 默认为 24
  double? _indicatorWidth;

  /// 选中 Tab 文本的样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _labelStyle;

  /// 未选中 Tab 文本的样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _unselectedLabelStyle;

  /// 背景色
  /// 默认为 [AuCommonConfig.fillBase]
  Color? _backgroundColor;

  /// 标签字体样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  /// )
  AuTextStyle? _tagNormalTextStyle;

  /// 标签背景色
  /// 默认为 [AuCommonConfig.brandPrimary].withAlpha(0x14),
  Color? _tagNormalBgColor;

  /// 标签字体样式
  ///
  /// AuTextStyle(
  ///   color:[AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  /// )
  AuTextStyle? _tagSelectedTextStyle;

  /// 标签选中背景色
  /// 默认为 [AuCommonConfig.fillBody]
  Color? _tagSelectedBgColor;

  /// tag圆角
  /// 默认为 [AuCommonConfig.radiusSm]
  double? _tagRadius;

  /// tag间距
  /// 默认为 12
  double? _tagSpacing;

  /// 每行的tag数
  /// 默认为 4
  int? _preLineTagCount;

  /// tag高度
  /// 默认为 32
  double? _tagHeight;

  double get tabHeight =>
      _tabHeight ?? AuDefaultConfigUtils.defaultTabBarConfig.tabHeight;

  double get indicatorHeight =>
      _indicatorHeight ??
      AuDefaultConfigUtils.defaultTabBarConfig.indicatorHeight;

  double get indicatorWidth =>
      _indicatorWidth ??
      AuDefaultConfigUtils.defaultTabBarConfig.indicatorWidth;

  AuTextStyle get labelStyle =>
      _labelStyle ?? AuDefaultConfigUtils.defaultTabBarConfig.labelStyle;

  AuTextStyle get unselectedLabelStyle =>
      _unselectedLabelStyle ??
      AuDefaultConfigUtils.defaultTabBarConfig.unselectedLabelStyle;

  Color get backgroundColor =>
      _backgroundColor ??
      AuDefaultConfigUtils.defaultTabBarConfig.backgroundColor;

  AuTextStyle get tagNormalTextStyle =>
      _tagNormalTextStyle ??
      AuDefaultConfigUtils.defaultTabBarConfig.tagNormalTextStyle;

  Color get tagNormalBgColor =>
      _tagNormalBgColor ??
      AuDefaultConfigUtils.defaultTabBarConfig.tagNormalBgColor;

  AuTextStyle get tagSelectedTextStyle =>
      _tagSelectedTextStyle ??
      AuDefaultConfigUtils.defaultTabBarConfig.tagSelectedTextStyle;

  Color get tagSelectedBgColor =>
      _tagSelectedBgColor ??
      AuDefaultConfigUtils.defaultTabBarConfig.tagSelectedBgColor;

  double get tagRadius =>
      _tagRadius ?? AuDefaultConfigUtils.defaultTabBarConfig.tagRadius;

  double get tagSpacing =>
      _tagSpacing ?? AuDefaultConfigUtils.defaultTabBarConfig.tagSpacing;

  int get preLineTagCount =>
      _preLineTagCount ??
      AuDefaultConfigUtils.defaultTabBarConfig.preLineTagCount;

  double get tagHeight =>
      _tagHeight ?? AuDefaultConfigUtils.defaultTabBarConfig.tagHeight;

  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    AuTabBarConfig tabBarConfig =
        AuThemeConfigurator.instance.getConfig(configId: configId).tabBarConfig;

    _tabHeight ??= tabBarConfig._tabHeight;
    _indicatorHeight ??= tabBarConfig._indicatorHeight;
    _indicatorWidth ??= tabBarConfig._indicatorWidth;
    _labelStyle = tabBarConfig.labelStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_labelStyle),
    );
    _unselectedLabelStyle = tabBarConfig.unselectedLabelStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_unselectedLabelStyle),
    );
    _backgroundColor ??= tabBarConfig._backgroundColor;
    _tagNormalTextStyle = tabBarConfig.tagNormalTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagNormalTextStyle),
    );
    _tagSelectedTextStyle = tabBarConfig.tagSelectedTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagSelectedTextStyle),
    );
    _tagNormalBgColor ??= tabBarConfig._tagNormalBgColor;
    _tagSelectedBgColor ??= tabBarConfig._tagSelectedBgColor;
    _tagRadius ??= commonConfig.radiusSm;
    _tagSpacing ??= tabBarConfig._tagSpacing;
    _preLineTagCount ??= tabBarConfig._preLineTagCount;
    _tagHeight ??= tabBarConfig._tagHeight;
  }

  AuTabBarConfig copyWith({
    double? tabHeight,
    double? indicatorHeight,
    double? indicatorWidth,
    AuTextStyle? labelStyle,
    AuTextStyle? unselectedLabelStyle,
    Color? backgroundColor,
    AuTextStyle? tagNormalTextStyle,
    Color? tagNormalColor,
    AuTextStyle? tagSelectedTextStyle,
    Color? tagSelectedColor,
    double? tagRadius,
    double? tagSpacing,
    int? preLineTagSize,
    double? tagHeight,
  }) {
    return AuTabBarConfig(
      tabHeight: tabHeight ?? _tabHeight,
      indicatorHeight: indicatorHeight ?? _indicatorHeight,
      indicatorWidth: indicatorWidth ?? _indicatorWidth,
      labelStyle: labelStyle ?? _labelStyle,
      unselectedLabelStyle: unselectedLabelStyle ?? _unselectedLabelStyle,
      backgroundColor: backgroundColor ?? _backgroundColor,
      tagNormalTextStyle: tagNormalTextStyle ?? _tagNormalTextStyle,
      tagNormalBgColor: tagNormalColor ?? _tagNormalBgColor,
      tagSelectedTextStyle: tagSelectedTextStyle ?? _tagSelectedTextStyle,
      tagSelectedBgColor: tagSelectedColor ?? _tagSelectedBgColor,
      tagRadius: tagRadius ?? _tagRadius,
      tagSpacing: tagSpacing ?? _tagSpacing,
      preLineTagCount: preLineTagSize ?? _preLineTagCount,
      tagHeight: tagHeight ?? _tagHeight,
    );
  }

  AuTabBarConfig merge(AuTabBarConfig? other) {
    if (other == null) return this;
    return copyWith(
      tabHeight: other._tabHeight,
      indicatorHeight: other._indicatorHeight,
      indicatorWidth: other._indicatorWidth,
      labelStyle: labelStyle.merge(other._labelStyle),
      unselectedLabelStyle:
          unselectedLabelStyle.merge(other._unselectedLabelStyle),
      backgroundColor: other._backgroundColor,
      tagNormalTextStyle: tagNormalTextStyle.merge(other._tagNormalTextStyle),
      tagNormalColor: other._tagNormalBgColor,
      tagSelectedTextStyle:
          tagSelectedTextStyle.merge(other._tagSelectedTextStyle),
      tagSelectedColor: other._tagSelectedBgColor,
      tagRadius: other._tagRadius,
      tagSpacing: other._tagSpacing,
      preLineTagSize: other._preLineTagCount,
      tagHeight: other._tagHeight,
    );
  }
}
