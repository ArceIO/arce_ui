import 'package:arce_ui/src/components/popup/au_popup_window.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/utils/au_multi_click_util.dart';
import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:flutter/material.dart';

/// 多个文字按钮组成的按钮集合
/// 展示规则：
///
///  * 文本平分屏幕
///  * 文本数目不超过4个时，文本平分屏幕
///  * 文本数目超过4个时，展示3个文本按钮和更多

class AuTextButtonPanel extends StatefulWidget {
  /// 操作文字列表
  final List<String> nameList;

  /// 点击某个文本按钮的回调
  final void Function(int index)? onTap;

  /// popUpWindow位于targetView的方向
  /// 取[AuPopupDirection]里面的值
  /// 默认值为PopDirection.bottom
  final AuPopupDirection popDirection;

  /// create AuTextButtonPanel
  const AuTextButtonPanel({
    super.key,
    required this.nameList,
    this.onTap,
    this.popDirection = AuPopupDirection.bottom,
  });

  @override
  _AuTextButtonPanelState createState() => _AuTextButtonPanelState();
}

class _AuTextButtonPanelState extends State<AuTextButtonPanel> {
  final GlobalKey _popWindowKey = GlobalKey();

  /// 更多按钮的展开收起状态
  bool _isExpanded = false;

  /// 展示的文本按钮的最大数目，超过这个数目时展示更多
  final int _maxNum = 4;

  @override
  Widget build(BuildContext context) {
    if (widget.nameList.isNotEmpty) {
      Row row = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _textOperationWidgetList(context).reversed.toList(),
      );
      return Container(color: Colors.white, height: 50, child: row);
    }
    return Container();
  }

  List<Widget> _textOperationWidgetList(context) {
    List<Widget> widgetList = <Widget>[];
    //文本按钮不超过4个，就全不显示
    //超过4个的话，就只显示3个，剩下的显示在更多里
    int length = widget.nameList.length <= _maxNum
        ? widget.nameList.length
        : _maxNum - 1;
    for (int textIndex = 0; textIndex < length; textIndex++) {
      Widget operationWidget = _operationWidgetAtIndex(textIndex);
      widgetList.add(operationWidget);
    }

    if (widget.nameList.length > _maxNum) {
      widgetList.add(_moreButton());
    }

    List<Widget> showWidget = [];
    for (int i = 0, n = widgetList.length; i < n; ++i) {
      showWidget.add(Expanded(
        child: widgetList[i],
      ));
      if (i != n - 1) {
        showWidget.add(
          Container(
            alignment: Alignment.center,
            height: 26,
            width: 1,
            color: const Color(0xFFf8f8f8),
          ),
        );
      }
    }
    return showWidget;
  }

  Widget _operationWidgetAtIndex(int index) {
    String title = widget.nameList[index];
    Text tx = Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AuThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .brandPrimary),
    );

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: tx,
        ),
        onTap: () {
          if (AuMultiClickUtils.isMultiClick()) {
            return;
          }
          if (null != widget.onTap) {
            widget.onTap!(index);
          }
        });
  }

  /// 更多按钮
  Widget _moreButton() {
    if (widget.nameList.length > _maxNum) {
      List<String> list = [];
      for (int i = _maxNum - 1; i < widget.nameList.length; i++) {
        list.add(widget.nameList[i]);
      }

      Text tx = Text(
        _isExpanded
            ? AuIntl.of(context).localizedResource.collapse
            : AuIntl.of(context).localizedResource.more,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff999999),
        ),
      );

      Widget imageWidget = _isExpanded
          ? BrunoTools.getAssetImage(AuAsset.iconUpArrow)
          : BrunoTools.getAssetImage(AuAsset.iconDownArrow);

      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          key: _popWindowKey,
          onTap: () {
            AuPopupListWindow.showPopListWindow(context, _popWindowKey,
                offset: 10,
                popDirection: widget.popDirection,
                data: list, onItemClick: (index, item) {
              Navigator.pop(context);
              if (widget.onTap != null) {
                widget.onTap!(index + 3);
              }
              return true;
            }, onDismiss: () {
              setState(() {
                _isExpanded = false;
              });
            });
            setState(() {
              _isExpanded = true;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              tx,
              const SizedBox(
                width: 4,
              ),
              imageWidget
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }
}
