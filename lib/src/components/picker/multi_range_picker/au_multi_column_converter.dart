import 'package:arce_ui/src/components/picker/multi_range_picker/bean/au_multi_column_picker_entity.dart';
import 'package:arce_ui/src/components/picker/multi_range_picker/au_multi_column_picker_util.dart';
import 'package:arce_ui/src/utils/au_tools.dart';

class AuMultiRangeSelConverter {
  const AuMultiRangeSelConverter();

  Map<String, List<AuPickerEntity>> convertPickedData(
      List<AuPickerEntity> selectedResults,
      {bool includeUnlimitSelection = false}) {
    return getSelectionParams(selectedResults,
        includeUnlimitSelection: includeUnlimitSelection);
  }

  Map<String, List<AuPickerEntity>> getSelectionParams(
      List<AuPickerEntity>? selectedResults,
      {bool includeUnlimitSelection = false}) {
    Map<String, List<AuPickerEntity>> params = {};
    if (selectedResults == null) return params;
    for (AuPickerEntity menuItemEntity in selectedResults) {
      int levelCount =
          AuMultiColumnPickerUtil.getTotalColumnCount(menuItemEntity);
      if (levelCount == 1) {
        params.addAll(getCurrentSelectionEntityParams(menuItemEntity,
            includeUnlimitSelection: includeUnlimitSelection));
      } else if (levelCount == 2) {
        params.addAll(getCurrentSelectionEntityParams(menuItemEntity,
            includeUnlimitSelection: includeUnlimitSelection));
        for (var firstLevelItem in menuItemEntity.children) {
          mergeParams(
            params,
            getCurrentSelectionEntityParams(firstLevelItem,
                includeUnlimitSelection: includeUnlimitSelection));
        }
      } else if (levelCount == 3) {
        params.addAll(getCurrentSelectionEntityParams(menuItemEntity,
            includeUnlimitSelection: includeUnlimitSelection));
        for (var firstLevelItem in menuItemEntity.children) {
          mergeParams(
              params,
              getCurrentSelectionEntityParams(firstLevelItem,
                  includeUnlimitSelection: includeUnlimitSelection));
          for (var secondLevelItem in firstLevelItem.children) {
            mergeParams(
                params,
                getCurrentSelectionEntityParams(secondLevelItem,
                    includeUnlimitSelection: includeUnlimitSelection));
          }
        }
      }
    }
    return params;
  }

  Map<String?, List<AuPickerEntity>> mergeParams(
      Map<String?, List<AuPickerEntity>> params,
      Map<String?, List<AuPickerEntity>> selectedParams) {
    selectedParams.forEach((String? key, List<AuPickerEntity> value) {
      if (params.containsKey(key)) {
        params[key]?.addAll(value);
      } else {
        params.addAll(selectedParams);
      }
    });
    return params;
  }

  Map<String, List<AuPickerEntity>> getCurrentSelectionEntityParams(
      AuPickerEntity selectionEntity,
      {bool includeUnlimitSelection = false}) {
    Map<String, List<AuPickerEntity>> params = {};
    String parentKey = selectionEntity.key ?? '';
    var selectedEntity = selectionEntity.children
        .where((AuPickerEntity f) => f.isSelected)
        .where((AuPickerEntity f) {
          if (includeUnlimitSelection) {
            return true;
          } else {
            return !BrunoTools.isEmpty(f.value);
          }
        })
        .map((AuPickerEntity f) => f)
        .toList();
    List<AuPickerEntity> selectedParams = selectedEntity;
    if (!BrunoTools.isEmpty(selectedParams) && !BrunoTools.isEmpty(parentKey)) {
      params[parentKey] = selectedParams;
    }
    return params;
  }
}
