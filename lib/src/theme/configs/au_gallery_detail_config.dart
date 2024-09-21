import 'package:arce_ui/src/components/navbar/au_appbar_theme.dart';
import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';

import 'au_appbar_config.dart';

/// 查看大图配置
class AuGalleryDetailConfig extends AuBaseConfig {
  /// 遵循全局配置
  /// 默认为 [AuDefaultConfigUtils.defaultGalleryDetailConfig]
  AuGalleryDetailConfig({
    AuTextStyle? appbarTitleStyle,
    AuTextStyle? appbarActionStyle,
    Color? appbarBackgroundColor,
    AuAppBarConfig? appbarConfig,
    AuTextStyle? tabBarUnSelectedLabelStyle,
    AuTextStyle? tabBarLabelStyle,
    Color? tabBarBackgroundColor,
    Color? pageBackgroundColor,
    Color? bottomBackgroundColor,
    AuTextStyle? titleStyle,
    AuTextStyle? contentStyle,
    AuTextStyle? actionStyle,
    Color? iconColor,
    super.configId,
  })  : _appbarTitleStyle = appbarTitleStyle,
        _appbarActionStyle = appbarActionStyle,
        _appbarBackgroundColor = appbarBackgroundColor,
        _appbarConfig = appbarConfig,
        _tabBarUnSelectedLabelStyle = tabBarUnSelectedLabelStyle,
        _tabBarLabelStyle = tabBarLabelStyle,
        _tabBarBackgroundColor = tabBarBackgroundColor,
        _pageBackgroundColor = pageBackgroundColor,
        _bottomBackgroundColor = bottomBackgroundColor,
        _titleStyle = titleStyle,
        _contentStyle = contentStyle,
        _actionStyle = actionStyle,
        _iconColor = iconColor;

  /// 黑色主题
  AuGalleryDetailConfig.dark({
    super.configId,
  }) {
    _appbarTitleStyle = AuTextStyle(color: commonConfig.colorTextBaseInverse);
    _appbarActionStyle = AuTextStyle(color: AuAppBarTheme.lightTextColor);
    _appbarBackgroundColor = Colors.black;
    _appbarConfig = AuAppBarConfig.dark();
    _tabBarUnSelectedLabelStyle = AuTextStyle(color: const Color(0XFFCCCCCC));
    _tabBarLabelStyle = AuTextStyle(color: commonConfig.colorTextBaseInverse);
    _tabBarBackgroundColor = Colors.black;
    _pageBackgroundColor = Colors.black;
    _bottomBackgroundColor = const Color(0X88000000);
    _titleStyle = AuTextStyle(color: commonConfig.colorTextBaseInverse);
    _contentStyle = AuTextStyle(color: const Color(0xFFCCCCCC));
    _actionStyle = AuTextStyle(color: commonConfig.colorTextBaseInverse);
    _iconColor = Colors.white;
  }

  /// 白色主题
  AuGalleryDetailConfig.light({
    super.configId,
  }) {
    _appbarTitleStyle = AuTextStyle(color: commonConfig.colorTextBase);
    _appbarActionStyle = AuTextStyle(color: commonConfig.colorTextBase);
    _appbarBackgroundColor = commonConfig.fillBody;
    _appbarConfig = AuAppBarConfig.light();
    _tabBarUnSelectedLabelStyle = AuTextStyle(
      color: commonConfig.colorTextBase,
    );
    _tabBarLabelStyle = AuTextStyle(color: commonConfig.brandPrimary);
    _tabBarBackgroundColor = commonConfig.fillBody;
    _pageBackgroundColor = commonConfig.fillBody;
    _bottomBackgroundColor = commonConfig.fillBody.withOpacity(.85);
    _titleStyle = AuTextStyle(color: commonConfig.colorTextBase);
    _contentStyle = AuTextStyle(color: commonConfig.colorTextBase);
    _actionStyle = AuTextStyle(color: commonConfig.colorTextSecondary);
    _iconColor = commonConfig.colorTextSecondary;
  }

  /// appbar   brightness待定

  /// appbar 标题样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBaseInverse],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _appbarTitleStyle;

  /// 右侧操作区域文案样式
  ///
  /// AuTextStyle(
  ///   color: AppBarBrightness(brightness).textColor,
  ///   fontSize: AuAppBarTheme.actionFontSize,
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _appbarActionStyle;

  /// appBar 背景色
  /// 默认为 Colors.black
  Color? _appbarBackgroundColor;

  /// appbar brightness
  /// 默认为 [Brightness.dark]
  AuAppBarConfig? _appbarConfig;

  /// tabBar 标题普通样式
  ///
  /// AuTextStyle(
  ///   color: Colors.red,
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  /// )
  AuTextStyle? _tabBarUnSelectedLabelStyle;

  /// tabBar 标题选中样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBaseInverse],
  ///   fontSize: [AuCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _tabBarLabelStyle;

  /// tabBar 背景色
  /// 默认为 Colors.black
  Color? _tabBarBackgroundColor;

  /// 页面 背景色
  /// 默认为 Colors.black
  Color? _pageBackgroundColor;

  /// 底部内容区域的背景色
  /// 默认为 Color(0x88000000)
  Color? _bottomBackgroundColor;

  /// 标题文案样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBaseInverse],
  ///   fontSize: [AuCommonConfig.fontSizeHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _titleStyle;

  /// 内容文案样式
  ///
  /// AuTextStyle(
  ///   color: Color(0xFFCCCCCC),
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _contentStyle;

  /// 右侧展开收起样式
  ///
  /// AuTextStyle(
  ///   color: [AuCommonConfig.colorTextBaseInverse],
  ///   fontSize: [AuCommonConfig.fontSizeBase],
  /// )
  AuTextStyle? _actionStyle;

  /// icon 颜色
  /// 默认为 Colors.white
  Color? _iconColor;

  AuTextStyle get appbarTitleStyle =>
      _appbarTitleStyle ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.appbarTitleStyle;

  AuTextStyle get appbarActionStyle =>
      _appbarActionStyle ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.appbarActionStyle;

  Color get appbarBackgroundColor =>
      _appbarBackgroundColor ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.appbarBackgroundColor;

  AuAppBarConfig get appbarConfig =>
      _appbarConfig ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.appbarConfig;

  AuTextStyle get tabBarUnSelectedLabelStyle =>
      _tabBarUnSelectedLabelStyle ??
      AuDefaultConfigUtils
          .defaultGalleryDetailConfig.tabBarUnSelectedLabelStyle;

  AuTextStyle get tabBarLabelStyle =>
      _tabBarLabelStyle ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.tabBarLabelStyle;

  Color get tabBarBackgroundColor =>
      _tabBarBackgroundColor ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.tabBarBackgroundColor;

  Color get pageBackgroundColor =>
      _pageBackgroundColor ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.pageBackgroundColor;

  Color get bottomBackgroundColor =>
      _bottomBackgroundColor ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.bottomBackgroundColor;

  AuTextStyle get titleStyle =>
      _titleStyle ?? AuDefaultConfigUtils.defaultGalleryDetailConfig.titleStyle;

  AuTextStyle get contentStyle =>
      _contentStyle ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.contentStyle;

  AuTextStyle get actionStyle =>
      _actionStyle ??
      AuDefaultConfigUtils.defaultGalleryDetailConfig.actionStyle;

  Color get iconColor =>
      _iconColor ?? AuDefaultConfigUtils.defaultGalleryDetailConfig.iconColor;

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
    AuGalleryDetailConfig galleryDetailConfig = AuThemeConfigurator.instance
        .getConfig(configId: configId)
        .galleryDetailConfig;

    _appbarTitleStyle = galleryDetailConfig.appbarTitleStyle.merge(
      AuTextStyle(
        color: commonConfig.colorTextBaseInverse,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_appbarTitleStyle),
    );
    _appbarActionStyle = galleryDetailConfig.appbarActionStyle.merge(
      _appbarActionStyle,
    );
    _appbarConfig ??= galleryDetailConfig.appbarConfig;
    _appbarBackgroundColor ??= galleryDetailConfig.appbarBackgroundColor;
    _tabBarUnSelectedLabelStyle = galleryDetailConfig.tabBarUnSelectedLabelStyle
        .merge(AuTextStyle(fontSize: commonConfig.fontSizeSubHead))
        .merge(_tabBarUnSelectedLabelStyle);
    _tabBarLabelStyle = galleryDetailConfig.tabBarLabelStyle
        .merge(
          AuTextStyle(
            color: commonConfig.colorTextBaseInverse,
            fontSize: commonConfig.fontSizeSubHead,
          ),
        )
        .merge(_tabBarLabelStyle);
    _tabBarBackgroundColor ??= galleryDetailConfig._tabBarBackgroundColor;
    _pageBackgroundColor ??= galleryDetailConfig._pageBackgroundColor;
    _bottomBackgroundColor ??= galleryDetailConfig._bottomBackgroundColor;
    _titleStyle = galleryDetailConfig.titleStyle
        .merge(
          AuTextStyle(
            color: commonConfig.colorTextBaseInverse,
            fontSize: commonConfig.fontSizeHead,
          ),
        )
        .merge(_titleStyle);
    _contentStyle = galleryDetailConfig.contentStyle
        .merge(AuTextStyle(fontSize: commonConfig.fontSizeBase))
        .merge(_contentStyle);
    _actionStyle = galleryDetailConfig.actionStyle
        .merge(
          AuTextStyle(
            color: commonConfig.colorTextBaseInverse,
            fontSize: commonConfig.fontSizeBase,
          ),
        )
        .merge(_actionStyle);
    _iconColor ??= galleryDetailConfig._iconColor;
  }

  AuGalleryDetailConfig copyWith({
    AuTextStyle? appbarTitleStyle,
    AuTextStyle? appbarActionStyle,
    Color? appbarBackgroundColor,
    AuAppBarConfig? appbarConfig,
    AuTextStyle? tabBarUnSelectedLabelStyle,
    Color? tabBarUnselectedLabelColor,
    AuTextStyle? tabBarLabelStyle,
    Color? tabBarLabelColor,
    Color? tabBarBackgroundColor,
    Color? indicatorColor,
    Color? pageBackgroundColor,
    Color? bottomBackgroundColor,
    AuTextStyle? titleStyle,
    AuTextStyle? contentStyle,
    AuTextStyle? actionStyle,
    Color? iconColor,
  }) {
    return AuGalleryDetailConfig(
      appbarTitleStyle: appbarTitleStyle ?? _appbarTitleStyle,
      appbarActionStyle: appbarActionStyle ?? _appbarActionStyle,
      appbarBackgroundColor: appbarBackgroundColor ?? _appbarBackgroundColor,
      appbarConfig: appbarConfig ?? _appbarConfig,
      tabBarUnSelectedLabelStyle:
          tabBarUnSelectedLabelStyle ?? _tabBarUnSelectedLabelStyle,
      tabBarLabelStyle: tabBarLabelStyle ?? _tabBarLabelStyle,
      tabBarBackgroundColor: tabBarBackgroundColor ?? _tabBarBackgroundColor,
      pageBackgroundColor: pageBackgroundColor ?? _pageBackgroundColor,
      bottomBackgroundColor: bottomBackgroundColor ?? _bottomBackgroundColor,
      titleStyle: titleStyle ?? _titleStyle,
      contentStyle: contentStyle ?? _contentStyle,
      actionStyle: actionStyle ?? _actionStyle,
      iconColor: iconColor ?? _iconColor,
    );
  }

  AuGalleryDetailConfig merge(AuGalleryDetailConfig? other) {
    if (other == null) return this;
    return copyWith(
      appbarTitleStyle: appbarTitleStyle.merge(other._appbarTitleStyle),
      appbarActionStyle: appbarActionStyle.merge(other._appbarActionStyle),
      appbarBackgroundColor: other._appbarBackgroundColor,
      appbarConfig: other._appbarConfig,
      tabBarUnSelectedLabelStyle:
          tabBarUnSelectedLabelStyle.merge(other._tabBarUnSelectedLabelStyle),
      tabBarLabelStyle: tabBarLabelStyle.merge(other._tabBarLabelStyle),
      tabBarBackgroundColor: other._tabBarBackgroundColor,
      pageBackgroundColor: other._pageBackgroundColor,
      bottomBackgroundColor: other._bottomBackgroundColor,
      titleStyle: titleStyle.merge(other._titleStyle),
      contentStyle: contentStyle.merge(other._contentStyle),
      actionStyle: actionStyle.merge(other._actionStyle),
      iconColor: other._iconColor,
    );
  }
}
