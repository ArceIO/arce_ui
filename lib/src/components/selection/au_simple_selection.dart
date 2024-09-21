import 'package:arce_ui/src/components/selection/bean/au_filter_entity.dart';
import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';
import 'package:arce_ui/src/components/selection/au_selection_view.dart';
import 'package:arce_ui/src/constants/au_constants.dart';
import 'package:arce_ui/src/theme/configs/au_selection_config.dart';
import 'package:flutter/material.dart';

typedef AuSimpleSelectionOnSelectionChanged = void Function(
    List<ItemEntity> selectedParams);

const String _defaultMenuKey = "defaultMenuKey";

/// 简单筛选，基于 AuSelectionView 实现
// ignore: must_be_immutable
class AuSimpleSelection extends StatefulWidget {
  /// 标题文案
  final String menuName;

  /// 回传给服务端key
  final String menuKey;

  /// 默认选中选项值
  final String? defaultValue;

  /// 最大选中个数  默认 radio模式 65535  checkbox模式外部传入
  final int maxSelectedCount;

  /// 选项列表
  final List<ItemEntity> items;

  /// 选择回调
  final AuSimpleSelectionOnSelectionChanged onSimpleSelectionChanged;

  /// 菜单点击事件
  final Function? onMenuItemClick;

  /// 是否单选  默认 radio模式 is true ， checkbox模式 is false
  final bool isRadio;

  /// SelectionView 配置
  final AuSelectionConfig? themeData;

  /// 单选构造函数
  const AuSimpleSelection.radio({
    super.key,
    required this.menuName,
    this.menuKey = _defaultMenuKey,
    this.defaultValue,
    required this.items,
    required this.onSimpleSelectionChanged,
    this.onMenuItemClick,
    this.themeData,
  })  : isRadio = true,
        maxSelectedCount = AuSelectionConstant.maxSelectCount;

  /// 多选构造函数
  const AuSimpleSelection.checkbox({
    super.key,
    required this.menuName,
    this.menuKey = _defaultMenuKey,
    this.defaultValue,
    this.maxSelectedCount = AuSelectionConstant.maxSelectCount,
    required this.items,
    required this.onSimpleSelectionChanged,
    this.onMenuItemClick,
    this.themeData,
  })  : isRadio = false;

  @override
  State<StatefulWidget> createState() {
    return AuSimpleSelectionState();
  }
}

class AuSimpleSelectionState extends State<AuSimpleSelection> {
  late List<AuSelectionEntity> selectionEntityList;

  @override
  void initState() {
    super.initState();
    selectionEntityList = _convertFilterToAuSelection();
  }

  /// 将筛选数据转换成通用筛选数据
  List<AuSelectionEntity> _convertFilterToAuSelection() {
    List<AuSelectionEntity> list = [];
    if (widget.items.isNotEmpty) {
      List<AuSelectionEntity> children = [];
      for (var filter in widget.items) {
        children.add(AuSelectionEntity.simple(
            key: filter.key,
            value: filter.value,
            title: filter.name,
            type: widget.isRadio ? "radio" : "checkbox"));
      }

      list.add(AuSelectionEntity(
          key: widget.menuKey,
          title: widget.menuName,
          maxSelectedCount: widget.maxSelectedCount,
          type: widget.isRadio ? "radio" : "checkbox",
          defaultValue: widget.defaultValue,
          children: children));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AuSelectionView(
      themeData: widget.themeData,
      originalSelectionData: selectionEntityList,
      onSelectionChanged:
          (menuIndex, selectedParams, customParams, setCustomTitleFunction) {
        List<ItemEntity> results = [];
        String valueStr = selectedParams[widget.menuKey] ?? '';
        List<String> values = valueStr.split(',');

        ///遍历获取选中的items
        for (String value in values) {
          for (ItemEntity item in widget.items) {
            if (item.value != null && item.value == value) {
              results.add(item);
              break;
            }
          }
        }
        widget.onSimpleSelectionChanged(results);
      },
      onMenuClickInterceptor: (index) {
        if (widget.onMenuItemClick != null) {
          widget.onMenuItemClick!();
        }
        return false;
      },
    );
  }
}
