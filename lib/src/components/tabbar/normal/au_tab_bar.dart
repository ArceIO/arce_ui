import 'package:arce_ui/src/components/popup/au_measure_size.dart';
import 'package:arce_ui/src/components/tabbar/indicator/au_custom_width_indicator.dart';
import 'package:arce_ui/src/components/tabbar/normal/au_tabbar_controller.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 单个tab选中的回调
/// [state]:当前组件的State对象，[AuTabBarState]
/// [index]:当前组件的角标
typedef AuTabBarOnTap = Function(AuTabBarState state, int index);

const double _tagDefaultSize = 75.0;
const int _scrollableLimitTabLength = 4;

/// 带小红点的Tabbar
// ignore: must_be_immutable
class AuTabBar extends StatefulWidget {
  /// AuTabBarBadge填充的数据，长度匹配控制器的TabController.length
  final List<BadgeTab>? tabs;

  /// [AuTabBar] 的tab模式
  /// 默认：[AuTabBarBadgeMode.average]（按照屏幕平均分配模式）
  final AuTabBarBadgeMode mode;

  /// 是否能滑动(当tab数量大于4个，默认都是滚动的，再设置此属性无效)
  final bool isScrollable;

  /// Tabbar的整体高度
  final double? tabHeight;

  /// TabBar的padding
  final EdgeInsetsGeometry padding;

  /// 控制Tab的切换
  final TabController? controller;

  /// TabBar背景颜色
  final Color backgroundcolor;

  /// 指示器的颜色
  final Color? indicatorColor;

  /// 指示器的高度
  final double? indicatorWeight;

  /// 指示器的宽度
  final double? indicatorWidth;

  final EdgeInsetsGeometry indicatorPadding;

  /// 选中Tab文本的颜色
  final Color? labelColor;

  /// 选中Tab文本的样式
  final TextStyle? labelStyle;

  /// Tab文本的Padding
  final EdgeInsetsGeometry labelPadding;

  /// 未选中Tab文本的颜色
  final Color? unselectedLabelColor;

  /// 未中Tab文本的样式
  final TextStyle? unselectedLabelStyle;

  /// 处理拖拽开始行为方式，默认DragStartBehavior.start
  final DragStartBehavior dragStartBehavior;

  /// Tab的选中点击事件
  final AuTabBarOnTap? onTap;

  /// 添加的Tab的宽度(指定tabWidth就不会均分屏幕宽度)
  final double? tabWidth;

  /// 是否显示分隔线
  final bool hasDivider;

  /// 是否显示角标
  final bool hasIndex;

  /// 展开更多Tabs
  final bool showMore;

  /// 展开更多弹框标题
  final String? moreWindowText;

  /// 更多弹框弹出的时候
  final VoidCallback? onMorePop;

  /// 更多弹框关闭控制器
  final AuCloseWindowController? closeController;

  /// tag间距
  final double? tagSpacing;

  /// 每行tag数
  final int? preLineTagCount;

  /// tag高度
  final double? tagHeight;

  final TabAlignment? tabAlignment;

  final double? dividerHeight;

  final Color? dividerColor;

  AuTabBarConfig? themeData;

  AuTabBar({
    super.key,
    required this.tabs,
    this.mode = AuTabBarBadgeMode.average,
    this.isScrollable = false,
    this.tabHeight,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.tabAlignment = TabAlignment.start,
    this.backgroundcolor = const Color(0xffffffff),
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorWidth,
    this.indicatorPadding = EdgeInsets.zero,
    this.labelColor,
    this.labelStyle,
    this.labelPadding = EdgeInsets.zero,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dividerColor,
    this.dividerHeight,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onTap,
    this.tabWidth,
    this.hasDivider = false,
    this.hasIndex = false,
    this.showMore = false,
    this.moreWindowText,
    this.onMorePop,
    this.closeController,
    this.themeData,
    this.tagSpacing,
    this.preLineTagCount,
    this.tagHeight,
  }) : assert(tabs != null) {
    themeData ??= AuTabBarConfig();
    themeData = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .tabBarConfig
        .merge(themeData);
    themeData = themeData!.merge(AuTabBarConfig(
          backgroundColor: backgroundcolor,
          tabHeight: tabHeight,
          indicatorHeight: indicatorWeight,
          indicatorWidth: indicatorWidth,
          labelStyle: AuTextStyle.withStyle(labelStyle),
          unselectedLabelStyle: AuTextStyle.withStyle(unselectedLabelStyle),
          tagSpacing: tagSpacing,
          preLineTagCount: preLineTagCount,
          tagHeight: tagHeight,
        ));
  }

  @override
  AuTabBarState createState() => AuTabBarState(closeController);
}

/// AuTabBarBadge的tab分配模式
enum AuTabBarBadgeMode {
  /// 原始的默认TabBar的分配模式
  origin,

  /// 默认的按照4.5等分模式
  average
}

class AuTabBarState extends State<AuTabBar> {
  /// 小红点文案
  late String _badgeText;

  /// 小红点容器内边距
  late EdgeInsets _badgePadding;

  /// 小红点高度
  late double _largeSize;

  /// 小红点上偏移量
  double _dy = 0;

  /// 小红点右偏移量
  double _dx = 0;

  /// 展开更多的按钮宽度
  final double _moreSpacing = 50;

  /// AuTabBarBadge展开更多数据处理控制器
  late AuTabbarController _brnTabbarController;

  /// AuTabBarBadge展开更多关闭处理控制器
  AuCloseWindowController? _closeWindowController;

  AuTabBarState(AuCloseWindowController? closeController) {
    _closeWindowController = closeController;
  }

  @override
  void initState() {
    super.initState();
    _brnTabbarController = AuTabbarController();
    // 监听更多弹框tab选中变化的时候
    _brnTabbarController.addListener(() {
      _closeWindowController?.syncWindowState(_brnTabbarController.isShow);
      // 更新TabBar选中位置
      if (widget.controller != null) {
        widget.controller!.animateTo(_brnTabbarController.selectIndex);
      }
      // 刷新选中TabBar小红点
      refreshBadgeState(_brnTabbarController.selectIndex);
      // 更新Tabbar更多图标样式
      setState(() {});
    });

    _closeWindowController?.getCloseController().stream.listen((event) {
      _brnTabbarController.hide();
      _brnTabbarController.entry?.remove();
      _brnTabbarController.entry = null;
    });

    widget.controller?.addListener(_handleTabIndexChangeTick);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.removeListener(_handleTabIndexChangeTick);
  }

  void _handleTabIndexChangeTick() {
    if (widget.controller?.index.toDouble() ==
        widget.controller?.animation?.value) {
      _brnTabbarController.selectIndex = widget.controller?.index ?? 0;
      _brnTabbarController.isShow = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      constraints: BoxConstraints(minHeight: widget.themeData!.tabHeight),
      color: widget.themeData!.backgroundColor,
      child: widget.showMore
          ? Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - _moreSpacing,
                  child: _buildTabBar(),
                ),
                showMoreWidget(context)
              ],
            )
          : _buildTabBar(),
    );
  }

  // 构建TabBar样式
  TabBar _buildTabBar() {
    bool isScrollable = widget.tabs!.length > _scrollableLimitTabLength ||
        widget.tabWidth != null ||
        widget.isScrollable;
    return TabBar(
        tabAlignment: widget.tabAlignment,
        tabs: fillWidgetByDataList(isScrollable),
        controller: widget.controller,
        isScrollable: isScrollable,
        labelColor: widget.labelColor ?? widget.themeData!.labelStyle.color,
        labelStyle: widget.labelStyle ??
            widget.themeData!.labelStyle.generateTextStyle(),
        labelPadding: widget.labelPadding,
        unselectedLabelColor: widget.unselectedLabelColor ??
            widget.themeData!.unselectedLabelStyle.color,
        unselectedLabelStyle: widget.unselectedLabelStyle ??
            widget.themeData!.unselectedLabelStyle.generateTextStyle(),
        dragStartBehavior: widget.dragStartBehavior,
        dividerColor: widget.dividerColor,
        dividerHeight: widget.dividerHeight,
        onTap: (index) {
          if (widget.onTap != null) {
            widget.onTap!(this, index);
            _brnTabbarController.setSelectIndex(index);
            _brnTabbarController.isShow = false;
            _brnTabbarController.entry?.remove();
            _brnTabbarController.entry = null;
          }
        },
        indicator: CustomWidthUnderlineTabIndicator(
          insets: widget.indicatorPadding,
          borderSide: BorderSide(
            width: widget.themeData!.indicatorHeight,
            color: widget.indicatorColor ?? widget.themeData!.labelStyle.color!,
          ),
          width: widget.themeData!.indicatorWidth,
        ));
  }

  // 展开更多Widget
  Widget showMoreWidget(BuildContext context) {
    return Visibility(
      visible: widget.showMore,
      child: GestureDetector(
        onTap: () {
          if (!_brnTabbarController.isShow &&
              widget.controller!.index.toDouble() ==
                  widget.controller!.animation!.value) {
            _brnTabbarController.show();
            if (widget.onMorePop != null) {
              widget.onMorePop!();
            }
            showMoreWindow(context);
            setState(() {});
          } else {
            hideMoreWindow();
            setState(() {});
          }
        },
        child: Container(
            width: _moreSpacing,
            height: widget.themeData!.tabHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x05000000),
                    offset: Offset(-3, 0),
                    spreadRadius: -1)
              ],
            ),
            child: !_brnTabbarController.isShow
                ? BrunoTools.getAssetImage(AuAsset.iconTriangleDown)
                : BrunoTools.getAssetImageWithBandColor(
                    AuAsset.iconTriangleUp)),
      ),
    );
  }

  /// 更新选中tab的小红点状态
  /// [index] tab索引
  void refreshBadgeState(int index) {
    setState(() {
      BadgeTab badgeTab = widget.tabs![index];
      if (badgeTab.isAutoDismiss) {
        badgeTab.badgeNum = null;
        badgeTab.badgeText = null;
        badgeTab.showRedBadge = false;
      }
    });
  }

  List<Widget> fillWidgetByDataList(bool isScrollable) {
    List<Widget> widgets = <Widget>[];
    List<BadgeTab>? tabList = widget.tabs;
    if (tabList != null && tabList.isNotEmpty) {
      double? minWidth;
      if (widget.tabWidth != null) {
        minWidth = widget.tabWidth;
      } else {
        double tabUseWidth = widget.showMore
            ? MediaQuery.of(context).size.width - _moreSpacing
            : MediaQuery.of(context).size.width;
        if (tabList.length <= _scrollableLimitTabLength) {
          minWidth = tabUseWidth / tabList.length;
        } else {
          minWidth = tabUseWidth / 4.5;
        }
      }
      for (int i = 0; i < tabList.length; i++) {
        BadgeTab badgeTab = tabList[i];
        if (widget.mode == AuTabBarBadgeMode.average) {
          widgets.add(
              _wrapAverageWidget(badgeTab, minWidth, i == tabList.length - 1));
        } else {
          widgets.add(_wrapOriginWidget(
              badgeTab, i == tabList.length - 1, isScrollable));
        }
      }
    }
    return widgets;
  }

  /// 原始的自适应的tab样式
  Widget _wrapOriginWidget(
      BadgeTab badgeTab, bool lastElement, bool isScrollable) {
    var contentWidget = LayoutBuilder(builder: (context, constraints) {
      caculateBadgeParams(badgeTab, constraints);
      return Container(
        alignment: Alignment.center,
        height: 47,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
                visible: widget.hasIndex && badgeTab.topText != null,
                child: Text(
                  badgeTab.topText ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Badge(
              isLabelVisible: (badgeTab.badgeNum != null
                      ? badgeTab.badgeNum! > 0
                      : false) ||
                  badgeTab.showRedBadge ||
                  (badgeTab.badgeText != null
                      ? badgeTab.badgeText!.isNotEmpty
                      : false),
              label: Text(
                _badgeText,
                style: const TextStyle(
                    color: Color(0xFFFFFFFF), fontSize: 10, height: 1),
              ),
              backgroundColor: Colors.red,
              alignment: Alignment.topLeft,
              offset: Offset(_dx, _dy),
              padding: _badgePadding,
              largeSize: _largeSize,
              child: Text(
                badgeTab.text!,
                maxLines: 1,
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        isScrollable
            ? contentWidget
            : Expanded(
                child: contentWidget,
              ),
        Visibility(
          visible: widget.hasDivider && !lastElement,
          child: Container(
            width: 1,
            height: 20,
            color: const Color(0xffe4e6f0),
          ),
        )
      ],
    );
  }

  /// 定制的等分tab样式
  Widget _wrapAverageWidget(
      BadgeTab badgeTab, double? minWidth, bool lastElement) {
    return LayoutBuilder(builder: (context, constraints) {
      caculateBadgeParams(badgeTab, constraints);
      return Container(
        width: minWidth,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.center,
              height: 47,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                      visible: widget.hasIndex && badgeTab.topText != null,
                      child: Text(
                        badgeTab.topText ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Badge(
                    isLabelVisible: (badgeTab.badgeNum != null
                            ? badgeTab.badgeNum! > 0
                            : false) ||
                        badgeTab.showRedBadge ||
                        (badgeTab.badgeText != null
                            ? badgeTab.badgeText!.isNotEmpty
                            : false),
                    backgroundColor: Colors.red,
                    label: Text(
                      _badgeText,
                      style: const TextStyle(
                          color: Color(0xFFFFFFFF), fontSize: 10, height: 1),
                    ),
                    alignment: Alignment.topLeft,
                    offset: Offset(_dx, _dy),
                    padding: _badgePadding,
                    largeSize: _largeSize,
                    child: Text(badgeTab.text!,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16)),
                  )
                ],
              ),
            )),
            Visibility(
              visible: widget.hasDivider && !lastElement,
              child: Container(
                width: 1,
                height: 20,
                color: const Color(0xffe4e6f0),
              ),
            )
          ],
        ),
      );
    });
  }

  /// 计算小红点尺寸相关参数
  void caculateBadgeParams(BadgeTab badgeTab, BoxConstraints constraints) {
    _dy = -5.0;

    if (badgeTab.badgeNum != null) {
      if (badgeTab.badgeNum! < 10) {
        _badgePadding = const EdgeInsets.only(left: 5.0, right: 5.0);
        _largeSize = 16.0;
        _badgeText = badgeTab.badgeNum?.toString() ?? "";
      } else if (badgeTab.badgeNum! > 99) {
        _badgePadding = const EdgeInsets.fromLTRB(4, 3, 4, 2);
        _largeSize = 16.0;
        _badgeText = "99+";
      } else {
        _badgePadding = const EdgeInsets.fromLTRB(4, 3, 4, 2);
        _largeSize = 16.0;
        _badgeText = badgeTab.badgeNum?.toString() ?? "";
      }
    } else {
      if (badgeTab.badgeText != null && badgeTab.badgeText!.isNotEmpty) {
        _badgePadding = const EdgeInsets.fromLTRB(6, 3, 6, 3);
        _largeSize = 16.0;
        _badgeText = badgeTab.badgeText?.toString() ?? "";
      } else {
        _badgePadding = const EdgeInsets.only(left: 4.0, right: 4.0);
        _largeSize = 8.0;
        _badgeText = "";
        _dy = 1.0;
      }
    }

    // 获取 tabTextWidth
    TextStyle tabTextStyle =
        const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16);
    TextPainter tabTextPainter = TextPainter(
        locale: Localizations.localeOf(context), textAlign: TextAlign.center);
    tabTextPainter.textDirection = TextDirection.ltr;
    tabTextPainter.maxLines = 1;
    tabTextPainter.text = TextSpan(text: badgeTab.text, style: tabTextStyle);
    tabTextPainter.layout(maxWidth: constraints.maxWidth);
    double tabTextWidth = tabTextPainter.width;

    // 获取 badgeTextWidth
    TextStyle badgeTextStyle = const TextStyle(height: 1, fontSize: 10);
    TextPainter badgeTextPainter =
        TextPainter(textScaleFactor: MediaQuery.of(context).textScaleFactor);
    badgeTextPainter.textDirection = TextDirection.ltr;
    badgeTextPainter.maxLines = 1;
    badgeTextPainter.text = TextSpan(text: _badgeText, style: badgeTextStyle);
    badgeTextPainter.layout(maxWidth: constraints.maxWidth);
    // 红点内 text 的宽度
    double badgeTextWidth = badgeTextPainter.width;

    double badgeWidth = badgeTextWidth + _badgePadding.horizontal;

    // 获取外部传入的tab padding值
    EdgeInsets labelPadding = widget.labelPadding.resolve(TextDirection.ltr);

    if ((tabTextWidth + badgeWidth) >
        (constraints.maxWidth + labelPadding.right)) {
      // 如果tab文字宽度 + 红点宽度  > 约束宽度（父容器宽度）+ 设置tab 右padding  则将红点左移 红点宽度偏移量
      // if(_badgeWidth > (constraints.maxWidth + _labelPadding.right)){
      //   _paddingRight = 0.0;
      // }else{
      _dx = constraints.maxWidth + labelPadding.right - badgeWidth;
      // }
    } else {
      _dx = tabTextWidth;
    }
  }

  /// 展开更多
  void showMoreWindow(BuildContext context) {
    final RenderBox dropDownItemRenderBox =
        context.findRenderObject() as RenderBox;
    var position =
        dropDownItemRenderBox.localToGlobal(Offset.zero, ancestor: null);
    var size = dropDownItemRenderBox.size;
    _brnTabbarController.top = size.height + position.dy;

    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return GestureDetector(
        onTap: () {
          hideMoreWindow();
        },
        onVerticalDragStart: (_) {
          hideMoreWindow();
        },
        onHorizontalDragStart: (_) {
          hideMoreWindow();
        },
        child: Container(
          padding: EdgeInsets.only(
            top: _brnTabbarController.top!,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                width: MediaQuery.of(context).size.width,
                left: 0,
                child: Material(
                  color: const Color(0xB3000000),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        _brnTabbarController.top!,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: _TabBarOverlayWidget(
                        tabs: widget.tabs,
                        onTap: (index) {
                          if (widget.onTap != null) {
                            widget.onTap!(this, index);
                          }
                        },
                        moreWindowText: widget.moreWindowText,
                        brnTabbarController: _brnTabbarController,
                        themeData: widget.themeData!,
                        spacing: widget.themeData!.tagSpacing,
                        preLineTagCount: widget.themeData!.preLineTagCount,
                        tagHeight: widget.themeData!.tagHeight,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
    _brnTabbarController.screenHeight = MediaQuery.of(context).size.height;
    if (_brnTabbarController.entry != null) {
      resetEntry();
    }
    _brnTabbarController.entry = overlayEntry;
    Overlay.of(context).insert(_brnTabbarController.entry!);
  }

  void resetEntry() {
    _brnTabbarController.entry?.remove();
    _brnTabbarController.entry = null;
  }

  void hideMoreWindow() {
    if (_brnTabbarController.isShow) {
      _brnTabbarController.hide();
      resetEntry();
    }
  }
}

/// 更多弹框样式
// ignore: must_be_immutable
class _TabBarOverlayWidget extends StatefulWidget {
  List<BadgeTab>? tabs;

  String? moreWindowText;

  AuTabbarController? brnTabbarController;

  AuTabBarConfig themeData;

  /// tag间距
  double spacing;

  /// 每行tag数
  int preLineTagCount;

  /// tag高度
  double? tagHeight;

  /// Tab的选中点击事件
  final ValueChanged<int>? onTap;

  _TabBarOverlayWidget(
      {this.tabs,
      this.onTap,
      this.moreWindowText,
      this.brnTabbarController,
      required this.themeData,
      this.spacing = 12.0,
      this.preLineTagCount = 4,
      this.tagHeight});

  @override
  _TabBarOverlayWidgetState createState() => _TabBarOverlayWidgetState();
}

class _TabBarOverlayWidgetState extends State<_TabBarOverlayWidget> {
  /// tag宽度
  double _tagWidth = _tagDefaultSize;

  final double _padding = 20;

  double _parentWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return createMoreWindowView();
  }

  /// 展开更多弹框样式
  Widget createMoreWindowView() {
    return MeasureSize(
      onChange: (size) {
        setState(() {
          _parentWidth = size.width;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          onVerticalDragStart: (_) {},
          onHorizontalDragStart: (_) {},
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Visibility(
                        visible: widget.moreWindowText != null &&
                            widget.moreWindowText!.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            widget.moreWindowText ?? "",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff222222),
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 12),
                      child: _createMoreItems(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createMoreItems() {
    // 计算tag的宽度
    _tagWidth = (_parentWidth -
            widget.spacing * (widget.preLineTagCount - 1) -
            _padding * 2) /
        widget.preLineTagCount;
    _tagWidth = _tagWidth <= _tagDefaultSize ? _tagDefaultSize : _tagWidth;
    List<Widget> widgets = <Widget>[];
    List<BadgeTab>? tabList = widget.tabs;
    if (tabList != null && tabList.isNotEmpty) {
      for (int i = 0; i < tabList.length; i++) {
        BadgeTab badgeTab = tabList[i];
        widgets.add(_createMoreItemWidget(badgeTab, i));
      }
    }
    return Wrap(
      spacing: widget.spacing,
      runSpacing: 12,
      children: widgets,
    );
  }

  Widget _createMoreItemWidget(BadgeTab badgeTab, int index) {
    return GestureDetector(
      onTap: () {
        if (widget.brnTabbarController!.selectIndex == index) {
          widget.brnTabbarController?.setSelectIndex(index);
          widget.brnTabbarController?.isShow = false;
          widget.brnTabbarController?.entry?.remove();
          widget.brnTabbarController?.entry = null;
          setState(() {});
        } else {
          if (widget.onTap != null) {
            widget.onTap!(index);
          }
          widget.brnTabbarController!.setSelectIndex(index);
          widget.brnTabbarController?.isShow = false;
          widget.brnTabbarController?.entry?.remove();
          widget.brnTabbarController?.entry = null;
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.brnTabbarController!.selectIndex == index
                ? widget.themeData.tagSelectedBgColor
                : widget.themeData.tagNormalBgColor,
            borderRadius: BorderRadius.circular(widget.themeData.tagRadius)),
        height: widget.tagHeight,
        width: _tagWidth,
        child: Text(
          badgeTab.text ?? '',
          textAlign: TextAlign.center,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: widget.brnTabbarController!.selectIndex == index
              ? widget.themeData.tagSelectedTextStyle.generateTextStyle()
              : widget.themeData.tagNormalTextStyle.generateTextStyle(),
        ),
      ),
    );
  }
}

/// AuTabBar tab 的展示配置
class BadgeTab {
  BadgeTab(
      {this.text,
      this.badgeNum,
      this.topText,
      this.badgeText,
      this.showRedBadge = false,
      this.isAutoDismiss = true});

  /// Tab文本
  final String? text;

  /// 红点数字
  int? badgeNum;

  /// tab顶部文本信息
  String? topText;

  /// 红点显示的文本
  String? badgeText;

  /// 是否显示小红点，默认badgeNum没设置，不显示
  bool showRedBadge;

  /// 小红点是否自动消失
  bool isAutoDismiss;
}
