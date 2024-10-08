import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class BigMainButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: '大主按钮',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AuBigMainButton(
              title: "登录",
              bgColor: Colors.red,
              themeData: AuButtonConfig(
                bigButtonRadius: 255,
                bigButtonHeight: 50,
                bigButtonFontSize: 20,
              ),
            ),
            Text(
              '规则',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBubbleText(
              maxLines: 3,
              text: '按钮宽度为屏幕宽度，按钮的高度为48，按钮的背景色主题色，按钮的圆角为4。\n'
                  '按钮的文案最多居中显示一行，字号16号，文字颜色为白色。',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBigMainButton(
              title: '提交',
              onTap: () {
                AuToast.show('点击了主按钮', context);
              },
            ),
            Text(
              '正常案例 不响应点击事件',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBigMainButton(
              title: '提交',
            ),
            Text(
              '置灰案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBigMainButton(
              title: '提交',
              isEnable: false,
              onTap: () {
                AuToast.show('点击了主按钮', context);
              },
            ),
            Text(
              '文案过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBigMainButton(
              title: '主按钮的文案特别长主按钮的文案特别长主按钮的文案特别长主按钮的文案特别长',
              onTap: () {
                AuToast.show('点击了主按钮', context);
              },
            ),
            AuNormalButton(
              isEnable: false,
              alignment: Alignment.center,
              text: '主案特别长',
              onTap: () {
                AuToast.show('点击了主按钮', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
