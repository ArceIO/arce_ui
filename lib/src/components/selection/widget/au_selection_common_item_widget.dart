import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';
import 'package:arce_ui/src/components/selection/au_selection_util.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/theme/configs/au_selection_config.dart';
import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:arce_ui/src/utils/css/au_css_2_text.dart';
import 'package:flutter/material.dart';

/// [AuSelectionSingleListWidget] 子组件中的单项
class AuSelectionCommonItemWidget extends StatelessWidget {
  /// 单项数据
  final AuSelectionEntity item;

  /// 背景色
  final Color? backgroundColor;

  /// 选中项背景色
  final Color? selectedBackgroundColor;

  /// 是否当前焦点
  final bool isCurrentFocused;

  /// 是否是第一级
  final bool isFirstLevel;

  /// 是否是多选列表类型
  final bool isMoreSelectionListType;

  /// 单选回调
  final ValueChanged<AuSelectionEntity>? itemSelectFunction;

  /// 主题配置
  final AuSelectionConfig? themeData;

  const AuSelectionCommonItemWidget({
    super.key,
    required this.item,
    this.backgroundColor,
    this.isFirstLevel = false,
    this.isMoreSelectionListType = false,
    this.itemSelectFunction,
    this.selectedBackgroundColor,
    this.isCurrentFocused = false,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    Container checkbox;
    if (!item.isUnLimit() && (item.children.isEmpty)) {
      if (item.isInLastLevel() && item.hasCheckBoxBrother()) {
        checkbox = Container(
          padding: const EdgeInsets.only(left: 6),
          width: 21,
          child: (item.isSelected)
              ? BrunoTools.getAssetImageWithBandColor(AuAsset.iconMultiSelected)
              : BrunoTools.getAssetImage(AuAsset.iconUnSelect),
        );
      } else {
        checkbox = Container();
      }
    } else {
      checkbox = Container();
    }

    return GestureDetector(
      onTap: () {
        if (itemSelectFunction != null) {
          itemSelectFunction!(item);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        color: getItemBGColor(),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Expanded(
                      child: Text(
                        item.title + getSelectedItemCount(item),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: getItemTextStyle(),
                      ),
                    ),
                  ),
                  checkbox
                ],
              ),
              Visibility(
                visible: !BrunoTools.isEmpty(item.subTitle),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: item.isInLastLevel() ? 21 : 0),
                  child: AuCSS2Text.toTextView(item.subTitle ?? '',
                      defaultStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          color: themeData?.commonConfig.colorTextSecondary),
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 获取当前节点的背景色
  Color? getItemBGColor() {
    if (isCurrentFocused) {
      return selectedBackgroundColor;
    } else {
      return backgroundColor;
    }
  }

  /// 是否高亮
  bool isHighLight(AuSelectionEntity item) {
    if (item.isInLastLevel()) {
      if (item.isUnLimit()) {
        return isCurrentFocused;
      } else {
        return item.isSelected;
      }
    } else {
      return isCurrentFocused;
    }
  }

  /// 是否加粗
  bool isBold(AuSelectionEntity item) {
    if (isHighLight(item)) {
      return true;
    } else {
      return item.hasCheckBoxBrother() && item.selectedList().isNotEmpty;
    }
  }

  /// 获取当前节点的文本样式
  TextStyle? getItemTextStyle() {
    if (isHighLight(item)) {
      return themeData?.itemSelectedTextStyle.generateTextStyle();
    } else if (isBold(item)) {
      return themeData?.itemBoldTextStyle.generateTextStyle();
    }
    return themeData?.itemNormalTextStyle.generateTextStyle();
  }

  /// 获取当前节点的子节点中，选中的数量
  String getSelectedItemCount(AuSelectionEntity item) {
    String itemCount = "";
    if ((AuSelectionUtil.getTotalLevel(item) < 3 || !isFirstLevel) &&
        item.children.isNotEmpty) {
      int count =
          item.children.where((f) => f.isSelected && !f.isUnLimit()).length;
      if (count > 1) {
        return '($count)';
      } else if (count == 1 && item.hasCheckBoxBrother()) {
        return '($count)';
      } else {
        var unLimited =
            item.children.where((f) => f.isSelected && f.isUnLimit()).toList();
        if (unLimited.isNotEmpty) {
          return '(全部)';
        }
      }
    }
    return itemCount;
  }
}
