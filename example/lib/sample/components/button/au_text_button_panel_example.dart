import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class AuTextButtonPanelExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '文本按钮集合',
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
                fontSize: 18,
              ),
            ),
            AuBubbleText(
              maxLines: 3,
              text: '平分屏幕展示,不超过4个时全部展示，超过4个了，则只展示3个，剩余的放在更多里面',
            ),
            Text(
              '正常案例AAA',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: ['操作1'],
              onTap: (index) {
                AuToast.show('第$index个操作', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: ['操作1', '操作2'],
              onTap: (index) {
                AuToast.show('第$index个操作', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: ['操作1', '操作2', '操作3'],
              onTap: (index) {
                AuToast.show('第$index个操作', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: ['操作1', '操作2', '操作3', '操作4'],
              onTap: (index) {
                AuToast.show('第$index个操作', context);
              },
            ),
            Text(
              '异常案例：操作文本长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: ['操作1操作1操作1操作1操作1操作1操作1操作1', '操作2', '操作3'],
              onTap: (index) {
                AuToast.show('第$index个操作', context);
              },
            ),
            Text(
              '异常案例：操作太多',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: ['操作1', '操作2', '操作3', '操作4', '操作5', '操作6'],
              popDirection: AuPopupDirection.top,
              onTap: (index) {
                AuDialogManager.showSingleButtonDialog(context,
                    message: 'index $index clicked!', label: 'OK', onTap: () {
                  Navigator.pop(context);
                });
              },
            ),
            Text(
              '异常案例：按钮字符串为0',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            AuTextButtonPanel(
              nameList: [
                '',
                '',
                '',
                '',
              ],
              onTap: (index) {
                AuToast.show('第$index个操作', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
