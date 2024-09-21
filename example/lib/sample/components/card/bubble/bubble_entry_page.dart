import 'package:arce_ui/arce_ui.dart';
import 'package:example/sample/components/card/bubble/au_expanded_bubble_example.dart';
import 'package:example/sample/components/card/bubble/common_bubble_example.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:flutter/material.dart';

class BubbleEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: "气泡示例",
      ),
      body: ListView(
        children: [
          ListItem(
            title: "普通气泡",
            isShowLine: false,
            describe: '通栏分割线',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return BubbleExample();
                },
              ));
            },
          ),
          ListItem(
            title: "展开收起气泡",
            describe: '左右有20dp间距的分割线',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return AuBubbleExample2();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
