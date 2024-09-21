import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';
import 'package:arce_ui/src/components/selection/au_selection_util.dart';
import 'package:arce_ui/src/components/selection/widget/au_selection_common_item_widget.dart';
import 'package:arce_ui/src/components/selection/widget/au_selection_list_widget.dart';
import 'package:arce_ui/src/components/toast/au_toast.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/configs/au_selection_config.dart';
import 'package:flutter/material.dart';

/// 单列选择子组件
// ignore: must_be_immutable
class AuSelectionSingleListWidget extends StatefulWidget {
  late List<AuSelectionEntity> _selectedItems;

  /// 当前选择的项
  late int currentListIndex;

  /// 筛选数据
  List<AuSelectionEntity> items;

  /// 占父容器宽度的比例
  int flex;

  /// 焦点位置
  int focusedIndex;

  /// 最大高度
  double maxHeight;

  /// 背景色
  Color? backgroundColor;

  /// 选中项背景色
  Color? selectedBackgroundColor;

  /// 单选回调
  SingleListItemSelect? singleListItemSelect;

  /// 主题配置
  AuSelectionConfig themeData;

  AuSelectionSingleListWidget({
    super.key,
    required this.items,
    required this.flex,
    this.focusedIndex = -1,
    this.maxHeight = 0,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.singleListItemSelect,
    required this.themeData,
  }) {
    items = items
        .where((_) =>
            _.filterType != AuSelectionFilterType.range &&
            _.filterType != AuSelectionFilterType.date &&
            _.filterType != AuSelectionFilterType.dateRange &&
            _.filterType != AuSelectionFilterType.dateRangeCalendar)
        .toList();

    /// 当前 Items 所在的层级
    currentListIndex =
        AuSelectionUtil.getCurrentListIndex(items.isNotEmpty ? items[0] : null);
    _selectedItems = items.where((f) => f.isSelected).toList();
  }

  @override
  _AuSelectionSingleListWidgetState createState() =>
      _AuSelectionSingleListWidgetState();
}

class _AuSelectionSingleListWidgetState
    extends State<AuSelectionSingleListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
        constraints: (widget.maxHeight == 0)
            ? const BoxConstraints.expand()
            : BoxConstraints(maxHeight: widget.maxHeight),
        color: widget.backgroundColor,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 0),
          scrollDirection: Axis.vertical,
          itemCount: widget.items.length,
          separatorBuilder: (BuildContext context, int index) => Container(),
          itemBuilder: (BuildContext context, int index) {
            AuSelectionEntity item = widget.items[index];

            /// 点击筛选，展开弹窗时，默认展示上次选中的筛选项。
            bool isCurrentFocused = isItemFocused(index, item);

            return AuSelectionCommonItemWidget(
              item: item,
              themeData: widget.themeData,
              backgroundColor: widget.backgroundColor,
              selectedBackgroundColor: widget.selectedBackgroundColor,
              isCurrentFocused: isCurrentFocused,
              isMoreSelectionListType: false,
              isFirstLevel: (1 == widget.currentListIndex) ? true : false,
              itemSelectFunction: (AuSelectionEntity entity) {
                if ((entity.filterType == AuSelectionFilterType.checkbox &&
                        !entity.isSelected) ||
                    entity.filterType != AuSelectionFilterType.checkbox) {
                  if (entity.hasCheckBoxBrother()) {
                    if (entity.isUnLimit() &&
                        (entity.parent?.children
                                    .where((f) => f.isSelected)
                                    .length ??
                                0) >
                            0) {
                      /// 点击的是不限类型，且不限类型同级别已经有选中的 item，不检查数量限制。
                    } else if ((entity.parent?.children
                                .where((f) => f.isSelected && f.isUnLimit())
                                .length ??
                            0) >
                        0) {
                      /// 同级别中，存在不限类型已经选中情况，选择非不限类型 item，不检查数量限制
                    } else if (entity.isInLastLevel() &&
                        !AuSelectionUtil.checkMaxSelectionCount(entity)) {
                      AuToast.show(
                          AuIntl.of(context)
                              .localizedResource
                              .filterConditionCountLimited,
                          context);
                      return;
                    }
                  } else {
                    if (!AuSelectionUtil.checkMaxSelectionCount(entity)) {
                      AuToast.show(
                          AuIntl.of(context)
                              .localizedResource
                              .filterConditionCountLimited,
                          context);
                      return;
                    }
                  }
                }
                _processFilterData(entity);
                if (widget.singleListItemSelect != null) {
                  widget.singleListItemSelect!(
                      widget.currentListIndex, index, entity);
                }
              },
            );
          },
        ),
      ),
    );
  }

  bool isItemFocused(int itemIndex, AuSelectionEntity item) {
    bool isFocused = widget.focusedIndex == itemIndex;
    if (!isFocused && item.isSelected && item.isInLastLevel()) {
      isFocused = true;
    }
    return isFocused;
  }

  /// Item 点击之后的数据处理
  void _processFilterData(AuSelectionEntity selectedEntity) {
    int totalLevel = AuSelectionUtil.getTotalLevel(selectedEntity);
    if (selectedEntity.isUnLimit()) {
      selectedEntity.parent?.clearChildSelection();
    }

    /// 设置选中数据。
    /// 当选中的数据不是最后一列时，相当于不选中数据
    /// 当选中为不限类型时，不再设置选中状态。
    if (totalLevel == 1) {
      configOneLevelList(selectedEntity);
    } else {
      configMultiLevelList(selectedEntity, widget.currentListIndex);
    }

    /// Warning !!!
    /// （两列、三列时）第一列节点是否被选中取决于它的子节点是否被选中，
    /// 只有当它子节点被选中时才会认为第一列的节点相应被选中。
    if (widget.items.isNotEmpty) {
      widget.items[0].parent?.isSelected = (widget.items[0].parent?.children
                  .where((AuSelectionEntity f) => f.isSelected)
                  .length ??
              0) >
          0;
    }

    for (AuSelectionEntity item in widget.items) {
      if (item.isSelected) {
        if (!widget._selectedItems.contains(item)) {
          widget._selectedItems.add(item);
        }
      } else {
        if (widget._selectedItems.contains(item)) {
          widget._selectedItems.remove(item);
        }
      }
    }
  }

  void configOneLevelList(AuSelectionEntity selectedEntity) {
    if (AuSelectionFilterType.radio == selectedEntity.filterType) {
      /// 单选，清除同一级别选中的状态，则其他的设置为未选中。
      selectedEntity.parent?.clearChildSelection();
      selectedEntity.isSelected = true;
    } else if (AuSelectionFilterType.checkbox == selectedEntity.filterType) {
      /// 选中【不限】清除同一级别其他的状态
      if (selectedEntity.isUnLimit()) {
        selectedEntity.parent?.clearChildSelection();
        selectedEntity.isSelected = true;
      } else {
        ///清除【不限】类型。
        List<AuSelectionEntity> brotherItems;
        if (selectedEntity.parent == null) {
          brotherItems = widget.items;
        } else {
          brotherItems = selectedEntity.parent?.children ?? [];
        }
        for (AuSelectionEntity entity in brotherItems) {
          if (entity.isUnLimit()) {
            entity.isSelected = false;
          }
        }
        selectedEntity.isSelected = !selectedEntity.isSelected;
      }
    }
  }

  /// 根据父子层级数据，配置节点选中状态
  void configMultiLevelList(
      AuSelectionEntity selectedEntity, int currentListIndex) {
    /// 选中【不限】清除同一级别其他的状态
    if (selectedEntity.isUnLimit()) {
      selectedEntity.parent?.children
          .where((f) => f != selectedEntity)
          .forEach((f) {
        f.clearChildSelection();
        f.isSelected = false;
      });
      selectedEntity.isSelected = true;
    } else if (AuSelectionFilterType.radio == selectedEntity.filterType) {
      /// 单选，清除同一级别选中的状态，则其他的设置为未选中。
      selectedEntity.parent?.children
          .where((f) => f != selectedEntity)
          .forEach((f) {
        f.clearChildSelection();
        f.isSelected = false;
      });
      selectedEntity.isSelected = true;
    } else if (AuSelectionFilterType.checkbox == selectedEntity.filterType) {
      ///清除【不限】类型。
      List<AuSelectionEntity> brotherItems;
      if (selectedEntity.parent == null) {
        brotherItems = widget.items;
      } else {
        brotherItems = selectedEntity.parent?.children ?? [];
      }
      for (AuSelectionEntity entity in brotherItems) {
        if (entity.isUnLimit()) {
          entity.clearChildSelection();
          entity.isSelected = false;
        }
      }
      selectedEntity.isSelected = !selectedEntity.isSelected;
    }
  }
}
