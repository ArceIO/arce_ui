import 'package:arce_ui/src/components/line/au_line.dart';
import 'package:arce_ui/src/components/picker/base/au_picker_constants.dart';
import 'package:arce_ui/src/components/picker/base/au_picker_title.dart';
import 'package:arce_ui/src/components/picker/base/au_picker_title_config.dart';
import 'package:arce_ui/src/components/picker/au_picker_cliprrect.dart';
import 'package:arce_ui/src/components/picker/multi_select_bottom_picker/au_multi_select_data.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:flutter/material.dart';

/// 点击确定时的回调
/// [checkedItems] 被选中的 item 集合
typedef AuMultiSelectListPickerSubmit<T> = void Function(List<T> checkedItems);

/// item 被点击时的回调
/// [index] item 的索引
typedef AuMultiSelectListPickerItemClick = void Function(
    BuildContext context, int index);

/// 多选列表 Picker

class AuMultiSelectListPicker<T extends AuMultiSelectBottomPickerItem>
    extends StatefulWidget {
  final String? title;
  final List<T> items;
  final AuMultiSelectListPickerSubmit<T>? onSubmit;
  final VoidCallback? onCancel;
  final AuMultiSelectListPickerItemClick? onItemClick;
  final AuPickerTitleConfig pickerTitleConfig;

  static void show<T extends AuMultiSelectBottomPickerItem>(
    BuildContext context, {
    required List<T> items,
    AuMultiSelectListPickerSubmit<T>? onSubmit,
    VoidCallback? onCancel,
    AuMultiSelectListPickerItemClick? onItemClick,
    AuPickerTitleConfig pickerTitleConfig = AuPickerTitleConfig.Default,
    bool isDismissible = true,
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (BuildContext dialogContext) {
        return AuMultiSelectListPicker<T>(
          items: items,
          onSubmit: onSubmit,
          onCancel: onCancel,
          onItemClick: onItemClick,
          pickerTitleConfig: pickerTitleConfig,
        );
      },
    );
  }

  const AuMultiSelectListPicker({
    super.key,
    this.title,
    required this.items,
    this.pickerTitleConfig = AuPickerTitleConfig.Default,
    this.onSubmit,
    this.onCancel,
    this.onItemClick,
  });

  @override
  State<StatefulWidget> createState() {
    return MultiSelectDialogWidgetState<T>();
  }
}

class MultiSelectDialogWidgetState<T extends AuMultiSelectBottomPickerItem>
    extends State<AuMultiSelectListPicker<T>> {
  @override
  Widget build(BuildContext context) {
    return AuPickerClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
            AuThemeConfigurator.instance.getConfig().pickerConfig.cornerRadius),
        topRight: Radius.circular(
            AuThemeConfigurator.instance.getConfig().pickerConfig.cornerRadius),
      ),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Offstage(
                  offstage: !widget.pickerTitleConfig.showTitle,
                  child: AuPickerTitle(
                    pickerTitleConfig: widget.pickerTitleConfig,
                    onConfirm: () {
                      List<T> selectedItems = [];
                      if (widget.onSubmit != null) {
                        for (int i = 0; i < widget.items.length; i++) {
                          if (widget.items[i].isChecked) {
                            selectedItems.add(widget.items[i]);
                          }
                        }
                        if (widget.onSubmit != null) {
                          widget.onSubmit!(selectedItems);
                        }
                      }
                    },
                    onCancel: widget.onCancel ??
                        () {
                          Navigator.of(context).pop();
                        },
                  ),
                ),
                LimitedBox(
                    maxWidth: double.infinity,
                    maxHeight: pickerHeight,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            _buildItem(context, index),
                        itemCount: widget.items.length)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            widget.items[index].isChecked = !widget.items[index].isChecked;
          });
          if (widget.onItemClick != null) {
            widget.onItemClick!(context, index);
          }
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(widget.items[index].content,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: widget.items[index].isChecked
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: widget.items[index].isChecked
                                  ? AuThemeConfigurator.instance
                                      .getConfig()
                                      .commonConfig
                                      .brandPrimary
                                  : AuThemeConfigurator.instance
                                      .getConfig()
                                      .commonConfig
                                      .colorTextBase))),
                  Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: widget.items[index].isChecked
                          ? BrunoTools.getAssetImageWithBandColor(
                              AuAsset.iconMultiSelected)
                          : BrunoTools.getAssetImage(AuAsset.iconUnSelect)),
                ],
              ),
            ),
            index != widget.items.length - 1
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child: AuLine())
                : const SizedBox.shrink()
          ],
        ));
  }
}
