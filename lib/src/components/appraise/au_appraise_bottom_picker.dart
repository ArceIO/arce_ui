import 'package:arce_ui/src/components/appraise/au_appraise.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_config.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_header.dart';
import 'package:arce_ui/src/components/appraise/au_appraise_interface.dart';
import 'package:arce_ui/src/l10n/au_intl.dart';
import 'package:flutter/material.dart';

/// 描述: 评价组件bottom picker，
/// 对AuAppraise做了一层封装，可直接使用在showDialog里面

class AuAppraiseBottomPicker extends StatefulWidget {
  /// 标题
  final String title;

  /// 标题类型
  final AuAppraiseHeaderType headerType;

  /// 评分组件类型，分为表情包和星星，默认星星
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

  /// create AuAppraiseBottomPicker
  const AuAppraiseBottomPicker({
    super.key,
    this.title = '',
    this.headerType = AuAppraiseHeaderType.spaceBetween,
    this.type = AuAppraiseType.star,
    this.iconDescriptions,
    this.tags,
    this.inputHintText = '',
    this.onConfirm,
    this.config = const AuAppraiseConfig(),
  });

  @override
  _AuAppraiseBottomPickerState createState() => _AuAppraiseBottomPickerState();
}

class _AuAppraiseBottomPickerState extends State<AuAppraiseBottomPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0x99000000),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: AuAppraise(
          title: widget.title,
          headerType: widget.headerType,
          type: widget.type,
          iconDescriptions: widget.iconDescriptions ??
              AuIntl.of(context).localizedResource.appriseLevel,
          tags: widget.tags,
          inputHintText: widget.inputHintText,
          onConfirm: (index, list, input) {
            if (widget.onConfirm != null) {
              widget.onConfirm!(index, list, input);
            }
          },
          config: widget.config,
        ),
      ),
    );
  }
}
