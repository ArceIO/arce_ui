import 'dart:async';

import 'package:arce_ui/src/components/popup/au_measure_size.dart';
import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';
import 'package:arce_ui/src/components/selection/au_selection_util.dart';
import 'package:arce_ui/src/components/selection/au_selection_view.dart';
import 'package:arce_ui/src/components/selection/controller/au_flat_selection_controller.dart';
import 'package:arce_ui/src/components/selection/converter/au_selection_converter.dart';
import 'package:arce_ui/src/components/selection/widget/au_flat_selection_item.dart';
import 'package:arce_ui/src/components/toast/au_toast.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_selection_config.dart';
import 'package:flutter/material.dart';

/// 支持tag 、输入 、range、选择等类型混合一级筛选
/// 也可支持点击选项跳转二级页面
// ignore: must_be_immutable
class AuFlatSelection extends StatefulWidget {
  /// 筛选原始数据
  final List<AuSelectionEntity> entityDataList;

  /// 点击确定回调
  final Function(Map<String, String>)? confirmCallback;

  /// 每行展示tag数量  默认真是3个
  final int preLineTagSize;

  /// 当[AuSelectionEntity.filterType]为[AuSelectionFilterType.layer] or[AuSelectionFilterType.customLayer]时
  /// 跳转到二级页面的自定义操作
  final AuOnCustomFloatingLayerClick? onCustomFloatingLayerClick;

  /// controller.dispose() 操作交由外部处理
  final AuFlatSelectionController? controller;

  /// 是否需要配置子选项
  final bool isNeedConfigChild;

  /// 主题配置
  /// 如有对文本样式、圆角、间距等[AuSelectionConfig]有特定要求可以配置该属性
  AuSelectionConfig? themeData;

  AuFlatSelection(
      {super.key,
      required this.entityDataList,
      this.confirmCallback,
      this.onCustomFloatingLayerClick,
      this.preLineTagSize = 3,
      this.isNeedConfigChild = true,
      this.controller,
      this.themeData}) {
    themeData ??= AuSelectionConfig();
    themeData = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .selectionConfig
        .merge(themeData!);
  }

  @override
  _AuFlatSelectionState createState() => _AuFlatSelectionState();
}

class _AuFlatSelectionState extends State<AuFlatSelection>
    with SingleTickerProviderStateMixin {
  final List<AuSelectionEntity> _originalSelectedItemsList = [];

  StreamController<FlatClearEvent> clearController =
      StreamController.broadcast();
  bool isValid = true;

  double _lineWidth = 0.0;

  @override
  void initState() {
    super.initState();

    if (widget.isNeedConfigChild) {
      for (var f in widget.entityDataList) {
        f.configRelationshipAndDefaultValue();
      }
    }
    widget.controller?.addListener(_handleFlatControllerTick);

    List<AuSelectionEntity> firstColumn = [];
    if (widget.entityDataList.isNotEmpty) {
      for (AuSelectionEntity entity in widget.entityDataList) {
        if (entity.isSelected) {
          firstColumn.add(entity);
        }
      }
    }
    _originalSelectedItemsList.addAll(firstColumn);
    if (firstColumn.isNotEmpty) {
      for (AuSelectionEntity firstEntity in firstColumn) {
        List<AuSelectionEntity> secondColumn =
            AuSelectionUtil.currentSelectListForEntity(firstEntity);
        _originalSelectedItemsList.addAll(secondColumn);
        if (secondColumn.isNotEmpty) {
          for (AuSelectionEntity secondEntity in secondColumn) {
            List<AuSelectionEntity> thirdColumn =
                AuSelectionUtil.currentSelectListForEntity(secondEntity);
            _originalSelectedItemsList.addAll(thirdColumn);
          }
        }
      }
    }

    for (AuSelectionEntity entity in _originalSelectedItemsList) {
      entity.isSelected = true;
      if (entity.customMap != null) {
        // originalCustomMap 是用来存临时状态数据, customMap 用来展示 ui
        entity.originalCustomMap = Map.from(entity.customMap!);
      }
    }
  }

  void _handleFlatControllerTick() {
    if (widget.controller?.isResetSelectedOptions ?? false) {
      if (mounted) {
        setState(() {
          _resetSelectedOptions();
        });
      }
      widget.controller?.isResetSelectedOptions = false;
    } else if (widget.controller?.isCancelSelectedOptions ?? false) {
      // 外部关闭调用无UI更新操作
      _cancelSelectedOptions();
      widget.controller?.isCancelSelectedOptions = false;
    } else if (widget.controller?.isConfirmSelectedOptions ?? false) {
      _confirmSelectedOptions();
      widget.controller?.isConfirmSelectedOptions = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
        onChange: (size) {
          setState(() {
            _lineWidth = size.width;
          });
        },
        child: _buildSelectionListView());
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleFlatControllerTick);
    super.dispose();
  }

  /// 取消
  _cancelSelectedOptions() {
    if (widget.entityDataList.isEmpty) {
      return;
    }
    for (AuSelectionEntity entity in widget.entityDataList) {
      AuSelectionUtil.resetSelectionDatas(entity);
    }
    //把数据还原
    for (var data in _originalSelectedItemsList) {
      data.isSelected = true;
      if (data.customMap != null) {
        // originalCustomMap 是用来存临时状态数据, customMap 用来展示 ui
        data.customMap = <String, String>{};
        data.originalCustomMap.forEach((key, value) {
          data.customMap![key.toString()] = value.toString();
        });
      }
    }
  }

  /// 重置
  _resetSelectedOptions() {
    clearController.add(FlatClearEvent());
    if (widget.entityDataList.isNotEmpty) {
      for (AuSelectionEntity entity in widget.entityDataList) {
        _clearUIData(entity);
      }
    }
  }

  /// 确定
  void _confirmSelectedOptions() {
    _clearSelectedEntity();
    if (!isValid) {
      isValid = true;
      return;
    }

    for (var data in widget.entityDataList) {
      if (data.selectedList().isNotEmpty) {
        data.isSelected = true;
      } else {
        data.isSelected = false;
      }
    }
    if (widget.confirmCallback != null) {
      widget.confirmCallback!(const DefaultSelectionConverter()
          .convertSelectedData(widget.entityDataList));
    }
  }

  /// 标题+筛选条件的 列表
  Widget _buildSelectionListView() {
    var contentWidget = Material(
        color: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AuFlatMoreSelection(
                clearController: clearController,
                selectionEntity: widget.entityDataList[index],
                onCustomFloatingLayerClick: widget.onCustomFloatingLayerClick,
                preLineTagSize: widget.preLineTagSize,
                parentWidth: _lineWidth,
                themeData: widget.themeData!,
              );
            },
            itemCount: widget.entityDataList.length,
          ),
        ));

    return contentWidget;
  }

  /// 清空UI效果
  void _clearUIData(AuSelectionEntity entity) {
    entity.isSelected = false;
    entity.customMap = <String, String>{};
    if (AuSelectionFilterType.range == entity.filterType) {
      entity.title = '';
    }
    for (AuSelectionEntity subEntity in entity.children) {
      _clearUIData(subEntity);
    }
  }

  void _clearSelectedEntity() {
    List<AuSelectionEntity> tmp = [];
    AuSelectionEntity node;
    tmp.addAll(widget.entityDataList);
    while (tmp.isNotEmpty) {
      node = tmp.removeLast();
      if (!node.isValidRange()) {
        isValid = false;
        AuToast.show(
            AuIntl.of(context).localizedResource.enterRangeError, context);
        return;
      }
      for (var data in node.children) {
        tmp.add(data);
      }
    }
  }
}
