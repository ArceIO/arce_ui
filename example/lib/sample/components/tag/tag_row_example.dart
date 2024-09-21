import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class RowTagExample extends StatefulWidget {
  @override
  _RowTagExampleState createState() => _RowTagExampleState();
}

class _RowTagExampleState extends State<RowTagExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '标签组合',
      ),
      body: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        children: [
          AuTagCustom(
            tagText: '自定义标签',
          ),
          AuTagCustom(
            tagText: '标签',
          ),
          AuTagCustom.buildBorderTag(tagText: '标签1'),
          AuTagCustom.buildBorderTag(tagText: '标签2'),
          AuTagCustom.buildBorderTag(tagText: '特长长长长长长的标签'),
          AuTagCustom(tagText: '一级标签'),
          AuTagCustom(tagText: '二级标签'),
          AuTagCustom(tagText: '其他标签'),
          AuTagCustom(tagText: '二级标签'),
          AuTagCustom(tagText: '一级标签'),
          AuTagCustom(tagText: '二级标签'),
        ],
        spacing: 5,
        runSpacing: 5,
      ),
    );
  }
}
