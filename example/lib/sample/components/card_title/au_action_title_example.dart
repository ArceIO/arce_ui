import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class AuActionTitleExample extends StatefulWidget {
  @override
  _AuActionTitleExampleState createState() => _AuActionTitleExampleState();
}

class _AuActionTitleExampleState extends State<AuActionTitleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '箭头标题',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '规则',
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            AuBubbleText(
              maxLines: 4,
              text: '标题不可以折行，当辅助widget和subwidget过多时，标题...截断\n'
                  '展示出sub和ac\n'
                  '标题字体为18',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '表头',
              onTap: () {
                AuToast.show('AuActionCardTitle is clicked', context);
              },
            ),
            AuLine(
              height: 2,
              color: Colors.black12,
            ),
            Text(
              '正常案例（自定义副标题Widget）',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '非箭头',
              //标题右侧widget
              subTitleWidget: Row(
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  Text(
                    '副标题',
                    style: TextStyle(color: Colors.red),
                  ),
                  AuStateTag(tagText: '状态标签'),
                ],
              ),
              //整个widget的点击
              onTap: () {
                AuToast.show('AuPlainCardTitle is clicked', context);
              },
            ),
            AuLine(
              height: 2,
              color: Colors.black12,
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '非箭头',
              //标题右侧widget
              subTitle: "副标题",
              //整个widget的点击
              accessoryText: "点击标题",
              onTap: () {
                AuToast.show('AuPlainCardTitle is clicked', context);
              },
            ),
            AuLine(
              height: 2,
              color: Colors.black12,
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '标题特别长特别长特别长特别长特别长特别长特别长特别长',
              //标题右侧widget
              subTitle: "副标题",
              //整个widget的点击
              accessoryText: "点击标题",
              onTap: () {
                AuToast.show('AuPlainCardTitle is clicked', context);
              },
            ),
            AuLine(
              height: 2,
              color: Colors.black12,
            ),
            Text(
              '异常案例：title特别长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '标题特别长特别长特别长特别长特别长特别长特别长特别长',
              //标题右侧widget
//              subTitle: "副标题",
              //整个widget的点击
              accessoryText: "点击标题",
              onTap: () {
                AuToast.show('AuActionCardTitle is clicked', context);
              },
            ),
            AuLine(
              height: 2,
              color: Colors.black12,
            ),
            Text(
              '异常案例：副标题特别长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '标题特别',
              //标题右侧widget
              subTitle: "副标题也特别长特别长长特别长特别长特别长特别长",
              //整个widget的点击
              accessoryText: "点击标题",
              onTap: () {
                AuToast.show('AuActionCardTitle is clicked', context);
              },
            ),
            AuLine(
              height: 2,
              color: Colors.black12,
            ),
            Text(
              '异常案例：跳转标题特别长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuActionCardTitle(
              title: '标题特别',
              //标题右侧widget
              subTitle: "副标题",
              //整个widget的点击
              accessoryText: "点击标题特别长特别长特别长特别长特别长特别长",
              onTap: () {
                AuToast.show('AuActionCardTitle is clicked', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
