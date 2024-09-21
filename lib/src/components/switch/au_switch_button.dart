import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:flutter/material.dart';

import 'au_switch_button_base.dart';

/// 描述: 开关按钮
class AuSwitchButton extends StatefulWidget {
  final Size size;

  ///选中的状态
  final bool value;

  ///是否可以交互
  final bool enabled;

  ///点击事件
  final ValueChanged<bool> onChanged;

  ///未选中时边框的颜色
  final Color? borderColor;

  const AuSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.size = const Size(42, 26),
    this.borderColor,
  });

  @override
  _AuSwitchButtonState createState() => _AuSwitchButtonState();
}

class _AuSwitchButtonState extends State<AuSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return AuBaseSwitchButton(
      borderColor: widget.borderColor ?? _getBorderColor(),
      value: widget.value,
      enabled: widget.enabled,
      size: widget.size,
      trackColor: _getTrackColor(),
      thumbColor: widget.enabled ? Colors.white : const Color(0xFFFDFDFD),
      onChanged: widget.enabled ? widget.onChanged : null,
    );
  }

  Color _getTrackColor() {
    if (widget.value) {
      return widget.enabled
          ? AuThemeConfigurator.instance.getConfig().commonConfig.brandPrimary
          : AuThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .brandPrimary
              .withAlpha(20);
    } else {
      return widget.enabled ? const Color(0xFFFAFAFA) : const Color(0xFFeeeeee);
    }
  }

  Color _getBorderColor() {
    if (widget.value) {
      return _getTrackColor();
    } else {
      if (widget.enabled) {
        return const Color(0xffeeeeee);
      } else {
        return const Color(0xffeeeeee);
      }
    }
  }
}
