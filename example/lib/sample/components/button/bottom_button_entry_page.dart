import 'package:arce_ui/src/components/navbar/au_appbar.dart';
import 'package:example/sample/components/button/common_collection_example.dart';
import 'package:example/sample/components/button/selection_collection_example.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:flutter/material.dart';

class BottomButtonEntryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: '吸底按钮',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListItem(
              title: '普通吸底按钮',
              describe: '主按钮、次按钮、icon按钮的集合',
              isShowLine: false,
              describeColor: Color(0xFF222222),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AuCommonBottomExample();
                }));
              },
            ),
            ListItem(
              title: '多选吸底按钮',
              describe: '全选、已选、主按钮、次按钮',
              describeColor: Color(0xFF222222),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AuSelectionBottomButtonExample();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
