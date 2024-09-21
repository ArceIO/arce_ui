import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';

/// 按钮基础配置
class AuButtonConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultButtonConfig]
  AuButtonConfig({
    double? bigButtonRadius,
    double? bigButtonHeight,
    double? bigButtonFontSize,
    double? smallButtonRadius,
    double? smallButtonHeight,
    double? smallButtonFontSize,
    super.configId,
  })  : _bigButtonRadius = bigButtonRadius,
        _bigButtonHeight = bigButtonHeight,
        _bigButtonFontSize = bigButtonFontSize,
        _smallButtonRadius = smallButtonRadius,
        _smallButtonHeight = smallButtonHeight,
        _smallButtonFontSize = smallButtonFontSize;

  /// 默认为 6
  double? _bigButtonRadius;

  double get bigButtonRadius =>
      _bigButtonRadius ??
      AuDefaultConfigUtils.defaultButtonConfig.bigButtonRadius;

  /// 默认为 48
  double? _bigButtonHeight;

  double get bigButtonHeight =>
      _bigButtonHeight ??
      AuDefaultConfigUtils.defaultButtonConfig.bigButtonHeight;

  /// 默认为 16
  double? _bigButtonFontSize;

  double get bigButtonFontSize =>
      _bigButtonFontSize ??
      AuDefaultConfigUtils.defaultButtonConfig.bigButtonFontSize;

  /// 默认为 4
  double? _smallButtonRadius;

  double get smallButtonRadius =>
      _smallButtonRadius ??
      AuDefaultConfigUtils.defaultButtonConfig.smallButtonRadius;

  /// 默认为 32
  double? _smallButtonHeight;

  double get smallButtonHeight =>
      _smallButtonHeight ??
      AuDefaultConfigUtils.defaultButtonConfig.smallButtonHeight;

  /// 默认为 14
  double? _smallButtonFontSize;

  double get smallButtonFontSize =>
      _smallButtonFontSize ??
      AuDefaultConfigUtils.defaultButtonConfig.smallButtonFontSize;

  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    AuButtonConfig userConfig =
        AuThemeConfigurator.instance.getConfig(configId: configId).buttonConfig;

    _bigButtonRadius ??= userConfig._bigButtonRadius;
    _bigButtonHeight ??= userConfig._bigButtonHeight;
    _bigButtonFontSize ??= userConfig._bigButtonFontSize;
    _smallButtonRadius ??= userConfig._smallButtonRadius;
    _smallButtonHeight ??= userConfig._smallButtonHeight;
    _smallButtonFontSize ??= userConfig._smallButtonFontSize;
  }

  AuButtonConfig copyWith({
    double? bigButtonRadius,
    double? bigButtonHeight,
    double? bigButtonFontSize,
    double? smallButtonRadius,
    double? smallButtonHeight,
    double? smallButtonFontSize,
  }) {
    return AuButtonConfig(
      bigButtonRadius: bigButtonRadius ?? _bigButtonRadius,
      bigButtonHeight: bigButtonHeight ?? _bigButtonHeight,
      bigButtonFontSize: bigButtonFontSize ?? _bigButtonFontSize,
      smallButtonRadius: smallButtonRadius ?? _smallButtonRadius,
      smallButtonHeight: smallButtonHeight ?? _smallButtonHeight,
      smallButtonFontSize: smallButtonFontSize ?? _smallButtonFontSize,
    );
  }

  AuButtonConfig merge(AuButtonConfig? other) {
    if (other == null) return this;
    return copyWith(
      bigButtonRadius: other._bigButtonRadius,
      bigButtonHeight: other._bigButtonHeight,
      bigButtonFontSize: other._bigButtonFontSize,
      smallButtonRadius: other._smallButtonRadius,
      smallButtonHeight: other._smallButtonHeight,
      smallButtonFontSize: other._smallButtonFontSize,
    );
  }
}
