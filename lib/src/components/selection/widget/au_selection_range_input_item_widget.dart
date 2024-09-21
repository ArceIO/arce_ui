import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:arce_ui/src/theme/configs/au_selection_config.dart';
import 'package:arce_ui/src/utils/au_event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef RangeChangedCallback = void Function(String minInput, String maxInput);

/// 清空自定义范围输入框焦点的事件类
class ClearSelectionFocusEvent {}

/// 筛选的范围输入子组件
class AuSelectionRangeItemWidget extends StatefulWidget {
  final AuSelectionEntity item;

  /// 范围输入框的回调
  final RangeChangedCallback? onRangeChanged;

  /// 输入框焦点的回调
  final ValueChanged<bool>? onFocusChanged;

  /// 是否清空输入框的文本
  final bool isShouldClearText;

  /// 最小值输入框的控制器
  final TextEditingController minTextEditingController;

  /// 最大值输入框的控制器
  final TextEditingController maxTextEditingController;

  /// 主题配置
  final AuSelectionConfig themeData;

  const AuSelectionRangeItemWidget({
    super.key,
    required this.item,
    required this.minTextEditingController,
    required this.maxTextEditingController,
    this.isShouldClearText = false,
    this.onRangeChanged,
    this.onFocusChanged,
    required this.themeData,
  });

  @override
  _AuSelectionRangeItemWidgetState createState() =>
      _AuSelectionRangeItemWidgetState();
}

class _AuSelectionRangeItemWidgetState
    extends State<AuSelectionRangeItemWidget> {
  final FocusNode _minFocusNode = FocusNode();
  final FocusNode _maxFocusNode = FocusNode();

  @override
  void initState() {
    widget.minTextEditingController.text =
        (widget.item.customMap != null && widget.item.customMap!['min'] != null)
            ? widget.item.customMap!['min']?.toString() ?? ''
            : '';
    widget.maxTextEditingController.text =
        (widget.item.customMap != null && widget.item.customMap!['max'] != null)
            ? widget.item.customMap!['max']?.toString() ?? ''
            : '';

    //输入框焦点
    _minFocusNode.addListener(() {
      if (widget.onFocusChanged != null) {
        widget
            .onFocusChanged!(_minFocusNode.hasFocus || _maxFocusNode.hasFocus);
      }
    });

    _maxFocusNode.addListener(() {
      if (widget.onFocusChanged != null) {
        widget
            .onFocusChanged!(_minFocusNode.hasFocus || _maxFocusNode.hasFocus);
      }
    });

    widget.minTextEditingController.addListener(() {
      String minInput = widget.minTextEditingController.text;

      widget.item.customMap ??= {};
      widget.item.customMap!['min'] = minInput;
      widget.item.isSelected = true;
    });

    widget.maxTextEditingController.addListener(() {
      String maxInput = widget.maxTextEditingController.text;
      widget.item.customMap ??= {};
      widget.item.customMap!['max'] = maxInput;
      widget.item.isSelected = true;
    });

    EventBus.instance
        .on<ClearSelectionFocusEvent>()
        .listen((ClearSelectionFocusEvent event) {
      _minFocusNode.unfocus();
      _maxFocusNode.unfocus();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "${widget.item.title.isNotEmpty
                        ? widget.item.title
                        : AuIntl.of(context).localizedResource.customRange}(${widget.item.extMap['unit']?.toString() ?? ''})",
                textAlign: TextAlign.left,
                style: widget.themeData.rangeTitleTextStyle.generateTextStyle(),
              ),
            ),
            Row(
              children: <Widget>[
                getRangeTextField(false),
                Container(
                  child: Text(
                    AuIntl.of(context).localizedResource.to,
                    style: widget.themeData.inputTextStyle.generateTextStyle(),
                  ),
                ),
                getRangeTextField(true),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getRangeTextField(bool isMax) {
    return Expanded(
      child: TextFormField(
        style: widget.themeData.inputTextStyle.generateTextStyle(),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: const TextInputType.numberWithOptions(),
        onChanged: (input) {
          widget.item.isSelected = true;
        },
        focusNode: isMax ? _maxFocusNode : _minFocusNode,
        controller: isMax
            ? widget.maxTextEditingController
            : widget.minTextEditingController,
        cursorColor: widget.themeData.commonConfig.brandPrimary,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintStyle: widget.themeData.hintTextStyle.generateTextStyle(),
          hintText: (isMax
              ? AuIntl.of(context).localizedResource.maxValue
              : AuIntl.of(context).localizedResource.minValue),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: widget.themeData.commonConfig.dividerColorBase,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: widget.themeData.commonConfig.dividerColorBase,
          )),
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
