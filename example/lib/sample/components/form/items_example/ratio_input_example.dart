import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class RatioInputExamplePage extends StatelessWidget {
  final String _title;

  RatioInputExamplePage(this._title);

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
            AuRatioInputFormItem(
              controller: TextEditingController()..text = "1.6",
              title: "车位比",
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
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
            AuRatioInputFormItem(
              controller: TextEditingController()..text = "1.6",
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              title: "车位比",
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
              onChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
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
            AuRatioInputFormItem(
              controller: TextEditingController()..text = "1.6",
              prefixIconType: AuPrefixIconType.remove,
              isRequire: true,
              isEdit: true,
              title: "车位比",
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
              onChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "禁用态下可添加删除：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AuRatioInputFormItem(
              controller: TextEditingController()..text = "1.6",
              prefixIconType: AuPrefixIconType.remove,
              isRequire: true,
              isEdit: false,
              isPrefixIconEnabled: true,
              title: "车位比",
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
              onChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
          ],
        ));
  }
}
