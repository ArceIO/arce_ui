import 'package:arce_ui/src/components/appraise/au_appraise_config.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_emoji_list_view.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_header.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_interface.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_star_list_view.dart';
import 'package:arce_ui/src/components/appraise/au_mulit_select_tags.dart';
import 'package:arce_ui/src/components/button/au_big_main_button.dart';
import 'package:arce_ui/src/components/input/au_input_text.dart';
import 'package:arce_ui/src/components/picker/au_tags_picker_config.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:flutter/material.dart';

/// /// /// /// /// /// /// /// /// /
/// 描述: 评价组件
/// 1. 支持表情包和星星两种
/// 2. 最多支持5个表情和5颗星
/// 3. 支持自定义title，标签等，在AuAppraiseConfig里配置
/// 4. 可以用在页面里面也可以使用在弹窗里面，使用在底部弹窗的参考[AuAppraiseBottomPicker]
/// /// /// /// /// /// /// /// /// /

class AuAppraise extends StatefulWidget {
  /// 标题
  final String title;

  /// 标题类型，取值[AuAppraiseHeaderType]
  /// center 标题居中
  /// spaceBetween 标题和关闭居于两侧
  /// 默认值AuAppraiseHeaderType.spaceBetween
  final AuAppraiseHeaderType headerType;

  /// 评分组件类型，取值[AuAppraiseType]
  /// Emoji 表示使用表情包评价
  /// star 使用星星打分
  /// 默认值 AuAppraiseType.Star
  final AuAppraiseType type;

  /// 自定义文案
  /// 若评分组件为表情，则list长度为5，不足5个时请在对应位置补空字符串
  /// 若评分组件为星星，则list长度不能比count小
  final List<String>? iconDescriptions;

  /// 标签
  final List<String>? tags;

  ///输入框允许提示文案
  final String inputHintText;

  /// 提交按钮的点击回调
  final AuAppraiseConfirmClick? onConfirm;

  /// 评价组件的配置项
  final AuAppraiseConfig config;

  /// create AuAppraise
  const AuAppraise(
      {super.key,
      this.title = '',
      this.headerType = AuAppraiseHeaderType.spaceBetween,
      this.type = AuAppraiseType.star,
      this.iconDescriptions,
      this.tags,
      this.inputHintText = '',
      this.onConfirm,
      this.config = const AuAppraiseConfig()});

  @override
  _AuAppraiseState createState() => _AuAppraiseState();
}

class _AuAppraiseState extends State<AuAppraise> {
  int _appraiseIndex = -1;
  bool? _enable;
  String? _inputText;
  List<String> _selectedTag = [];

  @override
  void initState() {
    _enable = widget.config.isConfirmButtonEnabled;
    super.initState();
  }

  @override
  void didUpdateWidget(AuAppraise oldWidget) {
    _enable = widget.config.isConfirmButtonEnabled;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _headerArea(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _getIconWidget(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _getTags(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _inputArea(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _confirmButton(),
          ),
        ],
      ),
    );
  }

  /// header
  Widget _headerArea(BuildContext context) {
    EdgeInsets defaultPadding =
        (widget.headerType == AuAppraiseHeaderType.center)
            ? const EdgeInsets.only(top: 20, bottom: 20)
            : const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 20);
    return AuAppraiseHeader(
      showHeader: widget.config.showHeader,
      headerType: widget.headerType,
      title: widget.title,
      maxLines: widget.config.titleMaxLines,
      headPadding: widget.config.headerPadding ?? defaultPadding,
      cancelCallBack: widget.config.onCancel,
    );
  }

  /// 获取评分组件
  Widget _getIconWidget() {
    if (widget.type == AuAppraiseType.emoji) {
      return AuAppraiseEmojiListView(
        indexes: widget.config.indexes,
        titles: widget.iconDescriptions ??
            AuIntl.of(context).localizedResource.appriseLevel,
        onTap: (index) {
          setState(() {
            _appraiseIndex = index;
          });
          if (widget.config.iconClickCallback != null) {
            widget.config.iconClickCallback!(index);
          }
        },
      );
    } else {
      return AuAppraiseStarListView(
        count: widget.config.count,
        titles: widget.iconDescriptions ??
            AuIntl.of(context).localizedResource.appriseLevel,
        hint: widget.config.starAppraiseHint,
        onTap: (index) {
          setState(() {
            _appraiseIndex = index;
          });
          if (widget.config.iconClickCallback != null) {
            widget.config.iconClickCallback!(index);
          }
        },
      );
    }
  }

  /// 标签
  Widget _getTags() {
    if (widget.tags?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: AuMultiSelectTags(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        tagPickerBean: AuTagsPickerConfig(
          tagItemSource: _string2Tag(widget.tags),
        ),
        tagText: (choice) {
          return choice.name;
        },
        // tagStyle: AuMultiSelectStyle.auto,
        multiSelect: widget.config.multiSelect,
        brnCrossAxisCount: widget.config.tagCountEachRow,
        selectedTagsCallback: (list) {
          _selectedTag = _tag2String(list);
          if (widget.config.tagSelectCallback != null) {
            widget.config.tagSelectCallback!(_selectedTag);
          }
        },
      ),
    );
  }

  /// 输入框
  Widget _inputArea() {
    if (widget.config.showTextInput) {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: AuInputText(
          maxLength: widget.config.maxLength,
          bgColor: const Color(0xfff8f8f8),
          hint: widget.inputHintText,
          textString: (_inputText ?? widget.config.inputDefaultText) ?? '',
          maxHeight: widget.config.inputMaxHeight,
          minHeight: 40,
          maxHintLines: widget.config.maxHintLines,
          padding: const EdgeInsets.all(12),
          onTextChange: (input) {
            _inputText = input;
            if (widget.config.inputTextChangeCallback != null) {
              widget.config.inputTextChangeCallback!(input);
            }
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 提交按钮
  Widget _confirmButton() {
    if (widget.config.showConfirmButton) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: AuBigMainButton(
          title: widget.config.confirmButtonText ??
              AuIntl.of(context).localizedResource.submit,
          isEnable: _enable ?? _appraiseIndex != -1,
          onTap: () {
            if (_enable ?? _appraiseIndex != -1) {
              if (widget.onConfirm != null) {
                widget.onConfirm!(
                    _appraiseIndex, _selectedTag, _inputText ?? '');
              }
            }
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }

  List<AuTagItemBean> _string2Tag(List<String>? tags) {
    List<AuTagItemBean> items = [];
    if (tags?.isNotEmpty ?? false) {
      for (int i = 0; i < tags!.length; i++) {
        items.add(AuTagItemBean(name: tags[i], code: tags[i], index: i));
      }
    }
    return items;
  }

  List<String> _tag2String(List<AuTagItemBean> tags) {
    List<String> result = [];
    for (var item in tags) {
      result.add(item.name);
    }
    return result;
  }
}
