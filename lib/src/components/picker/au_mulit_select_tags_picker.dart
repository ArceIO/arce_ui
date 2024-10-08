import 'package:arce_ui/src/components/picker/au_tags_common_picker.dart';
import 'package:arce_ui/src/components/picker/au_tags_picker_config.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:flutter/material.dart';

///样式的枚举类型
/// [average] 等分布局
/// [auto] 流式布局
enum AuMultiSelectTagsLayoutStyle {
  ///等分布局
  average,

  ///流式布局
  auto,
}

typedef AuMultiSelectTagStringBuilder<V> = String Function(V data);
typedef AuMultiSelectTagOnItemClick = void Function(
    AuTagItemBean onTapTag, bool isSelect);

/// 多选标签弹框,适用于底部弹出 Picker，且选择样式为 Tag 的场景。
/// 功能：多选标签弹框，适用于从底部弹出的情况，属于 Picker；
/// 可自定义标题、默认选中、字体大小等。
// ignore: must_be_immutable
class AuMultiSelectTagsPicker extends CommonTagsPicker {
  AuMultiSelectTagsPicker({
    super.key,
    required this.context,
    required this.onConfirm,
    this.onCancel,
    required this.tagPickerConfig,
    required this.onTagValueGetter,
    this.onMaxSelectClick,
    this.onItemClick,
    this.maxSelectItemCount = 0,
    this.crossAxisCount,
    this.itemHeight = 34.0,
    this.layoutStyle = AuMultiSelectTagsLayoutStyle.average,
    super.pickerTitleConfig,
    super.themeData,
  }) : super(
            context: context,
            onConfirm: onConfirm,
            onCancel: onCancel);

  /// 父类属性
  @override
  final BuildContext context;

  /// 点击提交功能
  @override
  final ValueChanged onConfirm;

  /// 点击取消按钮
  @override
  final VoidCallback? onCancel;

  /// 当点击到最大数目时的点击事件
  final VoidCallback? onMaxSelectClick;

  /// 点击某个按钮的回调
  final AuMultiSelectTagOnItemClick? onItemClick;

  /// 一行多少个数据，默认4个
  final int? crossAxisCount;

  /// 最多选择多少个item，默认可以无限选
  final int maxSelectItemCount;

  /// 本类属性
  final AuTagsPickerConfig tagPickerConfig;

  /// 传入的泛型数据转换为 [AuTagItemBean]
  /// 默认以填充Widget
  final AuMultiSelectTagStringBuilder<AuTagItemBean> onTagValueGetter;

  /// 是等分样式还是流式布局样式，[AuMultiSelectTagsLayoutStyle]，默认等分
  final AuMultiSelectTagsLayoutStyle layoutStyle;

  /// item的高度, 默认数值是34
  final double itemHeight;

  /// 操作类型属性
  late List<AuTagItemBean> _selectedTags;
  late List<AuTagItemBean> _sourceTags;

  @override
  void show() {
    _dataSetup();
    super.show();
  }

  @override
  Object getConfirmData() {
    return _selectedTags;
  }

  @override
  Widget createBuilder(BuildContext context, VoidCallback? onUpdate) {
    if (tagPickerConfig.tagItemSource.isNotEmpty) {
      return _buildContent(context, onUpdate);
    } else {
      return SizedBox(
        height: 200,
        child: Center(
          child: Text(AuIntl.of(context).localizedResource.noTagDataTip),
        ),
      );
    }
  }

  Widget _buildContent(BuildContext context, VoidCallback? onUpdate) {
    if (layoutStyle == AuMultiSelectTagsLayoutStyle.average) {
      return LayoutBuilder(
        builder: (_, constraints) {
          double maxWidth = constraints.maxWidth;
          return _buildGridViewWidget(context, onUpdate, maxWidth);
        },
      );
    } else {
      return _buildWrapViewWidget(context, onUpdate);
    }
  }

  ///等宽度的布局
  Widget _buildGridViewWidget(
      BuildContext context, VoidCallback? onUpdate, double maxWidth) {
    int brnCrossAxisCount =
        (crossAxisCount == null || crossAxisCount == 0)
            ? 4
            : crossAxisCount!;
    double width =
        (maxWidth - (brnCrossAxisCount - 1) * 12 - 40) / brnCrossAxisCount;
    //计算宽高比
    double brnChildAspectRatio = width / itemHeight;
    Color selectedTagTitleColor = tagPickerConfig.selectedTagTitleColor ??
        AuThemeConfigurator.instance.getConfig().commonConfig.brandPrimary;
    Color tagTitleColor = tagPickerConfig.tagTitleColor ??
        AuThemeConfigurator.instance
            .getConfig()
            .commonConfig
            .colorTextImportant;
    Color tagBackgroundColor =
        tagPickerConfig.tagBackgroudColor ?? const Color(0xffF8F8F8);
    Color selectedTagBackgroundColor =
        tagPickerConfig.selectedTagBackgroudColor ??
            AuThemeConfigurator.instance
                .getConfig()
                .commonConfig
                .brandPrimary
                .withAlpha(0x14);
    return Container(
      padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
      constraints: const BoxConstraints(maxHeight: 322, minHeight: 120),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: brnCrossAxisCount,
        //水平子Widget之间间距
        crossAxisSpacing: 6.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 12.0,
        //宽高比
        childAspectRatio: brnChildAspectRatio,
        //GridView内边距
        padding:
            const EdgeInsets.only(top: 20.0, left: 0.0, right: 0.0, bottom: 20.0),
        primary: true,
        children: _sourceTags.map((choice) {
          bool selected = choice.isSelect;
          Color titleColor = selected ? selectedTagTitleColor : tagTitleColor;
          EdgeInsets edgeInsets = tagPickerConfig.chipPadding ??
              const EdgeInsets.only(top: 9.0, left: 10.0, right: 10, bottom: 11.0);
          return ChoiceChip(
            selected: selected,
            padding: edgeInsets,
            pressElevation: 0,
            backgroundColor: tagBackgroundColor,
            selectedColor: selectedTagBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)),
            label: SizedBox(
              width: width,
              child: Text(
                onTagValueGetter(choice),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                strutStyle: const StrutStyle(forceStrutHeight: true, height: 1),
                style: TextStyle(
                    height: 1,
                    color: titleColor,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: tagPickerConfig.tagTitleFontSize),
              ),
            ),
            onSelected: (bool value) {
              if (_selectedTags.length >= maxSelectItemCount &&
                  maxSelectItemCount > 0 &&
                  value == true) {
                if (onMaxSelectClick != null) {
                  // ignore: unnecessary_statements
                  onMaxSelectClick!();
                }
                return;
              }
              _clickTag(value, choice);
              onUpdate!();
            },
          );
        }).toList(),
      ),
    );
  }

  ///流式布局
  Widget _buildWrapViewWidget(BuildContext context, VoidCallback? onUpdate) {
    AuTagConfig tagConfig = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .tagConfig
        .merge(AuTagConfig());
    tagConfig = tagConfig.merge(AuTagConfig(
        selectTagTextStyle: AuTextStyle(
            height: 1,
            color: tagPickerConfig.selectedTagTitleColor,
            fontSize: tagPickerConfig.tagTitleFontSize,
            fontWeight: FontWeight.w600),
        tagTextStyle: AuTextStyle(
            height: 1,
            color: tagPickerConfig.tagTitleColor,
            fontSize: tagPickerConfig.tagTitleFontSize,
            fontWeight: FontWeight.w400),
        tagBackgroundColor: tagPickerConfig.tagBackgroudColor,
        selectedTagBackgroundColor:
            tagPickerConfig.selectedTagBackgroudColor));

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Wrap(
          spacing: 15.0,
          runSpacing: 15.0,
          children: _sourceTags.map((choice) {
            bool selected = choice.isSelect;
            Color titleColor = selected
                ? tagConfig.selectTagTextStyle.color!
                : tagConfig.tagTextStyle.color!;
            EdgeInsets edgeInsets = tagPickerConfig.chipPadding ??
                const EdgeInsets.only(top: 9.0, left: 10.0, right: 10, bottom: 11.0);
            return ChoiceChip(
              selected: selected,
              padding: edgeInsets,
              pressElevation: 0,
              backgroundColor: tagConfig.tagBackgroundColor,
              selectedColor: tagConfig.selectedTagBackgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              label: Text(
                onTagValueGetter(choice),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                strutStyle: const StrutStyle(forceStrutHeight: true, height: 1),
                style: TextStyle(
                    height: 1,
                    color: titleColor,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: tagPickerConfig.tagTitleFontSize),
              ),
              onSelected: (bool value) {
                if (_selectedTags.length >= maxSelectItemCount &&
                    maxSelectItemCount > 0 &&
                    value == true) {
                  if (onMaxSelectClick != null) {
                    // ignore: unnecessary_statements
                    onMaxSelectClick!();
                  }
                  return;
                }
                _clickTag(value, choice);
                onUpdate!();
              },
            );
          }).toList(),
        ));
  }

  void _dataSetup() {
    List<AuTagItemBean> tagItems = [];
    List<AuTagItemBean> tagSelectItems = [];
    for (AuTagItemBean item in tagPickerConfig.tagItemSource) {
      tagItems.add(item);
      //选中的按钮
      if (item.isSelect == true) {
        tagSelectItems.add(item);
      }
    }
    _sourceTags = tagItems;

    // 默认选中tags
    _selectedTags = tagSelectItems;
  }

  ///每一个item的点击事件
  void _clickTag(bool selected, AuTagItemBean tagName) {
    if (selected) {
      tagName.isSelect = true;
      _selectedTags.add(tagName);
    } else {
      tagName.isSelect = false;
      _selectedTags.remove(tagName);
    }

    ///点击tag
    if (onItemClick != null) {
      onItemClick!(tagName, selected);
    }
  }
}
