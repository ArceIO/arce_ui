import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class GroupAddExamplePage extends StatelessWidget {
  final String _title;

  GroupAddExamplePage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuAppBar(
          title: _title,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                "基本样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AuAddLabel(
              title: "添加组",
              onTap: () {
                AuToast.show("点击触发onTap回调", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "全功能样式-禁用：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AuAddLabel(
              isEdit: false,
              title: "添加组",
              onTap: () {
                AuToast.show("点击触发onTap回调", context);
              },
            ),
          ],
        ));
  }
}
