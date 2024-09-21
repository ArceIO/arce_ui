import 'package:arce_ui/src/components/picker/base/au_picker_title_config.dart';
import 'package:arce_ui/src/components/picker/time_picker/au_date_picker_constants.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:flutter/material.dart';

/// DatePicker's title widget.
// ignore: must_be_immutable
class AuPickerTitle extends StatelessWidget {
  final AuPickerTitleConfig pickerTitleConfig;
  final DateVoidCallback onCancel, onConfirm;
  AuPickerConfig? themeData;

  AuPickerTitle({
    super.key,
    required this.onCancel,
    required this.onConfirm,
    this.pickerTitleConfig = AuPickerTitleConfig.Default,
    this.themeData,
  }) {
    themeData ??= AuPickerConfig();
    themeData = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .pickerConfig
        .merge(themeData);
  }

  @override
  Widget build(BuildContext context) {
    if (pickerTitleConfig.title != null) {
      return pickerTitleConfig.title!;
    }
    return Container(
      height: themeData!.titleHeight,
      decoration: ShapeDecoration(
        color: themeData!.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(themeData!.cornerRadius),
            topRight: Radius.circular(themeData!.cornerRadius),
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: themeData!.titleHeight - 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: themeData!.titleHeight,
                    alignment: Alignment.center,
                    child: _renderCancelWidget(context),
                  ),
                  onTap: () {
                    onCancel();
                  },
                ),
                Text(
                  pickerTitleConfig.titleContent ??
                      AuIntl.of(context).localizedResource.pleaseChoose,
                  style: themeData!.titleTextStyle.generateTextStyle(),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: themeData!.titleHeight,
                    alignment: Alignment.center,
                    child: _renderConfirmWidget(context),
                  ),
                  onTap: () {
                    onConfirm();
                  },
                ),
              ],
            ),
          ),
          Divider(
            color: themeData!.dividerColor,
            indent: 0.0,
            height: 0.5,
          ),
        ],
      ),
    );
  }

  /// render cancel button widget
  Widget _renderCancelWidget(BuildContext context) {
    Widget? cancelWidget = pickerTitleConfig.cancel;
    if (cancelWidget == null) {
      TextStyle textStyle = themeData!.cancelTextStyle.generateTextStyle();
      cancelWidget = Text(
        AuIntl.of(context).localizedResource.cancel,
        style: textStyle,
        textAlign: TextAlign.left,
      );
    }
    return cancelWidget;
  }

  /// render confirm button widget
  Widget _renderConfirmWidget(BuildContext context) {
    Widget? confirmWidget = pickerTitleConfig.confirm;
    if (confirmWidget == null) {
      TextStyle textStyle = themeData!.confirmTextStyle.generateTextStyle();
      confirmWidget = Text(
        AuIntl.of(context).localizedResource.done,
        style: textStyle,
        textAlign: TextAlign.right,
      );
    }
    return confirmWidget;
  }
}
