import 'package:arce_ui/src/components/appraise/au_flutter_gif_image.dart';
import 'package:arce_ui/src/constants/au_strings_constants.dart';
import 'package:flutter/material.dart';

/// 评价组件单个表情包gif图

/// 表情点击的回调
/// index 点击的表情的index
typedef AuAppraiseEmojiClickCallback = void Function(int index);

class AuAppraiseEmojiItem extends StatefulWidget {
  /// 加载的gif图名称,传入asserts/image 全路径
  final String selectedName;

  /// 未选中的图片,传入asserts/image 全路径
  final String unselectedName;

  /// 默认图片,传入asserts/image 全路径
  final String defaultName;

  /// 表情所在的 index
  final int index;

  /// 选中的的 index
  final int selectedIndex;

  /// 表情图片下面的说明
  final String? title;

  /// 加载的 gif 图帧数，默认 24
  final double frameCount;

  /// 点击的回调
  final AuAppraiseEmojiClickCallback? onTap;

  /// item的padding，默认 EdgeInsets.only(horizontal: 7)
  final EdgeInsets padding;

  /// create AuAppraiseEmojiItem
  const AuAppraiseEmojiItem(
      {super.key,
      required this.selectedName,
      required this.unselectedName,
      required this.defaultName,
      this.index = 0,
      this.selectedIndex = -1,
      this.title,
      this.frameCount = 24,
      this.onTap,
      this.padding = const EdgeInsets.symmetric(horizontal: 7)});

  @override
  _AuAppraiseEmojiItemState createState() => _AuAppraiseEmojiItemState();
}

class _AuAppraiseEmojiItemState extends State<AuAppraiseEmojiItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int _selectedIndex = -1;

  late GifImage _gif;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1000),
    );
    _gif = GifImage(
      controller: _controller,
      image: AssetImage(widget.selectedName,
          package: AuStrings.flutterPackageName),
      width: 34,
      height: 34,
      defaultImage: Image.asset(
        widget.defaultName,
        width: 34,
        height: 34,
        package: AuStrings.flutterPackageName,
        gaplessPlayback: true,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(AuAppraiseEmojiItem oldWidget) {
    _selectedIndex = widget.selectedIndex;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: widget.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getIcon(),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                widget.title ?? '',
                style: TextStyle(
                  color: widget.index == widget.selectedIndex
                      ? const Color(0xffffc300)
                      : const Color(0xff999999),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (_selectedIndex != widget.index) {
          if (widget.onTap != null) {
            widget.onTap!(widget.index);
          }
          _selectedIndex = widget.index;
          _reset();
        }
      },
    );
  }

  Widget _getIcon() {
    if (_selectedIndex != widget.index) {
      return Image.asset(
        _selectedIndex == -1 ? widget.defaultName : widget.unselectedName,
        width: 34,
        height: 34,
        package: AuStrings.flutterPackageName,
        gaplessPlayback: true,
      );
    } else {
      return _gif;
    }
  }

  void _reset() {
    _controller.reset();
    _controller.animateBack(widget.frameCount);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
