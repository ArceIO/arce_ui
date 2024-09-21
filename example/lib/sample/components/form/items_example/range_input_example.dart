import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class RangeInputExamplePage extends StatelessWidget {
  final String _title;

  RangeInputExamplePage(this._title);

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
            AuRangeInputFormItem(
              minController: TextEditingController()..text = "10",
              maxController: TextEditingController()..text = "100",
              title: "保护期",
              hintMin: "最小范围",
              hintMax: "最大范围",
              minUnit: "天",
              maxUnit: "天",
              leftMaxCount: 1,
              rightMaxCount: 3,
              inputType: AuInputType.number,
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onMinChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onMaxChanged: (newValue) {
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
            AuRangeInputFormItem(
              minController: TextEditingController()..text = "10",
              maxController: TextEditingController()..text = "100",
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              isEdit: true,
              hintMin: "最小范围",
              hintMax: "最大范围",
              minUnit: "天",
              maxUnit: "天",
              leftMaxCount: 1,
              rightMaxCount: 3,
              inputType: AuInputType.number,
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onMinChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onMaxChanged: (newValue) {
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
            AuRangeInputFormItem(
              minController: TextEditingController()..text = "10",
              maxController: TextEditingController()..text = "100",
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              title: "保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              isEdit: true,
              hintMin: "最小范围",
              hintMax: "最大范围",
              minUnit: "天",
              maxUnit: "天",
              leftMaxCount: 2,
              rightMaxCount: 3,
              inputType: AuInputType.number,
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onMinChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onMaxChanged: (newValue) {
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
            AuRangeInputFormItem(
              minController: TextEditingController()..text = "10",
              maxController: TextEditingController()..text = "100",
              prefixIconType: AuPrefixIconType.add,
              isRequire: true,
              title: "保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              isEdit: false,
              isPrefixIconEnabled: true,
              hintMin: "最小范围",
              hintMax: "最大范围",
              minUnit: "天",
              maxUnit: "天",
              leftMaxCount: 2,
              rightMaxCount: 3,
              inputType: AuInputType.number,
              onTip: () {
                AuToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                AuToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                AuToast.show("点击触发onRemoveTap回调", context);
              },
              onMinChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onMaxChanged: (newValue) {
                AuToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
          ],
        ));
  }
}
