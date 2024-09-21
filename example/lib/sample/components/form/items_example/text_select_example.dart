import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class TextSelectInputExamplePage extends StatelessWidget {
  final String _title;

  TextSelectInputExamplePage(this._title);

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
            AuTextSelectFormItem(
              title: "证件类型",
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
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
            AuTextSelectFormItem(
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
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
            AuTextSelectFormItem(
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onTap: () {
                AuToast.show("点击触发回调_onTap", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "autoLayout：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AuTextSelectFormItem.autoLayout(
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onTap: () {
                AuToast.show("点击触发回调_onTap", context);
              },
            ),
          ],
        ));
  }
}
