import 'package:arce_ui/src/constants/au_constants.dart';
import 'package:arce_ui/src/utils/au_tools.dart';

enum PickerFilterType {
  none, //未设置
  unLimit, // 不限类型，与其他所有类型互斥。
  radio, //单选列表、单选项 type为radio
  checkbox, //多选列表、多选项 type为checkbox
}

/// 筛选弹窗展示风格
enum PickerWindowType {
  list, //列表类型,使用列表 Item 展示。
  range, //值范围类型,使用 Tag + Range 的 Item 展示
}

class AuPickerEntity {
  String? uniqueId; //唯一的id
  String?
      type; //类型 目前支持的类型有不限（unlimit）、单选（radio）、复选（checkbox）, 最终被解析成 PickerFilterType 类型
  String? key; //回传给服务器
  String? value; //回传给服务器
  String name; //显示的文案
  String? defaultValue;
  List<AuPickerEntity> children; //下级筛选项
  Map? extMap; //扩展字段，目前只有min和max

  bool isSelected; //是否选中
  int maxSelectedCount;
  AuPickerEntity? parent; //上级筛选项
  PickerFilterType? filterType; //筛选类型

  AuPickerEntity(
      {this.uniqueId,
      this.key,
      this.value,
      this.defaultValue,
      this.name = '',
      this.children = const [],
      this.isSelected = false,
      this.extMap,
      this.type,
      this.maxSelectedCount = AuSelectionConstant.maxSelectCount}) {
    filterType = parserFilterTypeWithType(type);
  }

  static AuPickerEntity fromMap(Map<String, dynamic>? map) {
    if (map == null) return AuPickerEntity();
    AuPickerEntity entity = AuPickerEntity();
    entity.uniqueId = map['id'] ?? "";
    entity.name = map['name'] ?? "";
    entity.key = map['key'] ?? "";
    entity.type = map['type'] ?? "";
    entity.filterType = entity.parserFilterTypeWithType(map['type'] ?? "");
    entity.isSelected = map['isSelected'] ?? false;
    entity.defaultValue = map['defaultValue'] ?? "";
    entity.value = map['value'] ?? "";
    if (map['maxSelectedCount'] != null &&
        int.tryParse(map['maxSelectedCount']) != null) {
      entity.maxSelectedCount = int.tryParse(map['maxSelectedCount']) ??
          AuSelectionConstant.maxSelectCount;
    } else {
      entity.maxSelectedCount = AuSelectionConstant.maxSelectCount;
    }
    entity.extMap = map['ext'] ?? {};
//    entity.children = map['children'] ?? [];
    entity.children = [...(map['children'] as List? ?? []).map((o) => AuPickerEntity.fromMap(o))];
    return entity;
  }

  void configChild() {
    configRelationship();
    configDefaultValue();
  }

  void configDefaultValue() {
    if (children.isNotEmpty) {
      for (AuPickerEntity entity in children) {
        if (!BrunoTools.isEmpty(defaultValue)) {
          List<String> values = defaultValue!.split(',');
          entity.isSelected = values.contains(entity.value);
        }
        entity.configDefaultValue();
      }

      isSelected = isSelected || children.where((_) => _.isSelected).isNotEmpty;
    }
  }

  void configRelationship() {
    if (children.isNotEmpty) {
      for (AuPickerEntity entity in children) {
        entity.parent = this;
        entity.configRelationship();
      }
    }
  }

  PickerWindowType parserShowType(String showType) {
    if (showType == "list") {
      return PickerWindowType.list;
    } else if (showType == "range") {
      return PickerWindowType.range;
    }
    return PickerWindowType.list;
  }

  PickerFilterType parserFilterTypeWithType(String? type) {
    if (type == "unlimit") {
      return PickerFilterType.unLimit;
    } else if (type == "radio") {
      return PickerFilterType.radio;
    } else if (type == "checkbox") {
      return PickerFilterType.checkbox;
    }
    return PickerFilterType.none;
  }

  void clearChildSelection() {
    if (children.isNotEmpty) {
      for (AuPickerEntity entity in children) {
        entity.isSelected = false;
        entity.clearChildSelection();
      }
    }
  }

  List<AuPickerEntity> selectedLastColumnList() {
    List<AuPickerEntity> list = [];
    if (children.isNotEmpty) {
      List<AuPickerEntity> firstList = [];
      for (AuPickerEntity firstEntity in children) {
        if (firstEntity.children.isNotEmpty) {
          List<AuPickerEntity> secondList = [];
          for (AuPickerEntity secondEntity in firstEntity.children) {
            if (secondEntity.children.isNotEmpty) {
              List<AuPickerEntity> thirds =
                  currentSelectListForEntity(secondEntity);
              if (thirds.isNotEmpty) {
                list.addAll(thirds);
              } else if (secondEntity.isSelected) {
                secondList.add(secondEntity);
              }
            } else if (secondEntity.isSelected) {
              secondList.add(secondEntity);
            }
          }
          list.addAll(secondList);
        } else if (firstEntity.isSelected) {
          firstList.add(firstEntity);
        }
      }
      list.addAll(firstList);
    }
    return list;
  }

  List<AuPickerEntity> selectedListWithoutUnlimit() {
    List<AuPickerEntity> selected = selectedList();
    return selected.where((_) => !_.isUnLimit()).toList();
  }

  List<AuPickerEntity> selectedList() {
    List<AuPickerEntity> results = [];
    List<AuPickerEntity> firstColumn = currentSelectListForEntity(this);
    results.addAll(firstColumn);
    if (firstColumn.isNotEmpty) {
      for (AuPickerEntity firstEntity in firstColumn) {
        List<AuPickerEntity> secondColumn =
            currentSelectListForEntity(firstEntity);
        results.addAll(secondColumn);
        if (secondColumn.isNotEmpty) {
          for (AuPickerEntity secondEntity in secondColumn) {
            List<AuPickerEntity> thirdColumn =
                currentSelectListForEntity(secondEntity);
            results.addAll(thirdColumn);
          }
        }
      }
    }
    return results;
  }

  /// 返回状态为选中的子节点
  List<AuPickerEntity> currentSelectListForEntity(AuPickerEntity entity) {
    List<AuPickerEntity> list = [];
    if (entity.children.isNotEmpty) {
      for (AuPickerEntity entity in entity.children) {
        if (entity.isSelected) {
          list.add(entity);
        }
      }
    }
    return list;
  }

  /// 返回最后一层级【选中状态】 Item 的 个数
  int getSelectedChildCount() {
    if (BrunoTools.isEmpty(children)) return isSelected ? 1 : 0;

    int count = 0;
    for (AuPickerEntity entity in children) {
      if (!entity.isUnLimit()) {
        count += entity.getSelectedChildCount();
      }
    }
    return count;
  }

  /// 判断当前的筛选 Item 是否为当前层次中第一个被选中的 Item。
  /// 用于展开筛选弹窗时显示选中效果。
  int getIndexInCurrentLevel() {
    if (parent == null || parent!.children.isEmpty) return -1;

    for (AuPickerEntity entity in parent!.children) {
      if (entity == this) {
        return parent!.children.indexOf(entity);
      }
    }
    return -1;
  }

  bool isInLastLevel() {
    if (parent == null || parent!.children.isEmpty) return true;

    for (AuPickerEntity entity in parent!.children) {
      if (entity.children.isNotEmpty) {
        return false;
      }
    }
    return true;
  }

  /// 在这里简单认为 value 为空【null 或 ''】时为 unLimit.
  bool isUnLimit() {
    return filterType == PickerFilterType.unLimit ||
        (BrunoTools.isEmpty(value) && filterType == PickerFilterType.radio);
  }

  void clearSelectedEntity() {
    List<AuPickerEntity> tmp = [];
    AuPickerEntity node = this;
    tmp.add(node);
    while (tmp.isNotEmpty) {
      node = tmp.removeLast();
      node.isSelected = false;
      for (var data in node.children) {
        tmp.add(data);
      }
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuPickerEntity &&
          runtimeType == other.runtimeType &&
          uniqueId == other.uniqueId &&
          key == other.key &&
          value == other.value &&
          defaultValue == other.defaultValue &&
          name == other.name &&
          children == other.children &&
          isSelected == other.isSelected &&
          extMap == other.extMap &&
          type == other.type &&
          parent == other.parent &&
          filterType == other.filterType;

  @override
  int get hashCode =>
      uniqueId.hashCode ^
      key.hashCode ^
      value.hashCode ^
      defaultValue.hashCode ^
      name.hashCode ^
      children.hashCode ^
      isSelected.hashCode ^
      extMap.hashCode ^
      type.hashCode ^
      parent.hashCode ^
      filterType.hashCode;
}
