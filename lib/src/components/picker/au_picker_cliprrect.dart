import 'package:flutter/widgets.dart';

/// Picker 顶端 圆角装饰类，参考系统 [ClipRRect]，
/// [borderRadius] 默认值为 BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
class AuPickerClipRRect extends ClipRRect {
  const AuPickerClipRRect({
    super.key,
    BorderRadius super.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    ),
    super.child,
  });
}
