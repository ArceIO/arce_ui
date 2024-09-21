import 'package:arce_ui/src/components/navbar/au_appbar_theme.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/constants/au_strings_constants.dart';
import 'package:arce_ui/src/theme/base/au_base_config.dart';
import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef AuWidgetBuilder = Widget Function();

/// Appbar主题配置
class AuAppBarConfig extends AuBaseConfig {
  /// AuAppBar 主题配置，遵循外部主题配置
  /// 默认为 [AuDefaultConfigUtils.defaultAppBarConfig]
  AuAppBarConfig({
    Color? backgroundColor,
    double? appBarHeight,
    AuWidgetBuilder? leadIconBuilder,
    AuTextStyle? titleStyle,
    AuTextStyle? actionsStyle,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? showDefaultBottom,
    super.configId,
  })  : _backgroundColor = backgroundColor,
        _appBarHeight = appBarHeight,
        _leadIconBuilder = leadIconBuilder,
        _titleStyle = titleStyle,
        _actionsStyle = actionsStyle,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        _systemOverlayStyle = systemUiOverlayStyle,
        _showDefaultBottom = showDefaultBottom;

  AuAppBarConfig.dark({
    double? appBarHeight,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    super.configId,
  })  : _appBarHeight = appBarHeight,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize {
    _backgroundColor = const Color(0xff2E313B);
    _leadIconBuilder = () => Image.asset(
          AuAsset.iconBackWhite,
          package: AuStrings.flutterPackageName,
          width: AuAppBarTheme.iconSize,
          height: AuAppBarTheme.iconSize,
          fit: BoxFit.fitHeight,
        );
    _titleStyle = AuTextStyle(
      fontSize: AuAppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: AuAppBarTheme.darkTextColor,
    );
    _actionsStyle = AuTextStyle(
      color: AuAppBarTheme.darkTextColor,
      fontSize: AuAppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    );
    _systemOverlayStyle = SystemUiOverlayStyle.light;
  }

  AuAppBarConfig.light({
    double? appBarHeight,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    super.configId,
  })  : _appBarHeight = appBarHeight,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize {
    _backgroundColor = Colors.white;
    _leadIconBuilder = () => Image.asset(
          AuAsset.iconBackBlack,
          package: AuStrings.flutterPackageName,
          width: AuAppBarTheme.iconSize,
          height: AuAppBarTheme.iconSize,
          fit: BoxFit.fitHeight,
        );
    _titleStyle = AuTextStyle(
      fontSize: AuAppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: AuAppBarTheme.lightTextColor,
    );
    _actionsStyle = AuTextStyle(
      color: AuAppBarTheme.lightTextColor,
      fontSize: AuAppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    );
    _systemOverlayStyle = SystemUiOverlayStyle.dark;
  }

  /// AppBar 的背景色
  Color? _backgroundColor;

  Color get backgroundColor =>
      _backgroundColor ??
      AuDefaultConfigUtils.defaultAppBarConfig.backgroundColor;

  /// AppBar 的高度
  double? _appBarHeight;

  double get appBarHeight =>
      _appBarHeight ?? AuDefaultConfigUtils.defaultAppBarConfig.appBarHeight;

  /// 返回按钮的child widget，一般为Image
  AuWidgetBuilder? _leadIconBuilder;

  AuWidgetBuilder get leadIconBuilder =>
      _leadIconBuilder ??
      AuDefaultConfigUtils.defaultAppBarConfig.leadIconBuilder;

  /// 标题样式，仅当直接 title 设置为 String 生效
  ///
  /// **注意**：`fontSize` 必须传大小，否则报错
  AuTextStyle? _titleStyle;

  AuTextStyle get titleStyle =>
      _titleStyle ?? AuDefaultConfigUtils.defaultAppBarConfig.titleStyle;

  /// 右侧文字按钮样式，仅当直接actions里面元素为AuTextAction类型生效
  ///
  /// **注意**：`fontSize` 必须传大小，否则报错
  ///
  /// AuTextStyle(
  ///   color: AppBarBrightness(brightness).textColor,
  ///   fontSize: AuAppBarTheme.actionFontSize,
  ///   fontWeight: FontWeight.w600,
  /// )
  AuTextStyle? _actionsStyle;

  AuTextStyle get actionsStyle =>
      _actionsStyle ?? AuDefaultConfigUtils.defaultAppBarConfig.actionsStyle;

  /// AppBar title 的最大字符数 8
  int? _titleMaxLength;

  int get titleMaxLength =>
      _titleMaxLength ??
      AuDefaultConfigUtils.defaultAppBarConfig.titleMaxLength;

  /// 左右边距
  double? _leftAndRightPadding;

  double get leftAndRightPadding =>
      _leftAndRightPadding ??
      AuDefaultConfigUtils.defaultAppBarConfig.leftAndRightPadding;

  /// 元素间间距
  double? _itemSpacing;

  double get itemSpacing =>
      _itemSpacing ?? AuDefaultConfigUtils.defaultAppBarConfig.itemSpacing;

  /// title的padding
  EdgeInsets? _titlePadding;

  EdgeInsets get titlePadding =>
      _titlePadding ?? AuDefaultConfigUtils.defaultAppBarConfig.titlePadding;

  /// leadIcon 宽高，需要相同
  /// 默认为 20
  double? _iconSize;

  double get iconSize =>
      _iconSize ?? AuDefaultConfigUtils.defaultAppBarConfig.iconSize;

  /// statusBar 样式
  /// 默认为 [SystemUiOverlayStyle.dark]
  SystemUiOverlayStyle? _systemOverlayStyle;

  SystemUiOverlayStyle get systemOverlayStyle =>
      _systemOverlayStyle ??
      AuDefaultConfigUtils.defaultAppBarConfig.systemOverlayStyle;

  /// 是否展示Appbar bottom 分割线
  /// 默认为 [false]
  bool? _showDefaultBottom;

  bool get showDefaultBottom =>
      _showDefaultBottom ??
      AuDefaultConfigUtils.defaultAppBarConfig.showDefaultBottom;

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
    AuAppBarConfig appbarConfig =
        AuThemeConfigurator.instance.getConfig(configId: configId).appBarConfig;

    _backgroundColor ??= appbarConfig._backgroundColor;
    _appBarHeight ??= appbarConfig._appBarHeight;
    _leadIconBuilder ??= appbarConfig._leadIconBuilder;
    _titleStyle = appbarConfig.titleStyle.merge(_titleStyle);
    _actionsStyle = appbarConfig.actionsStyle.merge(_actionsStyle);
    _titleMaxLength ??= appbarConfig._titleMaxLength;
    _leftAndRightPadding ??= appbarConfig._leftAndRightPadding;
    _itemSpacing ??= appbarConfig._itemSpacing;
    _titlePadding ??= appbarConfig._titlePadding;
    _iconSize ??= appbarConfig._iconSize;
    _systemOverlayStyle ??= appbarConfig._systemOverlayStyle;
    _showDefaultBottom ??= appbarConfig._showDefaultBottom;
  }

  AuAppBarConfig copyWith({
    Color? backgroundColor,
    double? appBarHeight,
    AuWidgetBuilder? leadIconBuilder,
    AuTextStyle? titleStyle,
    AuTextStyle? actionsStyle,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? showDefaultBottom,
  }) {
    return AuAppBarConfig(
      backgroundColor: backgroundColor ?? _backgroundColor,
      appBarHeight: appBarHeight ?? _appBarHeight,
      leadIconBuilder: leadIconBuilder ?? _leadIconBuilder,
      titleStyle: titleStyle ?? _titleStyle,
      actionsStyle: actionsStyle ?? _actionsStyle,
      titleMaxLength: titleMaxLength ?? _titleMaxLength,
      leftAndRightPadding: leftAndRightPadding ?? _leftAndRightPadding,
      itemSpacing: itemSpacing ?? _itemSpacing,
      titlePadding: titlePadding ?? _titlePadding,
      iconSize: iconSize ?? _iconSize,
      systemUiOverlayStyle: systemUiOverlayStyle ?? _systemOverlayStyle,
      showDefaultBottom: showDefaultBottom ?? _showDefaultBottom,
    );
  }

  AuAppBarConfig merge(AuAppBarConfig? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other._backgroundColor,
      appBarHeight: other._appBarHeight,
      leadIconBuilder: other._leadIconBuilder,
      titleStyle: titleStyle.merge(other._titleStyle),
      actionsStyle: actionsStyle.merge(other._actionsStyle),
      titleMaxLength: other._titleMaxLength,
      leftAndRightPadding: other._leftAndRightPadding,
      itemSpacing: other._itemSpacing,
      titlePadding: other._titlePadding,
      iconSize: other._iconSize,
      systemUiOverlayStyle: other._systemOverlayStyle,
      showDefaultBottom: other._showDefaultBottom,
    );
  }
}
