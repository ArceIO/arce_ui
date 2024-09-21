import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/painting.dart';

/// 标签配置类
class AuTagConfig extends AuBaseConfig {
  AuTagConfig({
    AuTextStyle? tagTextStyle,
    AuTextStyle? selectTagTextStyle,
    double? tagRadius,
    Color? tagBackgroundColor,
    Color? selectedTagBackgroundColor,
    double? tagHeight,
    double? tagWidth,
    double? tagMinWidth,
    super.configId,
  })  : _tagTextStyle = tagTextStyle,
        _selectTagTextStyle = selectTagTextStyle,
        _tagRadius = tagRadius,
        _tagBackgroundColor = tagBackgroundColor,
        _selectedTagBackgroundColor = selectedTagBackgroundColor,
        _tagHeight = tagHeight,
        _tagWidth = tagWidth,
        _tagMinWidth = tagMinWidth;

  /// tag 文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  /// )
  AuTextStyle? _tagTextStyle;

  /// tag选中文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _selectTagTextStyle;

  /// 标签背景色
  /// default [AuCommonConfig.fillBody]
  Color? _tagBackgroundColor;

  /// 选中背景色
  /// default [AuCommonConfig.brandPrimary]
  Color? _selectedTagBackgroundColor;

  /// 标签圆角
  /// 默认为 [AuCommonConfig.radiusXs]
  double? _tagRadius;

  /// 标签高度，跟 fixWidthMode 无关
  /// 默认为 34
  double? _tagHeight;

  /// 标签宽度，且仅在组件设置了固定宽度（fixWidthMode 为 true）时才生效
  /// 默认为 75
  double? _tagWidth;

  /// 标签最小宽度
  /// 默认为 75
  double? _tagMinWidth;

  AuTextStyle get tagTextStyle =>
      _tagTextStyle ?? AuDefaultConfigUtils.defaultTagConfig.tagTextStyle;

  AuTextStyle get selectTagTextStyle =>
      _selectTagTextStyle ??
      AuDefaultConfigUtils.defaultTagConfig.selectTagTextStyle;

  Color get tagBackgroundColor =>
      _tagBackgroundColor ??
      AuDefaultConfigUtils.defaultTagConfig.tagBackgroundColor;

  Color get selectedTagBackgroundColor =>
      _selectedTagBackgroundColor ??
      AuDefaultConfigUtils.defaultTagConfig.selectedTagBackgroundColor;

  double get tagRadius =>
      _tagRadius ?? AuDefaultConfigUtils.defaultTagConfig.tagRadius;

  double get tagHeight =>
      _tagHeight ?? AuDefaultConfigUtils.defaultTagConfig.tagHeight;

  double get tagWidth =>
      _tagWidth ?? AuDefaultConfigUtils.defaultTagConfig.tagWidth;

  double get tagMinWidth =>
      _tagMinWidth ?? AuDefaultConfigUtils.defaultTagConfig.tagMinWidth;

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
    AuTagConfig tagConfig =
        AuThemeConfigurator.instance.getConfig(configId: configId).tagConfig;

    _tagHeight ??= tagConfig._tagHeight;
    _tagWidth ??= tagConfig._tagWidth;
    _tagMinWidth ??= tagConfig._tagMinWidth;
    _tagRadius ??= commonConfig.radiusXs;
    _tagBackgroundColor ??= commonConfig.fillBody;
    _selectedTagBackgroundColor ??= commonConfig.brandPrimary;
    _tagTextStyle = tagConfig.tagTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagTextStyle),
    );
    _selectTagTextStyle = tagConfig.selectTagTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_selectTagTextStyle),
    );
  }

  AuTagConfig copyWith({
    AuTextStyle? textStyle,
    AuTextStyle? selectTextStyle,
    double? radius,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    double? height,
    double? width,
    double? tagMinWidth,
  }) {
    return AuTagConfig(
      tagTextStyle: textStyle ?? _tagTextStyle,
      selectTagTextStyle: selectTextStyle ?? _selectTagTextStyle,
      tagRadius: radius ?? _tagRadius,
      tagBackgroundColor: backgroundColor ?? _tagBackgroundColor,
      selectedTagBackgroundColor:
          selectedBackgroundColor ?? _selectedTagBackgroundColor,
      tagHeight: height ?? _tagHeight,
      tagWidth: width ?? _tagWidth,
      tagMinWidth: tagMinWidth ?? _tagMinWidth,
    );
  }

  AuTagConfig merge(AuTagConfig? other) {
    if (other == null) return this;
    return copyWith(
      textStyle: tagTextStyle.merge(other._tagTextStyle),
      selectTextStyle: selectTagTextStyle.merge(other._selectTagTextStyle),
      radius: other._tagRadius,
      backgroundColor: other._tagBackgroundColor,
      selectedBackgroundColor: other._selectedTagBackgroundColor,
      height: other._tagHeight,
      width: other._tagWidth,
      tagMinWidth: other._tagMinWidth,
    );
  }
}
