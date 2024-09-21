import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:flutter/material.dart';

/// AuIconButton组件，基于【AuIconButton组件】图文组合组件
/// 为了解决icon和文字组合的问题
/// 图文的方向 bottom、文字在下 icon在上 top、文字在上 icon在下
/// Left、文字在左 icon在右 right、文字在右 icon在左
enum Direction {
  /// 文字在左边
  left,

  /// 文字在右边
  right,

  /// 文字在上边
  top,

  /// 文字在下边
  bottom,
}

class AuIconButton extends StatefulWidget {
  /// icon的文案
  final String name;

  /// 需要传的icon
  final Widget? iconWidget;

  /// 点击的回调
  final VoidCallback? onTap;

  /// 文字相对于图片的位置
  final Direction direction;

  /// 图片宽度，默认 24
  final double iconWidth;

  /// 图片高度，默认 24
  final double iconHeight;

  ///  文字样式
  final TextStyle? style;

  /// 图文组合的宽度，默认 80
  final double widgetWidth;

  /// 图文组合的高度，默认 80
  final double widgetHeight;

  /// 文字和图片的间距，默认 4
  final double padding;

  /// 图文对齐方式，默认 MainAxisAlignment.center
  final MainAxisAlignment mainAxisAlignment;

  /// create AuIconButton
  const AuIconButton({
    super.key,
    required this.name,
    this.iconWidget,
    this.onTap,
    this.iconWidth = 24,
    this.iconHeight = 24,
    this.widgetWidth = 80,
    this.widgetHeight = 80,
    this.direction = Direction.top,
    this.padding = 4,
    this.style,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  _AuIconButtonState createState() => _AuIconButtonState();
}

class _AuIconButtonState extends State<AuIconButton> {
  @override
  Widget build(BuildContext context) {
    SizedBox ctn;
    // 图文的方向 bottom、文字在下 icon在上 top、文字在上 icon在下
    // Left、文字在左 icon在右 right、文字在右 icon在左
    if (widget.direction == Direction.bottom) {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Column(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // 图片
              SizedBox(
                height: widget.iconHeight,
                width: widget.iconWidth,
                child: FittedBox(fit: BoxFit.contain, child: widget.iconWidget),
              ),
              Padding(
                padding: EdgeInsets.only(top: widget.padding),
                child: Text(
                  widget.name,
                  style: widget.style ??
                      TextStyle(
                        color: AuThemeConfigurator.instance
                            .getConfig()
                            .commonConfig
                            .colorTextSecondary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ));
    } else if (widget.direction == Direction.left) {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // 图片
              SizedBox(
                  height: widget.iconHeight,
                  width: widget.iconWidth,
                  child: widget.iconWidget),
              Padding(
                padding: EdgeInsets.only(left: widget.padding),
                child: Text(
                  widget.name,
                  style: widget.style ??
                      TextStyle(
                        color: AuThemeConfigurator.instance
                            .getConfig()
                            .commonConfig
                            .colorTextSecondary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ));
    } else if (widget.direction == Direction.right) {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: widget.padding),
                child: Text(
                  widget.name,
                  style: widget.style ??
                      TextStyle(
                        color: AuThemeConfigurator.instance
                            .getConfig()
                            .commonConfig
                            .colorTextSecondary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // 图片
              SizedBox(
                  height: widget.iconHeight,
                  width: widget.iconWidth,
                  child: widget.iconWidget),
            ],
          ));
    } else {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Column(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: widget.padding),
                child: Text(
                  widget.name,
                  style: widget.style ??
                      TextStyle(
                        color: AuThemeConfigurator.instance
                            .getConfig()
                            .commonConfig
                            .colorTextSecondary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // 图片
              SizedBox(
                height: widget.iconHeight,
                width: widget.iconWidth,
                child: widget.iconWidget,
              ),
            ],
          ));
    }

    if (widget.onTap != null) {
      return GestureDetector(
        child: ctn,
        onTap: () {
          widget.onTap!();
        },
      );
    }
    return ctn;
  }
}
