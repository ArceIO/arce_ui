import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';

/// 描述: 空页面配置类
class AuAbnormalStateConfig extends AuBaseConfig {
  AuAbnormalStateConfig({
    AuTextStyle? titleTextStyle,
    AuTextStyle? contentTextStyle,
    AuTextStyle? operateTextStyle,
    double? btnRadius,
    AuTextStyle? singleTextStyle,
    AuTextStyle? doubleTextStyle,
    double? singleMinWidth,
    double? doubleMinWidth,
    super.configId,
  })  : _titleTextStyle = titleTextStyle,
        _contentTextStyle = contentTextStyle,
        _operateTextStyle = operateTextStyle,
        _btnRadius = btnRadius,
        _singleTextStyle = singleTextStyle,
        _doubleTextStyle = doubleTextStyle,
        _singleMinWidth = singleMinWidth,
        _doubleMinWidth = doubleMinWidth;

  /// 文案区域标题
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _titleTextStyle;

  /// 文案区域内容
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextHint],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _contentTextStyle;

  /// 操作区域文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _operateTextStyle;

  /// 圆角
  /// default value is [AuCommonConfig.radiusSm]
  double? _btnRadius;

  /// 单按钮文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBaseInverse],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _singleTextStyle;

  /// 双按钮文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _doubleTextStyle;

  /// 单按钮的按钮最小宽度
  /// 默认值为 160
  double? _singleMinWidth;

  /// 多按钮的按钮最小宽度
  /// 默认值为 120
  double? _doubleMinWidth;

  AuTextStyle get titleTextStyle =>
      _titleTextStyle ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.titleTextStyle;

  AuTextStyle get contentTextStyle =>
      _contentTextStyle ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.contentTextStyle;

  AuTextStyle get operateTextStyle =>
      _operateTextStyle ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.operateTextStyle;

  double get btnRadius =>
      _btnRadius ?? AuDefaultConfigUtils.defaultAbnormalStateConfig.btnRadius;

  AuTextStyle get singleTextStyle =>
      _singleTextStyle ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.singleTextStyle;

  AuTextStyle get doubleTextStyle =>
      _doubleTextStyle ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.doubleTextStyle;

  double get singleMinWidth =>
      _singleMinWidth ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.singleMinWidth;

  double get doubleMinWidth =>
      _doubleMinWidth ??
      AuDefaultConfigUtils.defaultAbnormalStateConfig.doubleMinWidth;

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
    AuAbnormalStateConfig abnormalStateConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .abnormalStateConfig;

    _titleTextStyle = abnormalStateConfig.titleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_titleTextStyle),
    );
    _contentTextStyle = abnormalStateConfig.contentTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextHint,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_contentTextStyle),
    );
    _operateTextStyle = abnormalStateConfig.operateTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_operateTextStyle),
    );
    _singleTextStyle = abnormalStateConfig.singleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBaseInverse,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_singleTextStyle),
    );
    _doubleTextStyle = abnormalStateConfig.doubleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_doubleTextStyle),
    );
    _btnRadius ??= abnormalStateConfig._btnRadius;
    _singleMinWidth ??= abnormalStateConfig._singleMinWidth;
    _doubleMinWidth ??= abnormalStateConfig._doubleMinWidth;
  }

  AuAbnormalStateConfig copyWith({
    AuTextStyle? titleTextStyle,
    AuTextStyle? contentTextStyle,
    AuTextStyle? operateTextStyle,
    double? btnRadius,
    AuTextStyle? singleTextStyle,
    AuTextStyle? doubleTextStyle,
    double? singleMinWidth,
    double? doubleMinWidth,
  }) {
    return AuAbnormalStateConfig(
      titleTextStyle: titleTextStyle ?? _titleTextStyle,
      contentTextStyle: contentTextStyle ?? _contentTextStyle,
      operateTextStyle: operateTextStyle ?? _operateTextStyle,
      btnRadius: btnRadius ?? _btnRadius,
      singleTextStyle: singleTextStyle ?? _singleTextStyle,
      doubleTextStyle: doubleTextStyle ?? _doubleTextStyle,
      singleMinWidth: singleMinWidth ?? _singleMinWidth,
      doubleMinWidth: doubleMinWidth ?? _doubleMinWidth,
    );
  }

  AuAbnormalStateConfig merge(AuAbnormalStateConfig? other) {
    if (other == null) return this;
    return copyWith(
      titleTextStyle: titleTextStyle.merge(other._titleTextStyle),
      contentTextStyle: contentTextStyle.merge(other._contentTextStyle),
      operateTextStyle: operateTextStyle.merge(other._operateTextStyle),
      btnRadius: other._btnRadius,
      singleTextStyle: singleTextStyle.merge(other._singleTextStyle),
      doubleTextStyle: doubleTextStyle.merge(other._doubleTextStyle),
      singleMinWidth: other._singleMinWidth,
      doubleMinWidth: other._doubleMinWidth,
    );
  }
}
