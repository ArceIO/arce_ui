import 'package:arce_ui/src/components/form/utils/au_form_util.dart';
import 'package:arce_ui/src/constants/au_fonts_constants.dart';
import 'package:arce_ui/src/theme/au_theme.dart';
import 'package:flutter/material.dart';

/// 添加组类型录入项所使用的Widget
// ignore: must_be_immutable
class AuAddLabel extends StatefulWidget {
  /// 录入项的唯一标识，主要用于录入类型页面框架中
  final String? label;

  /// 标题文案
  final String title;

  /// 是否可编辑
  final bool isEdit;

  /// 点击录入区回调
  final VoidCallback? onTap;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  AuFormItemConfig? themeData;

  AuAddLabel({
    super.key,
    this.label,
    this.title = "",
    this.isEdit = true,
    this.backgroundColor,
    this.onTap,
    this.themeData,
  }) {
    themeData ??= AuFormItemConfig();
    themeData = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .formItemConfig
        .merge(themeData);
    themeData = themeData!
        .merge(AuFormItemConfig(backgroundColor: backgroundColor));
  }

  @override
  AuAddLabelState createState() {
    return AuAddLabelState();
  }
}

class AuAddLabelState extends State<AuAddLabel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!AuFormUtil.isEdit(widget.isEdit)) {
          return;
        }

        AuFormUtil.notifyAddTap(context, widget.onTap);
      },
      child: Container(
        color: widget.themeData!.backgroundColor,
        padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
        child: Text(
          widget.title,
          style: TextStyle(
            color: AuThemeConfigurator.instance
                .getConfig()
                .commonConfig
                .brandPrimary,
            fontSize: AuFonts.f18,
          ),
        ),
      ),
    );
  }
}
