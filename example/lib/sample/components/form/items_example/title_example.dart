import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class TitleExamplePage extends StatelessWidget {
  final String _title;

  TitleExamplePage(this._title);

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
            AuTitleFormItem(
              title: "自然到访保护期",
              operationLabel: "点击操作",
              onTip: () {
                AuToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                AuToast.show("点击触发回调_onTap", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "全功能样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AuTitleFormItem(
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              operationLabel: "点击操作",
              onTip: () {
                AuToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                AuToast.show("点击触发回调_onTap", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "no error：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AuTitleFormItem(
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              operationLabel: "点击操作",
              onTip: () {
                AuToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                AuToast.show("点击触发回调_onTap", context);
              },
            ),
          ],
        ));
  }
}
