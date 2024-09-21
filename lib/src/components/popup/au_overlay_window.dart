import 'dart:core';
import 'dart:math';

import 'package:arce_ui/src/components/popup/au_measure_size.dart';
import 'package:flutter/material.dart';

/// popWindow位于targetView的方向
enum AuOverlayPopDirection { none, top, bottom, left, right }

/// * 描述: Overlay 工具类。
class AuOverlayWindow extends StatefulWidget {
  final BuildContext context;

  /// 锚点 Widget 的 key，用于 OverlayWindow 的定位
  final GlobalKey targetKey;

  /// OverlayWindow 相对于 key 的展示位置， 默认 bottom
  final AuOverlayPopDirection popDirection;

  /// 要展示的内容
  final Widget content;

  const AuOverlayWindow({super.key, 
    required this.context,
    required this.targetKey,
    this.popDirection = AuOverlayPopDirection.bottom,
    this.content = const SizedBox.shrink(),
  });

  @override
  State<StatefulWidget> createState() {
    return _AuOverlayWindowState();
  }

  /// AuOverlayWindow 工具方发，用于快速弹出 Overlay，
  /// 返回 [AuOverlayController] 用于控制 Overlaywindow 的隐藏
  /// [targetKey] 锚点 Widget 的 key，用于 OverlayWindow 的定位
  /// [popDirection] OverlayWindow 相对于 key 的展示位置， 默认 bottom
  /// [content] 要展示的内容
  /// [autoDismissOnTouchOutSide] 点击 OverlayWindow 外部是否自动消失，默认为 true
  /// [onDismiss] OverlayWindow 消失回调
  static AuOverlayController? showOverlayWindow(
      BuildContext context, GlobalKey? targetKey,
      {Widget? content,
      AuOverlayPopDirection popDirection = AuOverlayPopDirection.bottom,
      bool autoDismissOnTouchOutSide = true,
      Function? onDismiss}) {
    assert(content != null);
    assert(targetKey != null);
    assert(content != null);

    if (content == null || targetKey == null) return null;

    AuOverlayController? overlayController;
    OverlayEntry entry = OverlayEntry(builder: (context) {
      return GestureDetector(
          behavior: (autoDismissOnTouchOutSide)
              ? HitTestBehavior.opaque
              : HitTestBehavior.deferToChild,
          onTap: (autoDismissOnTouchOutSide)
              ? () {
                  overlayController?.removeOverlay();
                  if (onDismiss != null) {
                    onDismiss();
                  }
                }
              : null,
          child: AuOverlayWindow(
            context: context,
            content: content,
            targetKey: targetKey,
            popDirection: popDirection,
          ));
    });

    overlayController = AuOverlayController._(context, entry)..showOverlay();
    return overlayController;
  }
}

class _AuOverlayWindowState extends State<AuOverlayWindow> {
  /// targetView的位置
  Rect? _showRect;

  /// 屏幕的尺寸
  late Size _screenSize;

  /// overlay 在targetView 四周的偏移位置
  double _left = 0;
  double _right = 0;
  double _top = 0;
  double _bottom = 0;

  /// targetView 的 Size
  Size _targetViewSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    _showRect = _getWidgetGlobalRect(widget.targetKey);
    _screenSize =
        View.of(context).physicalSize / View.of(context).devicePixelRatio;
    if (_showRect == null) {
      return const SizedBox.shrink();
    }
    _calculateOffset(_showRect!);
    return _buildContent(_showRect!);
  }

  Widget _buildContent(Rect showRect) {
    var contentPart = Material(
        color: Colors.transparent,
        child: MeasureSize(
            onChange: (size) {
              setState(() {
                _targetViewSize = size;
              });
            },
            child: widget.content));
    var placeHolderPart = GestureDetector();
    Widget realContent;

    double marginTop =
        showRect.top + (showRect.height - _targetViewSize.height) / 2;
    if (_screenSize.height - marginTop < _targetViewSize.height) {
      marginTop = max(0, _screenSize.height - _targetViewSize.height);
    }
    marginTop = max(0, marginTop);

    double marginLeft =
        showRect.left + (showRect.width - _targetViewSize.width) / 2;
    if (_screenSize.width - marginLeft < _targetViewSize.width) {
      marginLeft = max(0, _screenSize.width - _targetViewSize.width);
    }
    marginLeft = max(0, marginLeft);

    if (widget.popDirection == AuOverlayPopDirection.left) {
      realContent = Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: _left.toInt(),
            child: Container(
                padding: EdgeInsets.only(top: marginTop),
                alignment: Alignment.topRight,
                child: contentPart),
          ),
          Expanded(
            flex: (_screenSize.width - _left).toInt(),
            child: placeHolderPart,
          )
        ],
      );
    } else if (widget.popDirection == AuOverlayPopDirection.right) {
      realContent = Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: (_right).toInt(),
            child: placeHolderPart,
          ),
          Expanded(
            flex: (_screenSize.width - _right).toInt(),
            child: Container(
                padding: EdgeInsets.only(top: marginTop),
                alignment: Alignment.topLeft,
                child: contentPart),
          )
        ],
      );
    } else if (widget.popDirection == AuOverlayPopDirection.top) {
      realContent = Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: _top.toInt(),
            child: Container(
                padding: EdgeInsets.only(top: marginLeft),
                alignment: Alignment.bottomLeft,
                child: contentPart),
          ),
          Expanded(
            flex: (_screenSize.height - _top).toInt(),
            child: placeHolderPart,
          )
        ],
      );
    } else {
      realContent = Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: _bottom.toInt(),
            child: placeHolderPart,
          ),
          Expanded(
            flex: (_screenSize.height - _bottom).toInt(),
            child: Container(alignment: Alignment.topLeft, child: contentPart),
          )
        ],
      );
    }
    return realContent;
  }

  ///
  /// 获取targetView的位置
  ///
  Rect? _getWidgetGlobalRect(GlobalKey key) {
    BuildContext? ctx = key.currentContext;
    RenderObject? obj;
    if (ctx != null) {
      obj = ctx.findRenderObject();
    }
    if (obj != null && obj is RenderBox) {
      RenderBox renderBox = obj;
      var offset = renderBox.localToGlobal(Offset.zero);
      return Rect.fromLTWH(
          offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
    }
    return null;
  }

  ///
  /// 计算popUpWindow显示的位置
  ///
  void _calculateOffset(Rect showRect) {
    if (widget.popDirection == AuOverlayPopDirection.left) {
      _left = showRect.left;
    } else if (widget.popDirection == AuOverlayPopDirection.right) {
      _right = showRect.right;
    } else if (widget.popDirection == AuOverlayPopDirection.bottom) {
      _bottom = showRect.bottom;
    } else if (widget.popDirection == AuOverlayPopDirection.top) {
      // 在targetView上方
      _top = showRect.top;
    }
  }
}

/// [OverlayWindow] 组件展示隐藏控制器
class AuOverlayController {
  OverlayEntry? _entry;

  BuildContext context;
  bool _isOverlayShowing = false;

  bool get isOverlayShowing => _isOverlayShowing;

  AuOverlayController._(this.context, this._entry);

  /// 显示OverlayWindow
  showOverlay() {
    if (_entry != null) {
      Overlay.of(context).insert(_entry!);
      _isOverlayShowing = true;
    }
  }

  /// 移除OverlayWindow
  void removeOverlay() {
    _entry?.remove();
    _entry = null;
    _isOverlayShowing = false;
  }
}
