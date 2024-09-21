import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/painting.dart';

/// 筛选项 配置类
class AuSelectionConfig extends AuBaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultSelectionConfig]
  AuSelectionConfig({
    AuTextStyle? menuNormalTextStyle,
    AuTextStyle? menuSelectedTextStyle,
    AuTextStyle? tagNormalTextStyle,
    AuTextStyle? tagSelectedTextStyle,
    double? tagRadius,
    Color? tagNormalBackgroundColor,
    Color? tagSelectedBackgroundColor,
    AuTextStyle? hintTextStyle,
    AuTextStyle? rangeTitleTextStyle,
    AuTextStyle? inputTextStyle,
    AuTextStyle? itemNormalTextStyle,
    AuTextStyle? itemSelectedTextStyle,
    AuTextStyle? itemBoldTextStyle,
    Color? deepNormalBgColor,
    Color? deepSelectBgColor,
    Color? middleNormalBgColor,
    Color? middleSelectBgColor,
    Color? lightNormalBgColor,
    Color? lightSelectBgColor,
    AuTextStyle? resetTextStyle,
    AuTextStyle? titleForMoreTextStyle,
    AuTextStyle? optionTextStyle,
    AuTextStyle? moreTextStyle,
    AuTextStyle? flayerNormalTextStyle,
    AuTextStyle? flayerSelectedTextStyle,
    AuTextStyle? flayerBoldTextStyle,
    super.configId,
  })  : _menuNormalTextStyle = menuNormalTextStyle,
        _menuSelectedTextStyle = menuSelectedTextStyle,
        _tagNormalTextStyle = tagNormalTextStyle,
        _tagSelectedTextStyle = tagSelectedTextStyle,
        _tagRadius = tagRadius,
        _tagNormalBackgroundColor = tagNormalBackgroundColor,
        _tagSelectedBackgroundColor = tagSelectedBackgroundColor,
        _hintTextStyle = hintTextStyle,
        _rangeTitleTextStyle = rangeTitleTextStyle,
        _inputTextStyle = inputTextStyle,
        _itemNormalTextStyle = itemNormalTextStyle,
        _itemSelectedTextStyle = itemSelectedTextStyle,
        _itemBoldTextStyle = itemBoldTextStyle,
        _deepNormalBgColor = deepNormalBgColor,
        _deepSelectBgColor = deepSelectBgColor,
        _middleNormalBgColor = middleNormalBgColor,
        _middleSelectBgColor = middleSelectBgColor,
        _lightNormalBgColor = lightNormalBgColor,
        _lightSelectBgColor = lightSelectBgColor,
        _resetTextStyle = resetTextStyle,
        _titleForMoreTextStyle = titleForMoreTextStyle,
        _optionTextStyle = optionTextStyle,
        _moreTextStyle = moreTextStyle,
        _flayerNormalTextStyle = flayerNormalTextStyle,
        _flayerSelectedTextStyle = flayerSelectedTextStyle,
        _flayerBoldTextStyle = flayerBoldTextStyle;

  /// menu 正常文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.normal,
  /// )
  AuTextStyle? _menuNormalTextStyle;

  /// menu 选中文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _menuSelectedTextStyle;

  /// tag 正常文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w400,
  /// )
  AuTextStyle? _tagNormalTextStyle;

  /// tag 选中文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _tagSelectedTextStyle;

  /// tag 圆角
  /// 默认为 [AuCommonConfig.radiusSm]
  double? _tagRadius;

  /// tag 正常背景色
  /// 默认为 [AuCommonConfig.fillBody]
  Color? _tagNormalBackgroundColor;

  /// tag 选中背景色
  /// 默认为 [AuCommonConfig.brandPrimary].withOpacity(0.12)
  Color? _tagSelectedBackgroundColor;

  /// 输入选项标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _rangeTitleTextStyle;

  /// 输入提示文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextHint],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _hintTextStyle;

  /// 输入框默认文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _inputTextStyle;

  /// item 正常字体样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _itemNormalTextStyle;

  /// item 选中文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemSelectedTextStyle;

  /// item 仅加粗样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _itemBoldTextStyle;

  /// 三级 item 背景色
  /// 默认为 Color(0xFFF0F0F0)
  Color? _deepNormalBgColor;

  /// 三级 item 选中背景色
  /// 默认为 Color(0xFFF8F8F8)
  Color? _deepSelectBgColor;

  /// 二级 item 背景色
  /// 默认为 Color(0xFFF8F8F8)
  Color? _middleNormalBgColor;

  /// 二级 item 选中背景色
  /// 默认为 Colors.white
  Color? _middleSelectBgColor;

  /// 一级 item 背景色
  /// 默认为 Colors.white
  Color? _lightNormalBgColor;

  /// 一级 item 选中背景色
  /// 默认为 Colors.white
  Color? _lightSelectBgColor;

  /// 重置按钮颜色
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextImportant],
  ///   fontSize: [AuCommonConfig.fontSizeCaption]
  /// )
  AuTextStyle? _resetTextStyle;

  /// 更多筛选-标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _titleForMoreTextStyle;

  /// 选项-显示文本
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _optionTextStyle;

  /// 更多文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  /// )
  AuTextStyle? _moreTextStyle;

  /// 跳转二级页-正常文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.normal,
  /// )
  AuTextStyle? _flayerNormalTextStyle;

  /// 跳转二级页-选中文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _flayerSelectedTextStyle;

  /// 跳转二级页-加粗文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600
  /// )
  AuTextStyle? _flayerBoldTextStyle;

  AuTextStyle get menuNormalTextStyle =>
      _menuNormalTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.menuNormalTextStyle;

  AuTextStyle get menuSelectedTextStyle =>
      _menuSelectedTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.menuSelectedTextStyle;

  AuTextStyle get tagNormalTextStyle =>
      _tagNormalTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.tagNormalTextStyle;

  AuTextStyle get tagSelectedTextStyle =>
      _tagSelectedTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.tagSelectedTextStyle;

  double get tagRadius =>
      _tagRadius ?? AuDefaultConfigUtils.defaultSelectionConfig.tagRadius;

  Color get tagNormalBackgroundColor =>
      _tagNormalBackgroundColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.tagNormalBackgroundColor;

  Color get tagSelectedBackgroundColor =>
      _tagSelectedBackgroundColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.tagSelectedBackgroundColor;

  AuTextStyle get rangeTitleTextStyle =>
      _rangeTitleTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.rangeTitleTextStyle;

  AuTextStyle get hintTextStyle =>
      _hintTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.hintTextStyle;

  AuTextStyle get inputTextStyle =>
      _inputTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.inputTextStyle;

  AuTextStyle get itemNormalTextStyle =>
      _itemNormalTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.itemNormalTextStyle;

  AuTextStyle get itemSelectedTextStyle =>
      _itemSelectedTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.itemSelectedTextStyle;

  AuTextStyle get itemBoldTextStyle =>
      _itemBoldTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.itemBoldTextStyle;

  Color get deepNormalBgColor =>
      _deepNormalBgColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.deepNormalBgColor;

  Color get deepSelectBgColor =>
      _deepSelectBgColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.deepSelectBgColor;

  Color get middleNormalBgColor =>
      _middleNormalBgColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.middleNormalBgColor;

  Color get middleSelectBgColor =>
      _middleSelectBgColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.middleSelectBgColor;

  Color get lightNormalBgColor =>
      _lightNormalBgColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.lightNormalBgColor;

  Color get lightSelectBgColor =>
      _lightSelectBgColor ??
      AuDefaultConfigUtils.defaultSelectionConfig.lightSelectBgColor;

  AuTextStyle get resetTextStyle =>
      _resetTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.resetTextStyle;

  AuTextStyle get titleForMoreTextStyle =>
      _titleForMoreTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.titleForMoreTextStyle;

  AuTextStyle get optionTextStyle =>
      _optionTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.optionTextStyle;

  AuTextStyle get moreTextStyle =>
      _moreTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.moreTextStyle;

  AuTextStyle get flayerNormalTextStyle =>
      _flayerNormalTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.flayerNormalTextStyle;

  AuTextStyle get flayerSelectedTextStyle =>
      _flayerSelectedTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.flayerSelectedTextStyle;

  AuTextStyle get flayerBoldTextStyle =>
      _flayerBoldTextStyle ??
      AuDefaultConfigUtils.defaultSelectionConfig.flayerBoldTextStyle;

  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局筛选配置
    AuSelectionConfig selectionConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .selectionConfig;

    _lightSelectBgColor ??= selectionConfig._lightSelectBgColor;
    _lightNormalBgColor ??= selectionConfig._lightNormalBgColor;
    _middleSelectBgColor ??= selectionConfig._middleSelectBgColor;
    _middleNormalBgColor ??= selectionConfig._middleNormalBgColor;
    _deepSelectBgColor ??= selectionConfig._deepSelectBgColor;
    _deepNormalBgColor ??= selectionConfig._deepNormalBgColor;
    _tagSelectedBackgroundColor ??= commonConfig.brandPrimary.withOpacity(0.12);
    _tagNormalBackgroundColor ??= commonConfig.fillBody;
    _tagRadius ??= commonConfig.radiusSm;
    _flayerBoldTextStyle = selectionConfig.flayerBoldTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_flayerBoldTextStyle),
    );
    _flayerSelectedTextStyle = selectionConfig.flayerSelectedTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_flayerSelectedTextStyle),
    );
    _flayerNormalTextStyle = selectionConfig.flayerNormalTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_flayerNormalTextStyle),
    );
    _moreTextStyle = selectionConfig.moreTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_moreTextStyle),
    );
    _optionTextStyle = selectionConfig.optionTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_optionTextStyle),
    );
    _titleForMoreTextStyle = selectionConfig.titleForMoreTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_titleForMoreTextStyle),
    );
    _resetTextStyle = selectionConfig.resetTextStyle.merge(AuTextStyle(
      color: commonConfig.colorTextImportant,
      fontSize: commonConfig.fontSizeCaption,
    ).merge(_resetTextStyle));
    _itemBoldTextStyle = selectionConfig.itemBoldTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_itemBoldTextStyle),
    );
    _itemSelectedTextStyle = selectionConfig.itemSelectedTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_itemSelectedTextStyle),
    );
    _itemNormalTextStyle = selectionConfig.itemNormalTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_itemNormalTextStyle),
    );
    _inputTextStyle = selectionConfig.inputTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_inputTextStyle),
    );
    _hintTextStyle = selectionConfig.hintTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextHint,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_hintTextStyle),
    );
    _rangeTitleTextStyle = selectionConfig.rangeTitleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_rangeTitleTextStyle),
    );
    _tagSelectedTextStyle = selectionConfig.tagSelectedTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagSelectedTextStyle),
    );
    _tagNormalTextStyle = selectionConfig.tagNormalTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagNormalTextStyle),
    );
    _menuNormalTextStyle = selectionConfig.menuNormalTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_menuNormalTextStyle),
    );
    _menuSelectedTextStyle = selectionConfig.menuSelectedTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_menuSelectedTextStyle),
    );
  }

  AuSelectionConfig copyWith({
    AuTextStyle? menuNormalTextStyle,
    AuTextStyle? menuSelectedTextStyle,
    AuTextStyle? tagTextStyle,
    AuTextStyle? tagSelectedTextStyle,
    double? tagRadius,
    Color? tagBackgroundColor,
    Color? tagSelectedBackgroundColor,
    AuTextStyle? hintTextStyle,
    AuTextStyle? rangeTitleTextStyle,
    AuTextStyle? inputTextStyle,
    AuTextStyle? itemNormalTextStyle,
    AuTextStyle? itemSelectedTextStyle,
    AuTextStyle? itemBoldTextStyle,
    Color? deepNormalBgColor,
    Color? deepSelectBgColor,
    Color? middleNormalBgColor,
    Color? middleSelectBgColor,
    Color? lightNormalBgColor,
    Color? lightSelectBgColor,
    AuTextStyle? resetTextStyle,
    AuTextStyle? titleForMoreTextStyle,
    AuTextStyle? optionTextStyle,
    AuTextStyle? moreTextStyle,
    AuTextStyle? flayerNormalTextStyle,
    AuTextStyle? flayerSelectedTextStyle,
    AuTextStyle? flayerBoldTextStyle,
  }) {
    return AuSelectionConfig(
      menuNormalTextStyle: menuNormalTextStyle ?? _menuNormalTextStyle,
      menuSelectedTextStyle: menuSelectedTextStyle ?? _menuSelectedTextStyle,
      tagNormalTextStyle: tagTextStyle ?? _tagNormalTextStyle,
      tagSelectedTextStyle: tagSelectedTextStyle ?? _tagSelectedTextStyle,
      tagRadius: tagRadius ?? _tagRadius,
      tagNormalBackgroundColor: tagBackgroundColor ?? _tagNormalBackgroundColor,
      tagSelectedBackgroundColor:
          tagSelectedBackgroundColor ?? _tagSelectedBackgroundColor,
      hintTextStyle: hintTextStyle ?? _hintTextStyle,
      rangeTitleTextStyle: rangeTitleTextStyle ?? _rangeTitleTextStyle,
      inputTextStyle: inputTextStyle ?? _inputTextStyle,
      itemNormalTextStyle: itemNormalTextStyle ?? _itemNormalTextStyle,
      itemSelectedTextStyle: itemSelectedTextStyle ?? _itemSelectedTextStyle,
      itemBoldTextStyle: itemBoldTextStyle ?? _itemBoldTextStyle,
      deepNormalBgColor: deepNormalBgColor ?? _deepNormalBgColor,
      deepSelectBgColor: deepSelectBgColor ?? _deepSelectBgColor,
      middleNormalBgColor: middleNormalBgColor ?? _middleNormalBgColor,
      middleSelectBgColor: middleSelectBgColor ?? _middleSelectBgColor,
      lightNormalBgColor: lightNormalBgColor ?? _lightNormalBgColor,
      lightSelectBgColor: lightSelectBgColor ?? _lightSelectBgColor,
      resetTextStyle: resetTextStyle ?? _resetTextStyle,
      titleForMoreTextStyle: titleForMoreTextStyle ?? _titleForMoreTextStyle,
      optionTextStyle: optionTextStyle ?? _optionTextStyle,
      moreTextStyle: moreTextStyle ?? _moreTextStyle,
      flayerNormalTextStyle: flayerNormalTextStyle ?? _flayerNormalTextStyle,
      flayerSelectedTextStyle:
          flayerSelectedTextStyle ?? _flayerSelectedTextStyle,
      flayerBoldTextStyle: flayerBoldTextStyle ?? _flayerBoldTextStyle,
    );
  }

  AuSelectionConfig merge(AuSelectionConfig other) {
    return copyWith(
      menuNormalTextStyle:
          menuNormalTextStyle.merge(other._menuNormalTextStyle),
      menuSelectedTextStyle:
          menuSelectedTextStyle.merge(other._menuSelectedTextStyle),
      tagTextStyle: tagNormalTextStyle.merge(other._tagNormalTextStyle),
      tagSelectedTextStyle:
          tagSelectedTextStyle.merge(other._tagSelectedTextStyle),
      tagRadius: other._tagRadius,
      tagBackgroundColor: other._tagNormalBackgroundColor,
      tagSelectedBackgroundColor: other._tagSelectedBackgroundColor,
      hintTextStyle: hintTextStyle.merge(other._hintTextStyle),
      rangeTitleTextStyle:
          rangeTitleTextStyle.merge(other._rangeTitleTextStyle),
      inputTextStyle: inputTextStyle.merge(other._inputTextStyle),
      itemNormalTextStyle:
          itemNormalTextStyle.merge(other._itemNormalTextStyle),
      itemSelectedTextStyle:
          itemSelectedTextStyle.merge(other._itemSelectedTextStyle),
      itemBoldTextStyle: itemBoldTextStyle.merge(other._itemBoldTextStyle),
      deepNormalBgColor: other._deepNormalBgColor,
      deepSelectBgColor: other._deepSelectBgColor,
      middleNormalBgColor: other._middleNormalBgColor,
      middleSelectBgColor: other._middleSelectBgColor,
      lightNormalBgColor: other._lightNormalBgColor,
      lightSelectBgColor: other._lightSelectBgColor,
      resetTextStyle: resetTextStyle.merge(other._resetTextStyle),
      titleForMoreTextStyle:
          titleForMoreTextStyle.merge(other._titleForMoreTextStyle),
      optionTextStyle: optionTextStyle.merge(other._optionTextStyle),
      moreTextStyle: moreTextStyle.merge(other._moreTextStyle),
      flayerNormalTextStyle:
          flayerNormalTextStyle.merge(other._flayerNormalTextStyle),
      flayerSelectedTextStyle:
          flayerSelectedTextStyle.merge(other._flayerSelectedTextStyle),
      flayerBoldTextStyle:
          flayerBoldTextStyle.merge(other._flayerBoldTextStyle),
    );
  }
}
