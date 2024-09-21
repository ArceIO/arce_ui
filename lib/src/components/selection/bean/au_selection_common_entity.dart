import 'package:arce_ui/src/components/picker/time_picker/au_date_picker_constants.dart';
import 'package:arce_ui/src/components/selection/au_selection_util.dart';
import 'package:arce_ui/src/constants/au_constants.dart';
import 'package:arce_ui/src/utils/au_tools.dart';

/// 筛选组件支持的筛选类型
enum AuSelectionFilterType {
  /// 未设置
  none,

  /// 不限类型
  unLimit,

  /// 单选列表、单选项 type 为 radio
  radio,

  /// 多选列表、多选项 type 为 checkbox
  checkbox,

  /// 一般的值范围自定义区间 type 为 range
  range,

  /// 日期选择,普通筛选时使用 CalendarView 展示选择时间，更多情况下使用 DatePicker 选择时间
  date,

  /// 自定义选择日期区间， type 为 dateRange
  dateRange,

  /// 自定义通过 Calendar 选择日期区间，type 为 dateRangeCalendar
  dateRangeCalendar,

  /// 标签筛选 type 为 customerTag
  customHandle,

  /// 更多列表、多选项 无 type
  more,

  /// 去二级页面
  layer,

  /// 去自定义二级页面
  customLayer,
}

/// 筛选弹窗展示风格
enum AuSelectionWindowType {
  /// 列表类型,使用列表 Item 展示
  list,

  /// 值范围类型,使用 Tag + Range 的 Item 展示
  range,
}

/// 筛选组件使用的数据结构
class AuSelectionEntity {
  /// 类型 是单选、复选还是有自定义输入
  String? type;

  /// 回传给服务器的 key
  String? key;

  /// 回传给服务器的 value
  String? value;

  /// 默认值
  String? defaultValue;

  /// 显示的文案
  String title;

  /// 显示的文案
  String? subTitle;

  /// 扩展字段，目前只有min和max
  Map extMap;

  /// 子筛选项
  List<AuSelectionEntity> children;

  //////////// 以上为接口下发的原始数据字段 ///////////////

  //////////// 下方为组件另需要使用的字段 ///////////////
  /// 是否选中
  bool isSelected;

  /// 自定义输入
  Map<String, String>? customMap;

  /// 用于临时存储原有自定义字段数据，在筛选数据变化后未点击【确定】按钮时还原。
  late Map originalCustomMap;

  /// 最大可选数量
  int maxSelectedCount;

  /// 父级筛选项
  AuSelectionEntity? parent;

  /// 筛选类型，具体参见 [AuSelectionFilterType]
  late AuSelectionFilterType filterType;

  /// 筛选弹窗展示风格对应的首字母小写的字符串，例如 `range`、`list`，参见 [AuSelectionWindowType]
  String? showType;

  /// 筛选弹窗展示风格，具体参见 [AuSelectionWindowType]
  AuSelectionWindowType? filterShowType;

  /// 自定义标题
  String? customTitle;

  ///自定义筛选的 title 是否高亮
  bool isCustomTitleHighLight;

  /// 临时字段用于判断是否要将筛选项 [name] 字段拼接展示
  bool canJoinTitle = false;

  AuSelectionEntity(
      {this.key,
      this.value,
      this.defaultValue,
      this.title = '',
      this.subTitle,
      this.children = const [],
      this.isSelected = false,
      this.extMap = const {},
      this.customMap,
      this.type,
      this.showType,
      this.isCustomTitleHighLight = false,
      this.maxSelectedCount = AuSelectionConstant.maxSelectCount}) {
    filterType = parserFilterTypeWithType(type);
    filterShowType = parserShowType(showType);
    originalCustomMap = {};
  }

  /// 构造简单筛选数据
  AuSelectionEntity.simple({
    this.key,
    this.value,
    this.title = '',
    this.type,
  })  : maxSelectedCount = AuSelectionConstant.maxSelectCount,
        isCustomTitleHighLight = false,
        isSelected = false,
        children = [],
        extMap = {} {
    filterType = parserFilterTypeWithType(type);
    filterShowType = parserShowType(showType);
    originalCustomMap = {};
    isSelected = false;
  }

  /// 建议使用 [AuSelectionEntity.fromJson]
  static AuSelectionEntity fromMap(Map<String, dynamic> map) {
    AuSelectionEntity entity = AuSelectionEntity();
    entity.title = map['title'] ?? '';
    entity.subTitle = map['subTitle'] ?? '';
    entity.key = map['key'] ?? '';
    entity.type = map['type'] ?? '';
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
    if (map['children'] != null && map['children'] is List) {
      entity.children = [...(map['children'] as List).map((o) => AuSelectionEntity.fromMap(o))];
    }
    entity.filterType = entity.parserFilterTypeWithType(map['type'] ?? "");
    return entity;
  }

  AuSelectionEntity.fromJson(Map<dynamic, dynamic>? map)
      : title = '',
        maxSelectedCount = AuSelectionConstant.maxSelectCount,
        isCustomTitleHighLight = false,
        isSelected = false,
        children = [],
        extMap = {} {
    if (map == null) return;
    title = map['title'] ?? '';
    subTitle = map['subTitle'] ?? '';
    key = map['key'] ?? '';
    type = map['type'] ?? '';
    defaultValue = map['defaultValue'] ?? '';
    value = map['value'] ?? '';
    if (map['maxSelectedCount'] != null &&
        int.tryParse(map['maxSelectedCount']) != null) {
      maxSelectedCount = int.tryParse(map['maxSelectedCount']) ??
          AuSelectionConstant.maxSelectCount;
    }
    extMap = map['ext'] ?? {};
    children = [...(map['children'] ?? []).map((o) => AuSelectionEntity.fromJson(o))];
    filterType = parserFilterTypeWithType(map['type'] ?? '');
    isSelected = false;
  }

  void configRelationshipAndDefaultValue() {
    configRelationship();
    configDefaultValue();
  }

  void configRelationship() {
    if (children.isNotEmpty) {
      for (AuSelectionEntity entity in children) {
        entity.parent = this;
      }
      for (AuSelectionEntity entity in children) {
        entity.configRelationship();
      }
    }
  }

  void configDefaultValue() {
    if (children.isNotEmpty) {
      for (AuSelectionEntity entity in children) {
        if (!BrunoTools.isEmpty(defaultValue)) {
          List<String> values = defaultValue!.split(',');
          entity.isSelected = values.contains(entity.value);
        }
      }

      /// 当 default 不在普通 Item 类型中时，尝试填充 同级别 Range Item.
      if (children.where((_) => _.isSelected).toList().isEmpty) {
        List<AuSelectionEntity> rangeItems = children.where((_) {
          return (_.filterType == AuSelectionFilterType.range ||
              _.filterType == AuSelectionFilterType.dateRange ||
              _.filterType == AuSelectionFilterType.dateRangeCalendar);
        }).toList();
        AuSelectionEntity? rangeEntity;
        if (rangeItems.isNotEmpty) {
          rangeEntity = rangeItems[0];
        }
        if (rangeEntity != null && !BrunoTools.isEmpty(defaultValue)) {
          List<String> values = defaultValue!.split(':');
          if (values.length == 2 &&
              int.tryParse(values[0]) != null &&
              int.tryParse(values[1]) != null) {
            rangeEntity.customMap = {};
            rangeEntity.customMap = {"min": values[0], "max": values[1]};
            rangeEntity.isSelected = true;
          }
        }
      }

      for (AuSelectionEntity entity in children) {
        entity.configDefaultValue();
      }
      if (hasCheckBoxBrother()) {
        isSelected = children.where((_) => _.isSelected).isNotEmpty;
      } else {
        isSelected =
            isSelected || children.where((_) => _.isSelected).isNotEmpty;
      }
    }
  }

  /// 根据 [showType] 解析出对应的 [AuSelectionWindowType]， 默认为 [AuSelectionWindowType.list]
  AuSelectionWindowType parserShowType(String? showType) {
    if (showType == "list") {
      return AuSelectionWindowType.list;
    } else if (showType == "range") {
      return AuSelectionWindowType.range;
    }
    return AuSelectionWindowType.list;
  }

  /// 根据 [type] 解析出对应的 [AuSelectionFilterType], 默认为 [AuSelectionFilterType.none]
  AuSelectionFilterType parserFilterTypeWithType(String? type) {
    if (type == 'unlimit') {
      return AuSelectionFilterType.unLimit;
    } else if (type == "radio") {
      return AuSelectionFilterType.radio;
    } else if (type == "checkbox") {
      return AuSelectionFilterType.checkbox;
    } else if (type == "range") {
      return AuSelectionFilterType.range;
    } else if (type == "customHandle") {
      return AuSelectionFilterType.customHandle;
    } else if (type == "more") {
      return AuSelectionFilterType.more;
    } else if (type == 'floatinglayer') {
      return AuSelectionFilterType.layer;
    } else if (type == 'customfloatinglayer') {
      return AuSelectionFilterType.customLayer;
    } else if (type == 'date') {
      return AuSelectionFilterType.date;
    } else if (type == 'daterange') {
      return AuSelectionFilterType.dateRange;
    } else if (type == 'daterangecalendar') {
      return AuSelectionFilterType.dateRangeCalendar;
    }
    return AuSelectionFilterType.none;
  }

  /// 清空子节点的选中状态
  void clearChildSelection() {
    if (children.isNotEmpty) {
      for (AuSelectionEntity entity in children) {
        entity.isSelected = false;
        if (entity.filterType == AuSelectionFilterType.date) {
          entity.value = null;
        }
        if (entity.filterType == AuSelectionFilterType.range ||
            entity.filterType == AuSelectionFilterType.dateRange ||
            entity.filterType == AuSelectionFilterType.dateRangeCalendar) {
          entity.customMap = <String, String>{};
        }
        entity.clearChildSelection();
      }
    }
  }

  /// 获取当前节点的所有选中的子节点
  List<AuSelectionEntity> selectedLastColumnList() {
    List<AuSelectionEntity> list = [];
    if (children.isNotEmpty) {
      List<AuSelectionEntity> firstList = [];
      for (AuSelectionEntity firstEntity in children) {
        if (firstEntity.children.isNotEmpty) {
          List<AuSelectionEntity> secondList = [];
          for (AuSelectionEntity secondEntity in firstEntity.children) {
            if (secondEntity.children.isNotEmpty) {
              List<AuSelectionEntity> thirds =
                  AuSelectionUtil.currentSelectListForEntity(secondEntity);
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

  /// 获取当前节点的所有选中的子节点, 不包含【不限】节点
  List<AuSelectionEntity> selectedListWithoutUnlimit() {
    List<AuSelectionEntity> selected = selectedList();
    return selected
        .where((_) => !_.isUnLimit())
        .where((_) =>
            (_.filterType != AuSelectionFilterType.range) ||
            (_.filterType == AuSelectionFilterType.range &&
                !BrunoTools.isEmpty(_.customMap)))
        .where((_) =>
            (_.filterType != AuSelectionFilterType.dateRange) ||
            (_.filterType == AuSelectionFilterType.dateRange &&
                !BrunoTools.isEmpty(_.customMap)))
        .where((_) =>
            (_.filterType != AuSelectionFilterType.dateRangeCalendar) ||
            (_.filterType == AuSelectionFilterType.dateRangeCalendar &&
                !BrunoTools.isEmpty(_.customMap)))
        .toList();
  }

  /// 获取当前节点的所有选中的子节点，支持 more 类型
  List<AuSelectionEntity> selectedList() {
    if (AuSelectionFilterType.more == filterType) {
      return selectedLastColumnList();
    } else {
      List<AuSelectionEntity> results = [];
      List<AuSelectionEntity> firstColumn =
          AuSelectionUtil.currentSelectListForEntity(this);
      results.addAll(firstColumn);
      if (firstColumn.isNotEmpty) {
        for (AuSelectionEntity firstEntity in firstColumn) {
          List<AuSelectionEntity> secondColumn =
              AuSelectionUtil.currentSelectListForEntity(firstEntity);
          results.addAll(secondColumn);
          if (secondColumn.isNotEmpty) {
            for (AuSelectionEntity secondEntity in secondColumn) {
              List<AuSelectionEntity> thirdColumn =
                  AuSelectionUtil.currentSelectListForEntity(secondEntity);
              results.addAll(thirdColumn);
            }
          }
        }
      }
      return results;
    }
  }

  /// 获取当前节点的所有选中的子节点
  List<AuSelectionEntity> allSelectedList() {
    List<AuSelectionEntity> results = [];
    List<AuSelectionEntity> firstColumn =
        AuSelectionUtil.currentSelectListForEntity(this);
    results.addAll(firstColumn);
    if (firstColumn.isNotEmpty) {
      for (AuSelectionEntity firstEntity in firstColumn) {
        List<AuSelectionEntity> secondColumn =
            AuSelectionUtil.currentSelectListForEntity(firstEntity);
        results.addAll(secondColumn);
        if (secondColumn.isNotEmpty) {
          for (AuSelectionEntity secondEntity in secondColumn) {
            List<AuSelectionEntity> thirdColumn =
                AuSelectionUtil.currentSelectListForEntity(secondEntity);
            results.addAll(thirdColumn);
          }
        }
      }
    }
    return results;
  }

  /// 获取当前节点对应根节点，返回根节点最后一级选中的子节点的数量
  int getLimitedRootSelectedChildCount() {
    return getSelectedChildCount(getRootEntity(this));
  }

  /// 获取当前节点对应根节点，可选择的最大选中数量
  int getLimitedRootMaxSelectedCount() {
    return getRootEntity(this).maxSelectedCount;
  }

  /// 获取当前节点对应根节点
  AuSelectionEntity getRootEntity(AuSelectionEntity rootEntity) {
    if (rootEntity.parent == null ||
        rootEntity.parent!.maxSelectedCount ==
            AuSelectionConstant.maxSelectCount) {
      return rootEntity;
    } else {
      return getRootEntity(rootEntity.parent!);
    }
  }

  /// 返回最后一层级【选中状态】 Item 的 个数
  int getSelectedChildCount(AuSelectionEntity entity) {
    if (BrunoTools.isEmpty(entity.children)) {
      return entity.isSelected ? 1 : 0;
    }

    int count = 0;
    for (AuSelectionEntity child in entity.children) {
      count += getSelectedChildCount(child);
    }
    return count;
  }

  /// 判断当前的筛选 Item 是否为当前层次中第一个被选中的 Item。
  /// 用于展开筛选弹窗时显示选中效果。
  int getIndexInCurrentLevel() {
    if (parent == null || parent!.children.isEmpty) return -1;

    for (AuSelectionEntity entity in parent!.children) {
      if (entity == this) {
        return parent!.children.indexOf(entity);
      }
    }
    return -1;
  }

  /// 是否在筛选数据的最后一层。 如果最大层次为 3；某个筛选数据层次为 2，但其无子节点。此时认为不在最后一层。
  bool isInLastLevel() {
    if (parent == null || parent!.children.isEmpty) return true;

    for (AuSelectionEntity entity in parent!.children) {
      if (entity.children.isNotEmpty) {
        return false;
      }
    }
    return true;
  }

  /// 检查自己的兄弟结点是否存在 checkbox 类型。
  bool hasCheckBoxBrother() {
    int? count = parent?.children
        .where((f) => f.filterType == AuSelectionFilterType.checkbox)
        .length;
    return count == null ? false : count > 0;
  }

  /// 在这里简单认为 value 为空【null 或 ''】时为 unlimit.
  bool isUnLimit() {
    return filterType == AuSelectionFilterType.unLimit;
  }

  /// 递归清空选中状态
  void clearSelectedEntity() {
    List<AuSelectionEntity> tmp = [];
    AuSelectionEntity node = this;
    tmp.add(node);
    while (tmp.isNotEmpty) {
      node = tmp.removeLast();
      node.isSelected = false;
      for (var data in node.children) {
        tmp.add(data);
      }
    }
  }

  /// 返回当前节点所有不是以下类型的子节点
  /// [AuSelectionFilterType.range]
  /// [AuSelectionFilterType.dateRange]
  /// [AuSelectionFilterType.dateRangeCalendar]
  List<AuSelectionEntity> currentTagListForEntity() {
    List<AuSelectionEntity> list = [];
    for (var data in children) {
      if (data.filterType != AuSelectionFilterType.range &&
          data.filterType != AuSelectionFilterType.dateRange &&
          data.filterType != AuSelectionFilterType.dateRangeCalendar) {
        list.add(data);
      }
    }
    return list;
  }

  /// 根据是否展开，返回对应数量的子节点
  List<AuSelectionEntity> currentShowTagByExpanded(bool isExpanded) {
    List<AuSelectionEntity> all = currentTagListForEntity();
    return isExpanded ? all : all.sublist(0, currentDefaultTagCountForEntity());
  }

  /// 最终显示tag个数
  int currentDefaultTagCountForEntity() {
    return currentTagListForEntity().length > getDefaultShowCount()
        ? getDefaultShowCount()
        : currentTagListForEntity().length;
  }

  /// 默认展示个数是否大于总tag个数
  bool isOverCurrentTagListSize() {
    return getDefaultShowCount() > currentTagListForEntity().length;
  }

  /// 接口返回默认展示tag个数
  int getDefaultShowCount() {
    int defaultShowCount = 3;
    if (extMap.containsKey('defaultShowCount')) {
      defaultShowCount = extMap['defaultShowCount'] ?? defaultShowCount;
    }
    return defaultShowCount;
  }

  /// 返回当前节点下所有以下类型的子节点
  /// [AuSelectionFilterType.range]
  /// [AuSelectionFilterType.dateRange]
  /// [AuSelectionFilterType.dateRangeCalendar]
  List<AuSelectionEntity> currentRangeListForEntity() {
    List<AuSelectionEntity> list = [];
    for (var data in children) {
      if (data.filterType == AuSelectionFilterType.range ||
          data.filterType == AuSelectionFilterType.dateRange ||
          data.filterType == AuSelectionFilterType.dateRangeCalendar) {
        list.add(data);
      }
    }
    return list;
  }

  /// 校验 range 类型的数据是否合法
  bool isValidRange() {
    if (filterType == AuSelectionFilterType.range ||
        filterType == AuSelectionFilterType.dateRange ||
        filterType == AuSelectionFilterType.dateRangeCalendar) {
      DateTime minTime = DateTime.parse(datePickerMinDatetime);
      DateTime maxTime = DateTime.parse(datePickerMaxDatetime);
      int limitMin = int.tryParse(extMap['min']?.toString() ?? "") ??
          (filterType == AuSelectionFilterType.dateRange ||
                  filterType == AuSelectionFilterType.dateRangeCalendar
              ? minTime.millisecondsSinceEpoch
              : 0);
      // 日期最大值没设置 默认是2121年01月01日 08:00:00
      int limitMax = int.tryParse(extMap['max']?.toString() ?? "") ??
          (filterType == AuSelectionFilterType.dateRange ||
                  filterType == AuSelectionFilterType.dateRangeCalendar
              ? maxTime.millisecondsSinceEpoch
              : 9999);

      if (customMap != null && customMap!.isNotEmpty) {
        String min = customMap!['min'] ?? "";
        String max = customMap!['max'] ?? "";
        if (min.isEmpty && max.isEmpty) {
          return true;
        }
        int? inputMin = int.tryParse(customMap!['min'] ?? "");
        int? inputMax = int.tryParse(customMap!['max'] ?? "");

        if (inputMax != null && inputMin != null) {
          if (inputMin >= limitMin &&
              inputMax <= limitMax &&
              inputMax >= inputMin) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      }
    }
    return true;
  }

  /// 反选
  void reverseSelected() {
    isSelected = !isSelected;
  }

  /// 获取第一个选中的子节点的下标
  int getFirstSelectedChildIndex() {
    return children.indexWhere((data) {
      return data.isSelected;
    });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuSelectionEntity &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value &&
          defaultValue == other.defaultValue &&
          title == other.title &&
          children == other.children &&
          isSelected == other.isSelected &&
          extMap == other.extMap &&
          customMap == other.customMap &&
          type == other.type &&
          parent == other.parent &&
          filterType == other.filterType;

  @override
  int get hashCode =>
      key.hashCode ^
      value.hashCode ^
      defaultValue.hashCode ^
      title.hashCode ^
      children.hashCode ^
      isSelected.hashCode ^
      extMap.hashCode ^
      customMap.hashCode ^
      type.hashCode ^
      parent.hashCode ^
      filterType.hashCode;
}
