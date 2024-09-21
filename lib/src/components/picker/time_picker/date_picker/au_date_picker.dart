import 'package:arce_ui/src/components/picker/base/au_picker_title_config.dart';
import 'package:arce_ui/src/components/picker/au_picker_cliprrect.dart';
import 'package:arce_ui/src/components/picker/time_picker/au_date_picker_constants.dart';
import 'package:arce_ui/src/components/picker/time_picker/au_date_time_formatter.dart';
import 'package:arce_ui/src/components/picker/time_picker/date_picker/au_date_widget.dart';
import 'package:arce_ui/src/components/picker/time_picker/date_picker/au_datetime_widget.dart';
import 'package:arce_ui/src/components/picker/time_picker/date_picker/au_time_widget.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:arce_ui/src/utils/i18n/au_date_picker_i18n.dart';
import 'package:flutter/material.dart';

///时间选择模式枚举
enum AuDateTimePickerMode {
  /// Display DatePicker
  date,

  /// Display TimePicker
  time,

  /// Display DateTimePicker
  datetime,
}

class AuDatePicker {
  /// Display date picker in bottom sheet.
  ///
  /// context: [BuildContext]
  /// minDateTime: [DateTime] minimum date time
  /// maxDateTime: [DateTime] maximum date time
  /// initialDateTime: [DateTime] initial date time for selected
  /// dateFormat: [String] date format pattern
  /// locale: [DateTimePickerLocale] internationalization
  /// pickerMode: [AuDateTimePickerMode] display mode: date(DatePicker)、time(TimePicker)、datetime(DateTimePicker)
  /// pickerTheme: [AuPickerTitleConfig] the theme of date time picker
  /// onCancel: [DateVoidCallback] pressed title cancel widget event
  /// onClose: [DateVoidCallback] date picker closed event
  /// onChange: [DateValueCallback] selected date time changed event
  /// onConfirm: [DateValueCallback] pressed title confirm widget event
  static void showDatePicker(
    BuildContext context, {
    /// If rootNavigator is set to true, the state from the furthest instance of this class is given instead.
    /// Useful for pushing contents above all subsequent instances of [Navigator].
    bool rootNavigator = false,

    /// 点击弹框外部区域能否消失
    bool? canBarrierDismissible,

    /// 能滚动到的最小日期
    DateTime? minDateTime,

    /// 能滚动到的最大日期
    DateTime? maxDateTime,

    /// 初始选择的时间。默认当前时间
    DateTime? initialDateTime,

    /// 时间格式化的格式
    String? dateFormat,

    /// 分钟间切换的差值
    int minuteDivider = 1,

    /// 时间选择组件显示的时间类型
    AuDateTimePickerMode pickerMode = AuDateTimePickerMode.date,

    /// 时间选择组件的主题样式
    AuPickerTitleConfig pickerTitleConfig = AuPickerTitleConfig.Default,

    /// 点击【取消】回调给调用方的回调事件
    DateVoidCallback? onCancel,

    /// 弹框点击外围消失的回调事件
    DateVoidCallback? onClose,

    /// 时间滚动选择时候的回调事件
    DateValueCallback? onChange,

    /// 点击【完成】回调给调用方的数据
    DateValueCallback? onConfirm,
    AuPickerConfig? themeData,
  }) {
    // handle the range of datetime
    minDateTime ??= DateTime.parse(datePickerMinDatetime);
    maxDateTime ??= DateTime.parse(datePickerMaxDatetime);

    // handle initial DateTime
    initialDateTime ??= DateTime.now();

    // Set value of date format
    dateFormat = DateTimeFormatter.generateDateFormat(dateFormat, pickerMode);

    Navigator.of(context, rootNavigator: rootNavigator)
        .push(
          _DatePickerRoute(
            canBarrierDismissible: canBarrierDismissible,
            minDateTime: minDateTime,
            maxDateTime: maxDateTime,
            initialDateTime: initialDateTime,
            dateFormat: dateFormat,
            minuteDivider: minuteDivider,
            pickerMode: pickerMode,
            pickerTitleConfig: pickerTitleConfig,
            onCancel: onCancel,
            onChange: onChange,
            onConfirm: onConfirm,
            theme: Theme.of(context),
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            themeData: themeData,
          ),
        )
        .whenComplete(onClose ?? () {});
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.minDateTime,
    this.maxDateTime,
    this.initialDateTime,
    this.minuteDivider,
    this.dateFormat,
    this.pickerMode = AuDateTimePickerMode.date,
    this.pickerTitleConfig = AuPickerTitleConfig.Default,
    this.onCancel,
    this.onChange,
    this.onConfirm,
    this.theme,
    this.barrierLabel,
    this.canBarrierDismissible,
    super.settings,
    this.themeData,
  }) {
    this.themeData ??= AuPickerConfig();
    this.themeData = AuThemeConfigurator.instance
        .getConfig(configId: this.themeData!.configId)
        .pickerConfig
        .merge(this.themeData);
  }

  final DateTime? minDateTime, maxDateTime, initialDateTime;
  final String? dateFormat;
  final AuDateTimePickerMode pickerMode;
  final AuPickerTitleConfig pickerTitleConfig;
  final VoidCallback? onCancel;
  final DateValueCallback? onChange;
  final DateValueCallback? onConfirm;
  bool? canBarrierDismissible;
  final int? minuteDivider;
  final ThemeData? theme;
  AuPickerConfig? themeData;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => canBarrierDismissible ?? true;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    double height = themeData!.pickerHeight;
    if (pickerTitleConfig.title != null || pickerTitleConfig.showTitle) {
      height += themeData!.titleHeight;
    }

    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponent(route: this, pickerHeight: height),
    );

    if (theme != null) {
      bottomSheet = Theme(data: theme!, child: bottomSheet);
    }
    return bottomSheet;
  }
}

// ignore: must_be_immutable
class _DatePickerComponent extends StatelessWidget {
  final _DatePickerRoute route;
  final double _pickerHeight;

  const _DatePickerComponent({required this.route, required pickerHeight})
      : _pickerHeight = pickerHeight;

  @override
  Widget build(BuildContext context) {
    Widget? pickerWidget;
    switch (route.pickerMode) {
      case AuDateTimePickerMode.date:
        pickerWidget = AuDateWidget(
          minDateTime: route.minDateTime,
          maxDateTime: route.maxDateTime,
          initialDateTime: route.initialDateTime,
          dateFormat: route.dateFormat,
          pickerTitleConfig: route.pickerTitleConfig,
          onCancel: route.onCancel,
          onChange: route.onChange,
          onConfirm: route.onConfirm,
          themeData: route.themeData,
        );
        break;
      case AuDateTimePickerMode.time:
        pickerWidget = AuTimeWidget(
          minDateTime: route.minDateTime,
          maxDateTime: route.maxDateTime,
          initDateTime: route.initialDateTime,
          dateFormat: route.dateFormat,
          minuteDivider: route.minuteDivider,
          pickerTitleConfig: route.pickerTitleConfig,
          onCancel: route.onCancel,
          onChange: route.onChange,
          onConfirm: route.onConfirm,
          themeData: route.themeData,
        );
        break;
      case AuDateTimePickerMode.datetime:
        pickerWidget = AuDateTimeWidget(
          minDateTime: route.minDateTime,
          maxDateTime: route.maxDateTime,
          initDateTime: route.initialDateTime,
          dateFormat: route.dateFormat,
          minuteDivider: route.minuteDivider,
          pickerTitleConfig: route.pickerTitleConfig,
          onCancel: route.onCancel,
          onChange: route.onChange,
          onConfirm: route.onConfirm,
          themeData: route.themeData,
        );
        break;
    }
    return GestureDetector(
      child: AnimatedBuilder(
        animation: route.animation!,
        builder: (BuildContext context, Widget? child) {
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate:
                  _BottomPickerLayout(route.animation!.value, _pickerHeight),
              child: AuPickerClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(route.themeData!.cornerRadius),
                  topRight: Radius.circular(route.themeData!.cornerRadius),
                ),
                child: pickerWidget,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, this.contentHeight);

  final double progress;
  final double contentHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: contentHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
