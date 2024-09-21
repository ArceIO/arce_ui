import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';

/// AuPairInfoTable 的配置文件 全局配置
class AuPairInfoTableConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultPairInfoTableConfig]
  AuPairInfoTableConfig({
    double? rowSpacing,
    double? itemSpacing,
    AuTextStyle? keyTextStyle,
    AuTextStyle? valueTextStyle,
    AuTextStyle? linkTextStyle,
    super.configId,
  })  : _rowSpacing = rowSpacing,
        _itemSpacing = itemSpacing,
        _keyTextStyle = keyTextStyle,
        _valueTextStyle = valueTextStyle,
        _linkTextStyle = linkTextStyle;

  /// 行间距 纵向
  double? _rowSpacing;

  /// AuInfoModal 属性配置 行间距
  double? _itemSpacing;

  /// AuInfoModal key文字样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w400,
  /// )
  AuTextStyle? _keyTextStyle;

  /// AuInfoModal value文字样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w400,
  /// )
  AuTextStyle? _valueTextStyle;

  /// AuInfoModal 链接文字样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontWeight: FontWeight.w400,
  ///   fontSize: [AuCommonConfig.fontSizeBase]
  /// )
  AuTextStyle? _linkTextStyle;

  double get rowSpacing =>
      _rowSpacing ?? AuDefaultConfigUtils.defaultPairInfoTableConfig.rowSpacing;

  double get itemSpacing =>
      _itemSpacing ??
      AuDefaultConfigUtils.defaultPairInfoTableConfig.itemSpacing;

  AuTextStyle get keyTextStyle =>
      _keyTextStyle ??
      AuDefaultConfigUtils.defaultPairInfoTableConfig.keyTextStyle;

  AuTextStyle get valueTextStyle =>
      _valueTextStyle ??
      AuDefaultConfigUtils.defaultPairInfoTableConfig.valueTextStyle;

  AuTextStyle get linkTextStyle =>
      _linkTextStyle ??
      AuDefaultConfigUtils.defaultPairInfoTableConfig.linkTextStyle;

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
    AuPairInfoTableConfig pairInfoTableConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .pairInfoTableConfig;

    _rowSpacing ??= pairInfoTableConfig._rowSpacing;
    _keyTextStyle = pairInfoTableConfig.keyTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_keyTextStyle),
    );
    _valueTextStyle = pairInfoTableConfig.valueTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_valueTextStyle),
    );
    _linkTextStyle = pairInfoTableConfig.linkTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_linkTextStyle),
    );
    _itemSpacing ??= pairInfoTableConfig._itemSpacing;
  }

  AuPairInfoTableConfig copyWith({
    double? rowSpacing,
    double? itemSpacing,
    AuTextStyle? keyTextStyle,
    AuTextStyle? valueTextStyle,
    AuTextStyle? linkTextStyle,
  }) {
    return AuPairInfoTableConfig(
      rowSpacing: rowSpacing ?? _rowSpacing,
      itemSpacing: itemSpacing ?? _itemSpacing,
      keyTextStyle: keyTextStyle ?? _keyTextStyle,
      valueTextStyle: valueTextStyle ?? _valueTextStyle,
      linkTextStyle: linkTextStyle ?? _linkTextStyle,
    );
  }

  AuPairInfoTableConfig merge(AuPairInfoTableConfig? other) {
    if (other == null) return this;
    return copyWith(
      rowSpacing: other._rowSpacing,
      itemSpacing: other._itemSpacing,
      keyTextStyle: keyTextStyle.merge(other._keyTextStyle),
      valueTextStyle: valueTextStyle.merge(other._valueTextStyle),
      linkTextStyle: linkTextStyle.merge(other._linkTextStyle),
    );
  }
}

class AuPairRichInfoGridConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultPairRichInfoGridConfig]
  AuPairRichInfoGridConfig({
    double? rowSpacing,
    double? itemSpacing,
    double? itemHeight,
    AuTextStyle? keyTextStyle,
    AuTextStyle? valueTextStyle,
    AuTextStyle? linkTextStyle,
    super.configId,
  })  : _rowSpacing = rowSpacing,
        _itemSpacing = itemSpacing,
        _itemHeight = itemHeight,
        _keyTextStyle = keyTextStyle,
        _valueTextStyle = valueTextStyle,
        _linkTextStyle = linkTextStyle;

  /// 行间距 纵向
  double? _rowSpacing;

  /// 元素间距 横向
  double? _itemSpacing;

  /// 元素高度
  double? _itemHeight;

  /// key文字样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w400,
  /// )
  AuTextStyle? _keyTextStyle;

  /// value文字样式
  ///
  /// AuTextStyle(
  ///   fontWeight: FontWeight.w400,
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _valueTextStyle;

  /// 链接文字样式
  ///
  /// AuTextStyle(
  ///   fontWeight: FontWeight.w400,
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _linkTextStyle;

  double get rowSpacing =>
      _rowSpacing ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig.rowSpacing;

  double get itemSpacing =>
      _itemSpacing ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig.itemSpacing;

  double get itemHeight =>
      _itemHeight ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig.itemHeight;

  AuTextStyle get keyTextStyle =>
      _keyTextStyle ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig.keyTextStyle;

  AuTextStyle get valueTextStyle =>
      _valueTextStyle ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig.valueTextStyle;

  AuTextStyle get linkTextStyle =>
      _linkTextStyle ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig.linkTextStyle;

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
    AuPairRichInfoGridConfig pairRichInfoGridConfig = AuThemeConfigurator
        .instance
        .getConfig(configId: configId)
        .pairRichInfoGridConfig;

    _rowSpacing ??= pairRichInfoGridConfig._rowSpacing;
    _itemSpacing ??= pairRichInfoGridConfig._itemSpacing;
    _itemHeight ??= pairRichInfoGridConfig._itemHeight;
    _keyTextStyle = pairRichInfoGridConfig.keyTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_keyTextStyle),
    );
    _valueTextStyle = pairRichInfoGridConfig.valueTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_valueTextStyle),
    );
    _linkTextStyle = pairRichInfoGridConfig.linkTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_linkTextStyle),
    );
  }

  AuPairRichInfoGridConfig copyWith({
    double? rowSpacing,
    double? itemSpacing,
    double? itemHeight,
    AuTextStyle? keyTextStyle,
    AuTextStyle? valueTextStyle,
    AuTextStyle? linkTextStyle,
    AuTextStyle? titleTextsStyle,
  }) {
    return AuPairRichInfoGridConfig(
      rowSpacing: rowSpacing ?? _rowSpacing,
      itemSpacing: itemSpacing ?? _itemSpacing,
      itemHeight: itemHeight ?? _itemHeight,
      keyTextStyle: keyTextStyle ?? _keyTextStyle,
      valueTextStyle: valueTextStyle ?? _valueTextStyle,
      linkTextStyle: linkTextStyle ?? _linkTextStyle,
    );
  }

  AuPairRichInfoGridConfig merge(AuPairRichInfoGridConfig? other) {
    if (other == null) return this;
    return copyWith(
      rowSpacing: other._rowSpacing,
      itemSpacing: other._itemSpacing,
      itemHeight: other._itemHeight,
      keyTextStyle: keyTextStyle.merge(other._keyTextStyle),
      valueTextStyle: valueTextStyle.merge(other._valueTextStyle),
      linkTextStyle: linkTextStyle.merge(other._linkTextStyle),
    );
  }
}
