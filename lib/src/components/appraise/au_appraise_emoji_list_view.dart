import 'package:arce_ui/src/components/appraise/au_appraise_emoji_item.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_interface.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:flutter/material.dart';

/// 描述: 表情评价列表
///       最多支持5个表情，默认也是5个，支持选择任意个数，
///       传入@indexes就可以选择想要的任意位置的表情了
//ignore: must_be_immutable
class AuAppraiseEmojiListView extends StatefulWidget {
  /// 所需表情包的index列表，index最大值为4
  final List<int> indexes;

  /// 自定义文案，list长度为5，不足5个时请在对应位置补空字符串
  List<String>? titles;

  /// 点击回调
  final AuAppraiseIconClick? onTap;

  /// create AuAppraiseEmojiListView
  AuAppraiseEmojiListView(
      {super.key, this.indexes = const [0, 1, 2, 3, 4], this.titles, this.onTap})
      : assert(indexes.isNotEmpty) {
    titles ??= AuIntl.currentResource.appriseLevel;
    assert(titles != null && titles!.length == 5);
  }

  @override
  _AuAppraiseEmojiListViewState createState() =>
      _AuAppraiseEmojiListViewState();
}

class _AuAppraiseEmojiListViewState extends State<AuAppraiseEmojiListView> {
  /// 未选中表情，灰色
  final List _unselectedIcons = [
    AuAsset.iconAppraiseBadUnselected,
    AuAsset.iconAppraiseNotGoodUnselected,
    AuAsset.iconAppraiseOkUnselected,
    AuAsset.iconAppraiseGoodUnselected,
    AuAsset.iconAppraiseSurpriseUnselected,
  ];

  /// 默认表情，黄色
  final List _defaultIcons = [
    AuAsset.iconAppraiseBadDefault,
    AuAsset.iconAppraiseNotGoodDefault,
    AuAsset.iconAppraiseOkDefault,
    AuAsset.iconAppraiseGoodDefault,
    AuAsset.iconAppraiseSurpriseDefault,
  ];

  /// 选中表情，gif
  final List _selectedIcons = [
    AuAsset.iconAppraiseBadSelected,
    AuAsset.iconAppraiseNotGoodSelected,
    AuAsset.iconAppraiseOkSelected,
    AuAsset.iconAppraiseGoodSelected,
    AuAsset.iconAppraiseSurpriseSelected,
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.indexes.isEmpty) {
      return const SizedBox.shrink();
    }

    List<AuAppraiseEmojiItem> list = [];
    for (int i = 0; i < widget.indexes.length; i++) {
      list.add(AuAppraiseEmojiItem(
        selectedName: _selectedIcons[widget.indexes[i]],
        unselectedName: _unselectedIcons[widget.indexes[i]],
        defaultName: _defaultIcons[widget.indexes[i]],
        index: i,
        padding:
            EdgeInsets.symmetric(horizontal: 7.0 * (6 - widget.indexes.length)),
        selectedIndex: _selectedIndex,
        title: widget.titles![widget.indexes[i]],
        onTap: (index) {
          _selectedIndex = index;
          if (widget.onTap != null) {
            widget.onTap!(_selectedIndex);
          }
        },
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}
