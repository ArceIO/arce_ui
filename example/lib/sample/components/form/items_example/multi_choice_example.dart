import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class MultiChoiceInputExamplePage extends StatelessWidget {
  final String _title;

  MultiChoiceInputExamplePage(this._title);

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
            AuMultiChoiceInputFormItem(
              title: "自然",
              options: ["固定", "永久", "未知"],
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
              onChanged: (List<String> oldValue, List<String>? newValue) {
                AuToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue!.length}_onChanged",
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
            AuMultiChoiceInputFormItem(
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "自然",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: [
                "固定",
                "永久",
              ],
              value: [
                "固定",
              ],
              enableList: [true, false],
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String>? newValue) {
                AuToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue!.length}_onChanged",
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
            AuMultiChoiceInputFormItem(
              prefixIconType: AuPrefixIconType.remove,
              isRequire: true,
              title: "自然到",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: [
                "固定",
                "永久",
              ],
              value: [
                "固定",
              ],
              enableList: [true, true],
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
