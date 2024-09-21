import 'package:arce_ui/src/components/line/au_line.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_appbar_config.dart';
import 'package:bindings_compatible/bindings_compatible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// AppBar组件,基于[AppBar]封装。为了解决原生的AppBar对Leading宽度的限制
/// 在1.21版本之后，Flutter放开了宽度的限制[https://github.com/flutter/flutter/blob/flutter-1.21-candidate.0/packages/flutter/lib/src/material/app_bar.dart]
///
/// 布局规则：
///    leading是左侧显示的内容
///    title是中间显示的内容
///    action是右侧显示的内容
///    呈现的依然是AppBar，优化点在于：第一 title可以传入String
///                               第二 action和leading 封装了快捷使用
///
/// 用户如果想自定义 使用效果完全可以传入appbar的属性
///
/// 布局步骤：同appbar默认的布局 先leading、后action，最后title
///
///    首先，计算leading的宽度 外部传入则可以leadingWidth 则已外部传入为主
///
///         该组件为[AuDoubleLeading]和[AuBackLeading]提供了计算
///         leading默认的大小是[AuAppBarConfig.leadingSize],
///         [AuDoubleLeading]的大小是 但是Leading的宽度的2倍+间距
///
///         leadingWidth默认宽度为AuAppBarConfig.leadingSize
///         如果传入的leading是完全自定义的Widget，可以自行设置leadingWidth
///
///    其次，摆放action
///
///    最后，对齐title
///
/// 组件支持两种显示模式深色和浅色。 通过[AuAppBar.brightness]属性设置，
/// 深色[Brightness.dark]模式，背景色是黑色，icon和文字颜色是白色。
/// 浅色[Brightness.light]模式，背景色是白色，icon和文字颜色是黑色。
/// 如果使用默认的[AuBackLeading]和[AuAppBarTitle]
/// BkAppBar中的文字颜色和backLeading可自动随着[AuAppBar.brightness]变化。
///
/// 组件提供了默认的返回leading，如果不需要默认的leading可以设置[automaticallyImplyLeading]为false
/// 默认的leading，提供了默认的返回[Navigator.pop(context)]，
/// 如果是native打开的话，可能需要单独处理,否则会出现白屏
///
/// 其他属性同AppBar本身的含义
///
/// 显示：返回按钮、Appbar示例文本
/// AuAppBar(
///   title: 'Appbar示例',
/// )
///
/// 显示：自定义leading、tab切换、自定义action
/// AuAppBar(
///   leading: AuBackLeading(),
///   title: Row(
///   mainAxisSize: MainAxisSize.min,
///      crossAxisAlignment: CrossAxisAlignment.start,
///      children: <Widget>[
///      GestureDetector(
///         onTap: () {
///           currentIndex = 0;
///           setState(() {});
///          },
///         child: Text(
///           '二手',
///            style: currentIndex == 0 ? selectedHeiStyle : unSelectedHeiStyle,
///           ),
///      ),
///      SizedBox(
///         width: 24,
///      ),
///      GestureDetector(
///         onTap: () {
///           currentIndex = 1;
///           setState(() {});
///         },
///         child: Text(
///           '新房',
///            style: currentIndex == 1 ? selectedHeiStyle : unSelectedHeiStyle,
///         ),
///       )
///      ],
///    ),
///  actions: AuIconAction()
///
/// 相关组件如下:
///  * [AuBackLeading], 自定义leading，单个文本或按钮
///  * [AuDoubleLeading], 自定义leading，两个文本或按钮
///  * [AuAppBarTitle], 自定义title，纯文本展示
///  * [AuIconAction], 自定义action，显示icon
///  * [AuTextAction], 自定义action，纯文本展示
///  * [AuBarBottomDivider], appbar与其他元素的分割线，同[AuLine]
///
///
class AuAppBar extends PreferredSize {
  /// 导航栏左侧活动区域,在为null且
  /// [automaticallyImplyLeading]为true时默认赋值为[AuBackLeading]
  final Widget? leading;

  /// AppBar标题,必须是String或者Widget类型
  /// 为String时,会使用[AuAppBarTitle]来加载title
  final dynamic title;

  /// 为了方便业务使用，可以设置为Widget或者List<Widget>
  /// 传入的Widget会自动添加边距并转化为List<Widget>
  /// 传入的List<Widget>会自动添加右边距和action之间的间距
  final dynamic actions;

  /// 是否自动添加Leading实现
  final bool automaticallyImplyLeading;

  /// 以下属性都对应于[AppBar]中的属性
  /// 详细介绍可以查阅[AppBar]的文档
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final double elevation;
  final double toolbarOpacity;
  final double bottomOpacity;
  final Alignment titleAlignment;
  final Widget? flexibleSpace;
  final double? leadingWidth;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;

  /// 默认处理了返回按钮，flutter的pop，如果是native打开的话，可能需要单独处理,否则会出现白屏
  /// backLeadCallback是默认的处理回调
  /// DefaultLeadingCallBack 也可以通过改方法参数 设置统一的返回处理，该参数是静态的
  final VoidCallback? backLeadCallback;

  /// 是否显示默认的eeeeee分割线，默认显示，可以设置为不显示
  final bool? showDefaultBottom;
  final bool showLeadingDivider;
  final AuAppBarConfig? themeData;
  final SystemUiOverlayStyle? systemOverlayStyle;

  AuAppBar(
      {super.key,
      this.leading,
      this.showLeadingDivider = false,
      this.title,
      this.actions,
      this.backgroundColor,
      this.bottom,
      this.elevation = 0,
      this.automaticallyImplyLeading = true,
      this.toolbarOpacity = 1.0,
      this.bottomOpacity = 1.0,
      this.titleAlignment = Alignment.center,
      this.flexibleSpace,
      this.backLeadCallback,
      this.showDefaultBottom,
      this.themeData,
      this.leadingWidth,
      this.shadowColor,
      this.shape,
      this.iconTheme,
      this.actionsIconTheme,
      this.excludeHeaderSemantics = false,
      this.primary = true,
      this.systemOverlayStyle,
      this.titleSpacing})
      : assert(
            actions == null || actions is Widget || (actions is List<Widget>)),
        assert(title == null || title is String || title is Widget),
        super(child: Container(), preferredSize: const Size(0, 0));

  AuAppBar.buildSearchResultStyle(
      {super.key,
      String? title,
      this.backgroundColor,
      this.bottom,
      this.showLeadingDivider = true,
      this.flexibleSpace,
      this.backLeadCallback,
      this.showDefaultBottom = true,
      this.themeData,
      this.leadingWidth,
      this.shadowColor,
      this.shape,
      this.iconTheme,
      this.actionsIconTheme,
      this.excludeHeaderSemantics = false,
      this.primary = true,
      this.systemOverlayStyle,
      this.titleSpacing})
      : actions = null,
        elevation = 0,
        toolbarOpacity = 1.0,
        bottomOpacity = 1.0,
        leading = null,
        automaticallyImplyLeading = false,
        titleAlignment = Alignment.centerLeft,
        title = _AuSearchResultAppBar(
          appBarConfig: themeData,
          backgroundColor: backgroundColor,
          title: title,
          bottom: bottom,
          showLeadingDivider: showLeadingDivider,
          flexibleSpace: flexibleSpace,
          backLeadCallback: backLeadCallback,
          showDefaultBottom: showDefaultBottom,
        ),
        super(child: Container(), preferredSize: const Size(0, 0));

  @override
  Size get preferredSize {
    AuAppBarConfig defaultConfig = themeData ?? AuAppBarConfig();
    defaultConfig = AuThemeConfigurator.instance
        .getConfig(configId: defaultConfig.configId)
        .appBarConfig
        .merge(defaultConfig);
    return Size.fromHeight(
        defaultConfig.appBarHeight + (bottom?.preferredSize.height ?? 0.0));
  }

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultConfig = themeData ?? AuAppBarConfig();
    defaultConfig = AuThemeConfigurator.instance
        .getConfig(configId: defaultConfig.configId)
        .appBarConfig
        .merge(defaultConfig);

    defaultConfig = defaultConfig.merge(AuAppBarConfig(
        backgroundColor: backgroundColor,
        showDefaultBottom: showDefaultBottom,
        systemUiOverlayStyle: systemOverlayStyle));

    useWidgetsBinding().addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(defaultConfig.systemOverlayStyle);
    });

    Widget? flexibleSpace;
    if (this.flexibleSpace != null) {
      flexibleSpace = SizedBox(
        height: defaultConfig.appBarHeight +
            MediaQueryData.fromView(View.of(context)).padding.top,
        child: this.flexibleSpace,
      );
    }

    return AppBar(
      key: key,
      leading: _wrapLeading(defaultConfig),
      leadingWidth: leadingWidth ?? _culLeadingSize(defaultConfig),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: _buildAppBarTitle(defaultConfig),
      centerTitle: true,
      elevation: elevation,
      backgroundColor: defaultConfig.backgroundColor,
      actions: _wrapActions(defaultConfig),
      bottom: _buildBarBottom(defaultConfig),
      systemOverlayStyle: defaultConfig.systemOverlayStyle,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      flexibleSpace: flexibleSpace,
      shadowColor: shadowColor,
      shape: shape,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      excludeHeaderSemantics: excludeHeaderSemantics,
    );
  }

  PreferredSizeWidget? _buildBarBottom(AuAppBarConfig defaultConfig) {
    if (defaultConfig.systemOverlayStyle.statusBarBrightness ==
        Brightness.light) {
      if (bottom == null && defaultConfig.showDefaultBottom) {
        return AuBarBottomDivider();
      }
    }
    return bottom;
  }

  // 根据输入的leading 设置默认的leadingWidth
  double _culLeadingSize(AuAppBarConfig themeData) {
    if (leadingWidth != null) {
      return leadingWidth!;
    }
    if (leading is AuDoubleLeading) {
      return themeData.leftAndRightPadding +
          themeData.itemSpacing +
          themeData.iconSize * 2;
    }

    if (leading == null && !automaticallyImplyLeading) {
      return 0;
    }
    return themeData.leftAndRightPadding + themeData.iconSize;
  }

  // 对[actions]进行包装: 单一的Widget会添加右边距
  //                     List<Widget>在添加右边距的 并 添加action中的间距
  List<Widget>? _wrapActions(AuAppBarConfig themeData) {
    if (actions == null || !(actions is List<Widget> || actions is Widget)) {
      return null;
    }
    List<Widget> actionList = <Widget>[];

    if (actions is List<Widget>) {
      if (actions.isEmpty) {
        return actionList;
      }
      List<Widget> tmp = (actions as List<Widget>).map((_) {
        return (_ is AuTextAction) ? _warpRealAction(_) : _;
      }).toList();

      for (int i = 0, n = tmp.length; i < n; i++) {
        actionList.add(tmp[i]);
        if (i != n - 1) actionList.add(SizedBox(width: themeData.itemSpacing));
      }
    } else {
      Widget realAction =
          (actions is AuTextAction) ? _warpRealAction(actions) : actions;
      actionList.add(realAction);
    }
    return actionList..add(SizedBox(width: themeData.leftAndRightPadding));
  }

  AuTextAction _warpRealAction(AuTextAction textAction) {
    return AuTextAction(
      textAction.text,
      iconPressed: textAction.iconPressed,
      themeData: themeData,
      key: textAction.key,
    );
  }

  // 详情请参考_ToolbarLayout的布局方法
  Widget? _buildAppBarTitle(
    AuAppBarConfig themeData,
  ) {
    Widget? realTitle;
    if (title is Widget) {
      return title;
    }
    if (title is String) {
      realTitle = AuAppBarTitle(
        title,
        themeData: themeData,
      );
    }

    return realTitle;
  }

  // 如果leading是AuBackLeading 需要添加左边距
  Widget? _wrapLeading(AuAppBarConfig barConfig) {
    Widget? realLeading = leading;
    if (leading == null && automaticallyImplyLeading) {
      realLeading = AuBackLeading(
        iconPressed: backLeadCallback,
        themeData: barConfig,
      );
    }
    if (realLeading is AuBackLeading) {
      return Container(
        padding: EdgeInsets.only(left: barConfig.leftAndRightPadding),
        child: realLeading,
      );
    }
    return realLeading;
  }
}

/// [AuAppBar]中leading的默认实现
/// 宽度范围是40
class AuBackLeading extends StatelessWidget {
  final Widget? child;
  final VoidCallback? iconPressed;
  final AuAppBarConfig? themeData;

  const AuBackLeading({
    super.key,
    this.iconPressed,
    this.child,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultThemeData = themeData ?? AuAppBarConfig();
    defaultThemeData = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeData.configId)
        .appBarConfig
        .merge(defaultThemeData);

    defaultThemeData = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeData.configId)
        .appBarConfig
        .merge(defaultThemeData);

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: defaultThemeData.iconSize +
              defaultThemeData.leftAndRightPadding,
          height: defaultThemeData.appBarHeight),
      child: IconButton(
        alignment: Alignment.centerRight,
        icon: child ?? defaultThemeData.leadIconBuilder(),
        onPressed: iconPressed ??
            () {
              /// 默认处理了返回按钮，flutter的pop，如果是native打开的话，可能需要单独处理,否则会出现白屏
              /// backLeadCallback是默认的处理回调
              /// DefaultLeadingCallBack 也可以通过改方法参数 设置统一的返回处理，该参数是静态的
              Navigator.maybePop(context);
            },
        padding: EdgeInsets.zero,
      ),
    );
  }
}

/// 支持在[AuAppBar.leading]添加两个元素的Leading实现
/// 宽度范围是80
class AuDoubleLeading extends StatelessWidget {
  final Widget first;
  final Widget second;
  final AuAppBarConfig? themeData;

  const AuDoubleLeading(
      {super.key, required this.first, required this.second, this.themeData});

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultThemeData = themeData ?? AuAppBarConfig();
    defaultThemeData = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeData.configId)
        .appBarConfig
        .merge(defaultThemeData);

    return Container(
      constraints: BoxConstraints.tightFor(
          height: defaultThemeData.appBarHeight,
          width: defaultThemeData.leftAndRightPadding +
              defaultThemeData.itemSpacing +
              defaultThemeData.iconSize * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[first, second],
      ),
    );
  }
}

/// [AuAppBar.title]的默认实现
/// 标题文字个数限制在8个以内，并且单行展示
class AuAppBarTitle extends StatelessWidget {
  final String title;
  final AuAppBarConfig? themeData;

  const AuAppBarTitle(this.title, {super.key, this.themeData});

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultThemeData = themeData ?? AuAppBarConfig();
    defaultThemeData = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeData.configId)
        .appBarConfig
        .merge(themeData);

    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size.fromWidth(
          (defaultThemeData.titleStyle.generateTextStyle().fontSize ?? 18) *
              (defaultThemeData.titleMaxLength + 1))),
      child: Text(
        title,
        style: defaultThemeData.titleStyle.generateTextStyle(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// 在往[AuAppBar.actions]中添加带icon的action时所使用的包装Widget
/// 此Widget中实现了大小约束，和点击实现，添加带icon类型的action时必须使用此类包裹
class AuIconAction extends StatelessWidget {
  final Widget child;
  final VoidCallback iconPressed;
  final double? size;
  final AuAppBarConfig? themeData;

  const AuIconAction({
    super.key,
    required this.iconPressed,
    required this.child,
    this.size,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultThemeData = themeData ?? AuAppBarConfig();
    defaultThemeData = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeData.configId)
        .appBarConfig
        .merge(defaultThemeData)
        .merge(AuAppBarConfig(iconSize: size));
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: defaultThemeData.iconSize,
          height: defaultThemeData.iconSize),
      child: IconButton(
        icon: child,
        onPressed: iconPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

/// 在往[AuAppBar.actions]中添加文本action时所使用的包装Widget
/// 此Widget中实现了大小约束，和点击实现，添加文本action时必须使用此类包裹
class AuTextAction extends StatelessWidget {
  final String text;
  final VoidCallback? iconPressed;
  final AuAppBarConfig? themeData;

  const AuTextAction(this.text, {super.key, this.iconPressed, this.themeData});

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultThemeData = themeData ?? AuAppBarConfig();
    defaultThemeData = AuThemeConfigurator.instance
        .getConfig(configId: defaultThemeData.configId)
        .appBarConfig
        .merge(defaultThemeData);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: iconPressed,
      child: Container(
        height: defaultThemeData.appBarHeight,
        alignment: Alignment.center,
        child: Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: defaultThemeData.actionsStyle.generateTextStyle()),
      ),
    );
  }
}

/// AppBar底部分割线,将实例传入[AuAppBar.bottom]属性即可
class AuBarBottomDivider extends PreferredSize {
  AuBarBottomDivider({super.key})
      : super(child: Container(), preferredSize: const Size(0, 0));

  @override
  Size get preferredSize => const Size.fromHeight(0.5);

  @override
  Widget get child => const AuLine();
}

class _AuSearchResultAppBar extends StatelessWidget {
  final AuAppBarConfig? appBarConfig;
  final String? title;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool showLeadingDivider;
  final Widget? flexibleSpace;
  final VoidCallback? backLeadCallback;
  final bool? showDefaultBottom;

  const _AuSearchResultAppBar(
      {this.appBarConfig,
      this.backgroundColor,
      this.bottom,
      this.title,
      this.showLeadingDivider = true,
      this.flexibleSpace,
      this.backLeadCallback,
      this.showDefaultBottom = true});

  @override
  Widget build(BuildContext context) {
    AuAppBarConfig defaultConfig = appBarConfig ?? AuAppBarConfig();
    defaultConfig = defaultConfig.merge(AuAppBarConfig(
      backgroundColor: backgroundColor,
      showDefaultBottom: showDefaultBottom,
    ));

    defaultConfig = AuThemeConfigurator.instance
        .getConfig(configId: defaultConfig.configId)
        .appBarConfig
        .merge(defaultConfig);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        /// leading
        AuBackLeading(
          iconPressed: backLeadCallback,
          themeData: defaultConfig,
        ),

        /// divider
        Visibility(
          visible: showLeadingDivider,
          child: Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            height: 16,
            width: 1,
            color: defaultConfig.commonConfig.dividerColorBase,
          ),
        ),

        /// padding
        Visibility(
          visible: !(showLeadingDivider),
          child: const Padding(
            padding: EdgeInsets.only(left: 12),
          ),
        ),

        /// title
        Expanded(
          child: Text(
            title ?? '',
            style: defaultConfig.titleStyle.generateTextStyle(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
        )
      ],
    );
  }
}
