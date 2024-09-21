import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class MultiChoicePortraitInputExamplePage extends StatelessWidget {
  final String _title;

  MultiChoicePortraitInputExamplePage(this._title);

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
            AuMultiChoicePortraitInputFormItem(
              title: "自然到访保护期",
              options: [
                "固定",
                "永久",
                "未知",
              ],
              value: [
                "固定",
                "永久",
              ],
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String> newValue) {
                AuToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged",
                    context);
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
            AuMultiChoicePortraitInputFormItem(
              prefixIconType: AuPrefixIconType.remove,
              isRequire: true,
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: [
                "固定",
                "永久",
                "未知",
              ],
              value: [
                "固定",
                "永久",
              ],
              enableList: [true, true, false],
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String> newValue) {
                AuToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged",
                    context);
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
            AuMultiChoicePortraitInputFormItem(
              prefixIconType: AuPrefixIconType.remove,
              isRequire: true,
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: [
                "固定",
                "永久",
                "未知",
              ],
              value: [
                "固定",
                "永久",
              ],
              enableList: [true, true, false],
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String> newValue) {
                AuToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged",
                    context);
              },
            ),
          ],
        ));
  }
}
