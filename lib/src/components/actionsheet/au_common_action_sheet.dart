import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_action_sheet_config.dart';
import 'package:flutter/material.dart';

/// Action Item 的点击事件回调
typedef AuCommonActionSheetItemClickCallBack = void Function(
    int index, AuCommonActionSheetItem actionItem);

/// Action Item 点击事件拦截回调
typedef AuCommonActionSheetItemClickInterceptor = bool Function(
    int index, AuCommonActionSheetItem actionItem);

/// 每行样式
enum AuCommonActionSheetItemStyle {
  /// 默认样式
  normal,

  /// 链接样式，颜色使用主题色号[AuCommonConfig.brandPrimary]
  link,

  /// 警示项 ，颜色使用[AuCommonConfig.brandError]
  alert,
}

/// create AuCommonActionSheetItem
class AuCommonActionSheetItem {
  /// 标题文字
  String title;

  /// 辅助信息
  String? desc;

  /// 样式 [AuActionSheetActionStyle]
  final AuCommonActionSheetItemStyle actionStyle;

  /// 主标题文本样式
  final TextStyle? titleStyle;

  /// 辅助信息文本样式
  final TextStyle? descStyle;

  AuCommonActionSheetItem(
    this.title, {
    this.desc,
    this.actionStyle = AuCommonActionSheetItemStyle.normal,
    this.titleStyle,
    this.descStyle,
  });
}

/// 吸底列表弹框，可自定义标题文案
/// 可通过配置[AuCommonActionSheetItemStyle]来设定 item 的样式
// ignore: must_be_immutable
class AuCommonActionSheet extends StatelessWidget {
  /// 每个选项相关的配置信息的列表
  /// 每个选项支持修改内容见[AuCommonActionSheetItem]
  final List<AuCommonActionSheetItem> actions;

  /// ActionSheet 标题
  final String? title;

  /// title区域widget, 与 title 字段互斥，当 titleWidget 不为 null 时优先使用 titleWidget。
  final Widget? titleWidget;

  /// Action 之间分割线颜色，默认值 Color(0xfff0f0f0)
  final Color? separatorLineColor;

  /// 取消按钮与 Action 之间的分割线的颜色，默认值 Color(0xfff8f8f8)
  final Color spaceColor;

  /// 取消按钮文本
  final String? cancelTitle;

  /// 标题最大行数，默认为2
  final int maxTitleLines;

  /// 列表最大高度限制，默认为屏幕高度减去上下安全距离
  /// 默认为0
  final double maxSheetHeight;

  /// Action Item 的点击事件
  final AuCommonActionSheetItemClickCallBack? clickCallBack;

  /// Action Item 点击事件拦截回调
  final AuCommonActionSheetItemClickInterceptor? onItemClickInterceptor;

  /// 主题定制
  AuActionSheetConfig? themeData;

  AuCommonActionSheet({super.key, 
    required this.actions,
    this.title,
    this.titleWidget,
    this.cancelTitle,
    this.clickCallBack,
    this.separatorLineColor,
    this.spaceColor = const Color(0xfff8f8f8),
    this.maxTitleLines = 2,
    this.maxSheetHeight = 0,
    this.onItemClickInterceptor,
    this.themeData,
  }) {
    themeData ??= AuActionSheetConfig();
    themeData = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .actionSheetConfig
        .merge(themeData);
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQueryData.fromView(View.of(context)).padding;
    double maxHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    double maxSheetHeight = 0;

    if (maxSheetHeight <= 0 || maxSheetHeight > maxHeight) {
      maxSheetHeight = maxHeight;
    }
    return GestureDetector(
      child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(themeData!.topRadius),
                topRight: Radius.circular(themeData!.topRadius),
              ),
            ),
          ),
          child:
              SafeArea(child: _configActionWidgets(context, maxSheetHeight))),
      onVerticalDragUpdate: (v) => {},
    );
  }

  /// 构建actionSheet的按钮
  Widget _configActionWidgets(BuildContext context, double maxSheetHeight) {
    List<Widget> widgets = [];
    // 构建整体标题
    if (titleWidget != null) {
      // 如果传入了则直接使用
      widgets.add(titleWidget!);
    } else if (title != null && title.toString().trim() != "") {
      // 如果只传入title则根据文案构建默认title
      widgets.add(_configTitleActions());
    }
    widgets.add(_configListActions(context));
    // 添加间隔
    widgets.add(Divider(
      color: spaceColor,
      thickness: 8,
      height: 8,
    ));
    widgets.add(_configCancelAction(context));

    return Container(
      constraints: BoxConstraints(maxHeight: maxSheetHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }

  /// 构建标题widget
  Widget _configTitleActions() {
    // 构建整体标题
    return Column(
      children: <Widget>[
        Container(
          padding: themeData!.titlePadding,
          child: Center(
            child: Text(
              title!,
              textAlign: TextAlign.center,
              maxLines: maxTitleLines,
              style: themeData!.titleStyle.generateTextStyle(),
            ),
          ),
        ),
        Divider(
          //有标题则添加分割线
          thickness: 1,
          height: 1,
          color: separatorLineColor ?? themeData!.commonConfig.dividerColorBase,
        ),
      ],
    );
  }

  /// 构建列表widget
  Widget _configListActions(BuildContext context) {
    List<Widget> tiles = [];
    //构建列表内容
    for (int index = 0; index < actions.length; index++) {
      tiles.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: themeData!.contentPadding,
            child: _configTile(actions[index]),
          ),
          onTap: () {
            if (onItemClickInterceptor == null ||
                !onItemClickInterceptor!(index, actions[index])) {
              // 推荐使用回调方法处理点击事件!!!!!!!!!!
              if (clickCallBack != null) {
                clickCallBack!(index, actions[index]);
              }
              // 如果未拦截，则pop掉当前页面，并且携带信息（不建议使用此信息进行点击时间处理）
              Navigator.of(context).pop([index, actions[index]]);
            }
          },
        ),
      );
      tiles.add(Divider(
        thickness: 1,
        height: 1,
        color: separatorLineColor ?? themeData!.commonConfig.dividerColorBase,
      ));
    }
    return Flexible(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: tiles,
      ),
    );
  }

  /// 配置每个选项内部信息
  /// action 每个item配置项 [AuCommonActionSheetItem]
  Widget _configTile(AuCommonActionSheetItem action) {
    List<Widget> tileElements = [];
    // 添加标题
    tileElements.add(Center(
      child: Text(
        action.title,
        maxLines: 1,
        style: action.titleStyle ??
            (action.actionStyle == AuCommonActionSheetItemStyle.alert
                ? themeData!.itemTitleStyleAlert.generateTextStyle()
                : (action.actionStyle == AuCommonActionSheetItemStyle.link
                    ? themeData!.itemTitleStyleLink.generateTextStyle()
                    : themeData!.itemTitleStyle.generateTextStyle())),
      ),
    ));
    // 如果有辅助信息则添加辅助信息
    if (action.desc != null) {
      tileElements.add(const SizedBox(
        height: 2,
      ));
      tileElements.add(
        Center(
          child: Text(
            action.desc!,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: action.descStyle ??
                (action.actionStyle == AuCommonActionSheetItemStyle.alert
                    ? themeData!.itemDescStyleAlert.generateTextStyle()
                    : (action.actionStyle == AuCommonActionSheetItemStyle.link
                        ? themeData!.itemDescStyleLink.generateTextStyle()
                        : themeData!.itemDescStyle.generateTextStyle())),
          ),
        ),
      );
    }
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: tileElements),
    );
  }

  /// 构建取消操作按钮
  Widget _configCancelAction(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: const Color(0xffffffff),
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Center(
          child: Text(
            cancelTitle ?? AuIntl.of(context).localizedResource.cancel,
            style: themeData!.cancelStyle.generateTextStyle(),
          ),
        ),
      ),
    );
  }
}
