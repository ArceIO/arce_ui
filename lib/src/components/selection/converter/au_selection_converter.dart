import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';
import 'package:arce_ui/src/components/selection/au_selection_util.dart';
import 'package:arce_ui/src/utils/au_tools.dart';

/// 筛选项数据转换器，用于将统一的数据结构转换为用户需要的数据结构
abstract class AuSelectionConverterDelegate {
  /// 统一的数据结构 转换为 用户需要的数据结构，并通过 [AuSelectionOnSelectionChanged] 回传给用户使用。
  Map<String, String> convertSelectedData(
      List<AuSelectionEntity> selectedResults);
}

/// 默认的筛选项数据转换器
class DefaultSelectionConverter implements AuSelectionConverterDelegate {
  const DefaultSelectionConverter();

  @override
  Map<String, String> convertSelectedData(
      List<AuSelectionEntity> selectedResults) {
    return getSelectionParams(selectedResults);
  }
}

/// 默认的【更多】筛选项数据转换器
class DefaultMoreSelectionConverter implements AuSelectionConverterDelegate {
  const DefaultMoreSelectionConverter();

  @override
  Map<String, String> convertSelectedData(
      List<AuSelectionEntity> selectedResults) {
    return getSelectionParams(selectedResults);
  }
}

/// 默认的【快捷筛选】筛选项数据转换器
class DefaultSelectionQuickFilterConverter
    implements AuSelectionConverterDelegate {
  const DefaultSelectionQuickFilterConverter();

  @override
  Map<String, String> convertSelectedData(
      List<AuSelectionEntity> selectedResults) {
    return getSelectionParams(selectedResults);
  }
}

/// 注意，此方法仅在初始化筛选项之前调用。如果再筛选之后使用会影响筛选View 的展示以及筛选结果。
Map<String, String> getSelectionParamsWithConfigChild(
    List<AuSelectionEntity>? selectedResults) {
  Map<String, String> params = {};
  if (selectedResults == null) return params;
  for (var f in selectedResults) {
    f.configRelationshipAndDefaultValue();
  }
  return getSelectionParams(selectedResults);
}

/// 根据传入的原始数据，返回用户选中的筛选数据
Map<String, String> getSelectionParams(
    List<AuSelectionEntity>? selectedResults) {
  Map<String, String> params = {};
  if (selectedResults == null) return params;
  for (AuSelectionEntity menuItemEntity in selectedResults) {
    if (menuItemEntity.filterType == AuSelectionFilterType.more) {
      params.addAll(getSelectionParams(menuItemEntity.children));
    } else {
      /// 1、首先找出 自定义范围的筛选项参数。
      AuSelectionEntity? selectedCustomInputItem =
          AuSelectionUtil.getFilledCustomInputItem(menuItemEntity.children);
      if (selectedCustomInputItem != null &&
          !BrunoTools.isEmpty(selectedCustomInputItem.customMap)) {
        String? key = selectedCustomInputItem.parent?.key;
        if (!BrunoTools.isEmpty(key)) {
          params[key!] = '${selectedCustomInputItem.customMap!["min"] ?? ''}:${selectedCustomInputItem.customMap!["max"] ?? ''}';
        }
      }

      /// 2、一次找出层级为 1、2、3 的选中项的参数，递归不好阅读，直接写成 for 嵌套遍历。
      int levelCount = AuSelectionUtil.getTotalLevel(menuItemEntity);
      if (levelCount == 1) {
        params.addAll(getCurrentSelectionEntityParams(menuItemEntity));
      } else if (levelCount == 2) {
        params.addAll(getCurrentSelectionEntityParams(menuItemEntity));
        for (var firstLevelItem in menuItemEntity.children) {
          params.addAll(getCurrentSelectionEntityParams(firstLevelItem));
        }
      } else if (levelCount == 3) {
        params.addAll(getCurrentSelectionEntityParams(menuItemEntity));
        for (var firstLevelItem in menuItemEntity.children) {
          params.addAll(getCurrentSelectionEntityParams(firstLevelItem));
          for (var secondLevelItem in firstLevelItem.children) {
            params.addAll(getCurrentSelectionEntityParams(secondLevelItem));
          }
        }
      }
    }
  }
  return params;
}

/// 获取当前选中项中用户选择的筛选数据
Map<String, String> getCurrentSelectionEntityParams(
    AuSelectionEntity selectionEntity) {
  Map<String, String> params = {};
  String? parentKey = selectionEntity.key;
  List<String?> selectedEntity = selectionEntity.children
      .where((AuSelectionEntity f) => f.isSelected)
      .where((AuSelectionEntity f) => !BrunoTools.isEmpty(f.value))
      .map((AuSelectionEntity f) => f.value)
      .toList();
  String selectedParams =
      selectedEntity.isEmpty ? '' : selectedEntity.join(',');
  if (!BrunoTools.isEmpty(selectedParams) && !BrunoTools.isEmpty(parentKey)) {
    params[parentKey!] = selectedParams;
  }
  return params;
}
