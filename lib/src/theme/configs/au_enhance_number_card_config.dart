import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';

/// 强化数字展示组件配置
class AuEnhanceNumberCardConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig]
  AuEnhanceNumberCardConfig({
    double? runningSpace,
    double? itemRunningSpace,
    AuTextStyle? titleTextStyle,
    AuTextStyle? descTextStyle,
    double? dividerWidth,
    super.configId,
  })  : _runningSpace = runningSpace,
        _itemRunningSpace = itemRunningSpace,
        _titleTextStyle = titleTextStyle,
        _descTextStyle = descTextStyle,
        _dividerWidth = dividerWidth;

  /// 如果超过一行，行间距
  double? _runningSpace;

  double get runningSpace =>
      _runningSpace ??
      AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig.runningSpace;

  /// Item的上半部分和下半部分的间距
  double? _itemRunningSpace;

  double get itemRunningSpace =>
      _itemRunningSpace ??
      AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig.itemRunningSpace;

  double? _dividerWidth;

  double get dividerWidth =>
      _dividerWidth ??
      AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig.dividerWidth;
  AuTextStyle? _titleTextStyle;

  AuTextStyle get titleTextStyle =>
      _titleTextStyle ??
      AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig.titleTextStyle;
  AuTextStyle? _descTextStyle;

  AuTextStyle get descTextStyle =>
      _descTextStyle ??
      AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig.descTextStyle;

  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    AuEnhanceNumberCardConfig userConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .enhanceNumberCardConfig;

    _runningSpace ??= userConfig._runningSpace;
    _itemRunningSpace ??= userConfig._itemRunningSpace;
    _dividerWidth ??= userConfig._dividerWidth;
    _titleTextStyle = userConfig.titleTextStyle.merge(
      AuTextStyle(color: commonConfig.colorTextBase).merge(_titleTextStyle),
    );
    _descTextStyle = userConfig.descTextStyle.merge(
      AuTextStyle(color: commonConfig.colorTextSecondary).merge(_descTextStyle),
    );
  }

  AuEnhanceNumberCardConfig copyWith({
    double? runningSpace,
    double? itemRunningSpace,
    double? dividerWidth,
    AuTextStyle? titleTextStyle,
    AuTextStyle? descTextStyle,
  }) {
    return AuEnhanceNumberCardConfig(
      runningSpace: runningSpace ?? _runningSpace,
      itemRunningSpace: itemRunningSpace ?? _itemRunningSpace,
      dividerWidth: dividerWidth ?? _dividerWidth,
      titleTextStyle: titleTextStyle ?? _titleTextStyle,
      descTextStyle: descTextStyle ?? _descTextStyle,
    );
  }

  AuEnhanceNumberCardConfig merge(AuEnhanceNumberCardConfig? other) {
    if (other == null) return this;
    return copyWith(
      runningSpace: other._runningSpace,
      itemRunningSpace: other._itemRunningSpace,
      dividerWidth: other._dividerWidth,
      titleTextStyle: titleTextStyle.merge(other._titleTextStyle),
      descTextStyle: descTextStyle.merge(other._descTextStyle),
    );
  }
}
