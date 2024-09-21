import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';

/// 描述: form 表单项主配置类
class AuFormItemConfig extends AuBaseConfig {
  /// 遵循全局配置
  /// 默认为 [AuDefaultConfigUtils.defaultFormItemConfig]
  AuFormItemConfig({
    Color? backgroundColor,
    AuTextStyle? titleTextStyle,
    AuTextStyle? subTitleTextStyle,
    AuTextStyle? errorTextStyle,
    AuTextStyle? hintTextStyle,
    AuTextStyle? contentTextStyle,
    EdgeInsets? formPadding,
    EdgeInsets? titlePaddingSm,
    EdgeInsets? titlePaddingLg,
    EdgeInsets? optionsMiddlePadding,
    EdgeInsets? subTitlePadding,
    EdgeInsets? errorPadding,
    AuTextStyle? disableTextStyle,
    AuTextStyle? tipsTextStyle,
    AuTextStyle? headTitleTextStyle,
    AuTextStyle? optionTextStyle,
    AuTextStyle? optionSelectedTextStyle,
    super.configId,
  })  : _backgroundColor = backgroundColor,
        _titleTextStyle = titleTextStyle,
        _subTitleTextStyle = subTitleTextStyle,
        _errorTextStyle = errorTextStyle,
        _hintTextStyle = hintTextStyle,
        _contentTextStyle = contentTextStyle,
        _formPadding = formPadding,
        _titlePaddingSm = titlePaddingSm,
        _titlePaddingLg = titlePaddingLg,
        _optionsMiddlePadding = optionsMiddlePadding,
        _subTitlePadding = subTitlePadding,
        _errorPadding = errorPadding,
        _disableTextStyle = disableTextStyle,
        _tipsTextStyle = tipsTextStyle,
        _headTitleTextStyle = headTitleTextStyle,
        _optionTextStyle = optionTextStyle,
        _optionSelectedTextStyle = optionSelectedTextStyle;

  AuFormItemConfig.generatorFromConfigId(String configId) {
    initThemeConfig(configId);
  }

  /// 表单项整体背景色
  /// default color is Colors.White
  Color? _backgroundColor;

  /// 左侧标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  /// )
  AuTextStyle? _headTitleTextStyle;

  /// 左侧标题文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _titleTextStyle;

  /// 左侧辅助文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  /// )
  AuTextStyle? _subTitleTextStyle;

  /// 左侧 Error 文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandError],
  ///   fontSize: [AuCommonConfig.fontSizeCaption],
  /// )
  AuTextStyle? _errorTextStyle;

  /// 右侧 输入、选择提示文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextHint],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _hintTextStyle;

  /// 右侧 主要内容样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _contentTextStyle;

  /// 表单项 当有星号标识 上下右边距
  ///
  /// EdgeInsets.only(
  ///   left: 0,
  ///   top: [AuCommonConfig.vSpacingLg],
  ///   right: [AuCommonConfig.hSpacingLg],
  ///   bottom: [AuCommonConfig.vSpacingLg],
  /// )
  EdgeInsets? _formPadding;

  /// 表单项 当有星号标识 左边距
  ///
  /// EdgeInsets.only(left: 10)
  EdgeInsets? _titlePaddingSm;

  /// 表单项 当无星号标识 左右边距
  ///
  /// EdgeInsets.only(left: [AuCommonConfig.hSpacingLg])
  EdgeInsets? _titlePaddingLg;

  /// 选项之间间距 单选 or 多选
  ///
  /// EdgeInsets.only(left: [AuCommonConfig.hSpacingMd])
  EdgeInsets? _optionsMiddlePadding;

  /// 选项普通文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBase],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   height: 1.3,
  /// )
  AuTextStyle? _optionTextStyle;

  /// 选项选中文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.brandPrimary],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   height: 1.3,
  /// )
  AuTextStyle? _optionSelectedTextStyle;

  /// 子标题 左上间距
  ///
  /// EdgeInsets.only(
  ///   left: [AuCommonConfig.hSpacingLg],
  ///   top: [AuCommonConfig.vSpacingXs],
  /// )
  EdgeInsets? _subTitlePadding;

  /// error提示 左上间距
  ///
  /// EdgeInsets.only(
  ///   left: [AuCommonConfig.hSpacingLg],
  ///   top: [AuCommonConfig.vSpacingXs],
  /// )
  EdgeInsets? _errorPadding;

  /// 不可修改内容展示
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextDisabled],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _disableTextStyle;

  /// 提示文本样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextSecondary],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _tipsTextStyle;

  Color get backgroundColor =>
      _backgroundColor ??
      AuDefaultConfigUtils.defaultFormItemConfig.backgroundColor;

  AuTextStyle get headTitleTextStyle =>
      _headTitleTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.headTitleTextStyle;

  AuTextStyle get titleTextStyle =>
      _titleTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.titleTextStyle;

  AuTextStyle get subTitleTextStyle =>
      _subTitleTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.subTitleTextStyle;

  AuTextStyle get errorTextStyle =>
      _errorTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.errorTextStyle;

  AuTextStyle get hintTextStyle =>
      _hintTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.hintTextStyle;

  AuTextStyle get contentTextStyle =>
      _contentTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.contentTextStyle;

  EdgeInsets get formPadding =>
      _formPadding ?? AuDefaultConfigUtils.defaultFormItemConfig.formPadding;

  EdgeInsets get titlePaddingSm =>
      _titlePaddingSm ??
      AuDefaultConfigUtils.defaultFormItemConfig.titlePaddingSm;

  EdgeInsets get titlePaddingLg =>
      _titlePaddingLg ??
      AuDefaultConfigUtils.defaultFormItemConfig.titlePaddingLg;

  EdgeInsets get optionsMiddlePadding =>
      _optionsMiddlePadding ??
      AuDefaultConfigUtils.defaultFormItemConfig.optionsMiddlePadding;

  AuTextStyle get optionTextStyle =>
      _optionTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.optionTextStyle;

  AuTextStyle get optionSelectedTextStyle =>
      _optionSelectedTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.optionSelectedTextStyle;

  EdgeInsets get subTitlePadding =>
      _subTitlePadding ??
      AuDefaultConfigUtils.defaultFormItemConfig.subTitlePadding;

  EdgeInsets get errorPadding =>
      _errorPadding ?? AuDefaultConfigUtils.defaultFormItemConfig.errorPadding;

  AuTextStyle get disableTextStyle =>
      _disableTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.disableTextStyle;

  AuTextStyle get tipsTextStyle =>
      _tipsTextStyle ??
      AuDefaultConfigUtils.defaultFormItemConfig.tipsTextStyle;

  /// 举例：
  /// ① 尝试获取最近的配置 [topRadius] 若配不为 null，直接使用该配置.
  /// ② [topRadius] 若为 null，尝试使用 全局配置中的配置 AuFormItemConfig.
  /// ③ 如果全局配置中的配置同样为 null 则根据 [configId] 取出全局配置。
  /// ④ 如果没有配置 [configId] 的全局配置，则使用 Bruno 默认的配置
  @override
  void initThemeConfig(
    String configId, {
    AuCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局form组件配置
    AuFormItemConfig formItemThemeData = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .formItemConfig;

    _backgroundColor ??= formItemThemeData.backgroundColor;
    _titlePaddingSm ??= formItemThemeData.titlePaddingSm;
    _titlePaddingLg ??= formItemThemeData.titlePaddingLg;
    _optionSelectedTextStyle = formItemThemeData.optionSelectedTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_optionSelectedTextStyle),
    );
    _optionTextStyle = formItemThemeData.optionTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_optionTextStyle),
    );
    _headTitleTextStyle = formItemThemeData.headTitleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_headTitleTextStyle),
    );
    _errorPadding ??= EdgeInsets.only(
      left: commonConfig.hSpacingLg,
      right: formItemThemeData.errorPadding.right,
      top: commonConfig.vSpacingXs,
      bottom: formItemThemeData.errorPadding.bottom,
    );
    _subTitlePadding ??= EdgeInsets.only(
      left: commonConfig.hSpacingLg,
      right: formItemThemeData.subTitlePadding.right,
      top: commonConfig.vSpacingXs,
      bottom: formItemThemeData.subTitlePadding.bottom,
    );
    _formPadding ??= EdgeInsets.only(
      left: formItemThemeData.formPadding.left,
      right: commonConfig.hSpacingLg,
      top: commonConfig.vSpacingLg,
      bottom: commonConfig.vSpacingLg,
    );
    _tipsTextStyle = formItemThemeData.tipsTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_tipsTextStyle),
    );
    _disableTextStyle = formItemThemeData.disableTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextDisabled,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_disableTextStyle),
    );
    _contentTextStyle = formItemThemeData.contentTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_contentTextStyle),
    );
    _hintTextStyle = formItemThemeData.hintTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextHint,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_hintTextStyle),
    );
    _titleTextStyle = formItemThemeData.titleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_titleTextStyle),
    );
    _subTitleTextStyle = formItemThemeData.subTitleTextStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_subTitleTextStyle),
    );
    _errorTextStyle = formItemThemeData.errorTextStyle.merge(
      AuTextStyle(
        color: commonConfig.brandError,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_errorTextStyle),
    );
    _optionsMiddlePadding ??= formItemThemeData.optionsMiddlePadding;
  }

  AuFormItemConfig copyWith({
    Color? backgroundColor,
    AuTextStyle? titleTextStyle,
    AuTextStyle? subTitleTextStyle,
    AuTextStyle? errorTextStyle,
    AuTextStyle? hintTextStyle,
    AuTextStyle? contentTextStyle,
    EdgeInsets? formPadding,
    EdgeInsets? titlePaddingSm,
    EdgeInsets? titlePaddingLg,
    EdgeInsets? optionsMiddlePadding,
    EdgeInsets? subTitlePadding,
    EdgeInsets? errorPadding,
    AuTextStyle? disableTextStyle,
    AuTextStyle? tipsTextStyle,
    AuTextStyle? headTitleTextStyle,
    AuTextStyle? optionTextStyle,
    AuTextStyle? optionSelectedTextStyle,
  }) {
    return AuFormItemConfig(
      backgroundColor: backgroundColor ?? _backgroundColor,
      titleTextStyle: titleTextStyle ?? _titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? _subTitleTextStyle,
      errorTextStyle: errorTextStyle ?? _errorTextStyle,
      hintTextStyle: hintTextStyle ?? _hintTextStyle,
      contentTextStyle: contentTextStyle ?? _contentTextStyle,
      formPadding: formPadding ?? _formPadding,
      titlePaddingSm: titlePaddingSm ?? _titlePaddingSm,
      titlePaddingLg: titlePaddingLg ?? _titlePaddingLg,
      optionsMiddlePadding: optionsMiddlePadding ?? _optionsMiddlePadding,
      subTitlePadding: subTitlePadding ?? _subTitlePadding,
      errorPadding: errorPadding ?? _errorPadding,
      disableTextStyle: disableTextStyle ?? _disableTextStyle,
      tipsTextStyle: tipsTextStyle ?? _tipsTextStyle,
      headTitleTextStyle: headTitleTextStyle ?? _headTitleTextStyle,
      optionTextStyle: optionTextStyle ?? _optionTextStyle,
      optionSelectedTextStyle:
          optionSelectedTextStyle ?? _optionSelectedTextStyle,
    );
  }

  AuFormItemConfig merge(AuFormItemConfig? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other._backgroundColor,
      titleTextStyle: titleTextStyle.merge(other._titleTextStyle),
      subTitleTextStyle: subTitleTextStyle.merge(other._subTitleTextStyle),
      errorTextStyle: errorTextStyle.merge(other._errorTextStyle),
      hintTextStyle: hintTextStyle.merge(other._hintTextStyle),
      contentTextStyle: contentTextStyle.merge(other._contentTextStyle),
      formPadding: other._formPadding,
      titlePaddingSm: other._titlePaddingSm,
      titlePaddingLg: other._titlePaddingLg,
      optionsMiddlePadding: other._optionsMiddlePadding,
      subTitlePadding: other._subTitlePadding,
      errorPadding: other._errorPadding,
      disableTextStyle: disableTextStyle.merge(other._disableTextStyle),
      tipsTextStyle: tipsTextStyle.merge(other._tipsTextStyle),
      headTitleTextStyle: headTitleTextStyle.merge(other._headTitleTextStyle),
      optionTextStyle: optionTextStyle.merge(other._optionTextStyle),
      optionSelectedTextStyle:
          optionSelectedTextStyle.merge(other._optionSelectedTextStyle),
    );
  }
}
