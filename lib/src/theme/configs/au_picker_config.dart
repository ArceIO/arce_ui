import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';

/// 选择器配置
class AuPickerConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultPickerConfig]
  AuPickerConfig({
    Color? backgroundColor,
    AuTextStyle? cancelTextStyle,
    AuTextStyle? confirmTextStyle,
    AuTextStyle? titleTextStyle,
    double? pickerHeight,
    double? titleHeight,
    double? itemHeight,
    AuTextStyle? itemTextStyle,
    AuTextStyle? itemTextSelectedStyle,
    Color? dividerColor,
    double? cornerRadius,
    super.configId,
  })  : _backgroundColor = backgroundColor,
        _cancelTextStyle = cancelTextStyle,
        _confirmTextStyle = confirmTextStyle,
        _titleTextStyle = titleTextStyle,
        _pickerHeight = pickerHeight,
        _titleHeight = titleHeight,
        _itemHeight = itemHeight,
        _itemTextStyle = itemTextStyle,
        _itemTextSelectedStyle = itemTextSelectedStyle,
        _dividerColor = dividerColor,
        _cornerRadius = cornerRadius;

  /// 日期选择器的背景色
  /// 默认为 [PICKER_BACKGROUND_COLOR]
  Color? _backgroundColor;

  /// 取消文字的样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _cancelTextStyle;

  /// 确认文字的样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _confirmTextStyle;

  /// 标题文字的样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWidget:FontWeight.w600,
  /// )
  AuTextStyle? _titleTextStyle;

  /// 日期选择器的高度
  /// 默认为 [PICKER_HEIGHT]
  double? _pickerHeight;

  /// 日期选择器标题的高度
  /// 默认为 [PICKER_TITLE_HEIGHT]
  double? _titleHeight;

  /// 日期选择器列表的高度
  /// 默认为 [PICKER_ITEM_HEIGHT]
  double? _itemHeight;

  /// 日期选择器列表的文字样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  /// )
  AuTextStyle? _itemTextStyle;

  /// 日期选择器列表选中的文字样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  ///   fontWidget: FontWeight.w600,
  /// )
  AuTextStyle? _itemTextSelectedStyle;

  Color? _dividerColor;
  double? _cornerRadius;

  Color get backgroundColor =>
      _backgroundColor ??
      AuDefaultConfigUtils.defaultPickerConfig.backgroundColor;

  AuTextStyle get cancelTextStyle =>
      _cancelTextStyle ??
      AuDefaultConfigUtils.defaultPickerConfig.cancelTextStyle;

  AuTextStyle get confirmTextStyle =>
      _confirmTextStyle ??
      AuDefaultConfigUtils.defaultPickerConfig.confirmTextStyle;

  AuTextStyle get titleTextStyle =>
      _titleTextStyle ??
      AuDefaultConfigUtils.defaultPickerConfig.titleTextStyle;

  double get pickerHeight =>
      _pickerHeight ?? AuDefaultConfigUtils.defaultPickerConfig.pickerHeight;

  double get titleHeight =>
      _titleHeight ?? AuDefaultConfigUtils.defaultPickerConfig.titleHeight;

  double get itemHeight =>
      _itemHeight ?? AuDefaultConfigUtils.defaultPickerConfig.itemHeight;

  AuTextStyle get itemTextStyle =>
      _itemTextStyle ?? AuDefaultConfigUtils.defaultPickerConfig.itemTextStyle;

  AuTextStyle get itemTextSelectedStyle =>
      _itemTextSelectedStyle ??
      AuDefaultConfigUtils.defaultPickerConfig.itemTextSelectedStyle;

  Color get dividerColor =>
      _dividerColor ?? AuDefaultConfigUtils.defaultPickerConfig.dividerColor;

  double get cornerRadius =>
      _cornerRadius ?? AuDefaultConfigUtils.defaultPickerConfig.cornerRadius;

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
    AuPickerConfig pickerConfig =
        AuThemeConfigurator.instance.getConfig(configId: configId).pickerConfig;

    _backgroundColor ??= pickerConfig.backgroundColor;
    _pickerHeight ??= pickerConfig.pickerHeight;
    _titleHeight ??= pickerConfig.titleHeight;
    _itemHeight ??= pickerConfig.itemHeight;
    _dividerColor ??= pickerConfig.dividerColor;
    _cornerRadius ??= pickerConfig.cornerRadius;
    _titleTextStyle = pickerConfig.titleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_titleTextStyle),
    );
    _cancelTextStyle = pickerConfig.cancelTextStyle
        .merge(
          AuTextStyle(
            color: commonConfig.colorTextBase,
            fontSize: commonConfig.fontSizeSubHead,
          ),
        )
        .merge(_cancelTextStyle);
    _confirmTextStyle = pickerConfig.confirmTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_confirmTextStyle),
    );
    _itemTextStyle = pickerConfig.itemTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_itemTextStyle),
    );
    _itemTextSelectedStyle = pickerConfig.itemTextSelectedStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_itemTextSelectedStyle),
    );
  }

  AuPickerConfig copyWith({
    Color? backgroundColor,
    AuTextStyle? cancelTextStyle,
    AuTextStyle? confirmTextStyle,
    AuTextStyle? titleTextStyle,
    double? pickerHeight,
    double? titleHeight,
    double? itemHeight,
    AuTextStyle? itemTextStyle,
    AuTextStyle? itemTextSelectedStyle,
    Color? dividerColor,
    double? cornerRadius,
  }) {
    return AuPickerConfig(
      backgroundColor: backgroundColor ?? _backgroundColor,
      cancelTextStyle: cancelTextStyle ?? _cancelTextStyle,
      confirmTextStyle: confirmTextStyle ?? _confirmTextStyle,
      titleTextStyle: titleTextStyle ?? _titleTextStyle,
      pickerHeight: pickerHeight ?? _pickerHeight,
      titleHeight: titleHeight ?? _titleHeight,
      itemHeight: itemHeight ?? _itemHeight,
      itemTextStyle: itemTextStyle ?? _itemTextStyle,
      itemTextSelectedStyle: itemTextSelectedStyle ?? _itemTextSelectedStyle,
      dividerColor: dividerColor ?? _dividerColor,
      cornerRadius: cornerRadius ?? _cornerRadius,
    );
  }

  AuPickerConfig merge(AuPickerConfig? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other._backgroundColor,
      cancelTextStyle: cancelTextStyle.merge(other._cancelTextStyle),
      confirmTextStyle: confirmTextStyle.merge(other._confirmTextStyle),
      titleTextStyle: titleTextStyle.merge(other._titleTextStyle),
      pickerHeight: other._pickerHeight,
      titleHeight: other._titleHeight,
      itemHeight: other._itemHeight,
      itemTextStyle: itemTextStyle.merge(other._itemTextStyle),
      itemTextSelectedStyle:
          itemTextSelectedStyle.merge(other._itemTextSelectedStyle),
      dividerColor: other._dividerColor,
      cornerRadius: other._cornerRadius,
    );
  }
}
