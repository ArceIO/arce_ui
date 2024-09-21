import 'package:arce_ui/src/components/picker/base/au_picker_constants.dart';
import 'package:flutter/material.dart';

class AuPickerTitleConfig {
  /// DateTimePicker theme.
  ///
  /// [cancel] Custom cancel widget.
  /// [confirm] Custom confirm widget.
  /// [title] Custom title widget. If specify a title widget, the cancel and confirm widgets will not display. Must set [titleHeight] value for custom title widget.
  /// [showTitle] Whether display title widget or not. If set false, the default cancel and confirm widgets will not display, but the custom title widget will display if had specified one custom title widget.
  /// [titleContent] Title content
  const AuPickerTitleConfig({
    this.cancel,
    this.confirm,
    this.title,
    this.showTitle = pickerShowTitleDefault,
    this.titleContent,
  });

  static const AuPickerTitleConfig Default = AuPickerTitleConfig();

  /// Custom cancel [Widget].
  final Widget? cancel;

  /// Custom confirm [Widget].
  final Widget? confirm;

  /// Custom title [Widget]. If specify a title widget, the cancel and confirm widgets will not display.
  final Widget? title;

  /// Whether display title widget or not. If set false, the default cancel and confirm widgets will not display, but the custom title widget will display if had specified one custom title widget.
  final bool showTitle;

  final String? titleContent;

  AuPickerTitleConfig copyWith({
    Widget? cancel,
    Widget? confirm,
    Widget? title,
    bool? showTitle,
    String? titleContent,
  }) {
    return AuPickerTitleConfig(
      cancel: cancel ?? this.cancel,
      confirm: confirm ?? this.confirm,
      title: title ?? this.title,
      showTitle: showTitle ?? this.showTitle,
      titleContent: titleContent ?? this.titleContent,
    );
  }
}
