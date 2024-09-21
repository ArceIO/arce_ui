import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class AuCommonBottomExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '普通吸底按钮',
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
              ),
            ),
            AuBubbleText(
              maxLines: 3,
              text: '文字按钮最多两个：主按钮和次按钮，可以展示三种按钮的排列组合\n'
                  '主按钮和次按钮的宽度大小是 不固定的，随着icon按钮的多少而变化\n'
                  '上下padding：16，18。左右padding：20',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonName: '次按钮',
              enableSecondaryButton: false,
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonName: '次按钮',
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
              iconButtonList: [
                AuVerticalIconButton(
                  name: '写备注',
                  iconWidget: Icon(Icons.add),
                ),
              ],
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonName: '次按钮',
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
              iconButtonList: [
                AuVerticalIconButton(
                  name: '写备注',
                  iconWidget: Icon(Icons.add),
                ),
                AuVerticalIconButton(
                  name: '写跟进',
                  iconWidget: Icon(Icons.functions),
                ),
              ],
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonName: '次按钮',
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
              iconButtonList: [
                AuVerticalIconButton(
                  name: '写备注',
                  iconWidget: Icon(Icons.add),
                ),
                AuVerticalIconButton(
                  name: '写跟进',
                  iconWidget: Icon(Icons.functions),
                ),
                AuVerticalIconButton(
                  name: '更多',
                  iconWidget: Icon(Icons.input),
                ),
              ],
            ),
            Text(
              '正常案例 主按钮不可用',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              enableMainButton: false,
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonName: '次按钮',
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
              iconButtonList: [
                AuVerticalIconButton(
                  name: '写备注',
                  iconWidget: Icon(Icons.add),
                ),
                AuVerticalIconButton(
                  name: '写跟进',
                  iconWidget: Icon(Icons.functions),
                ),
                AuVerticalIconButton(
                  name: '更多',
                  onTap: () {
                    AuToast.show('更多', context);
                  },
                  iconWidget: Icon(Icons.input),
                ),
              ],
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              enableMainButton: false,
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonName: '次按钮',
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮',
              enableMainButton: false,
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
            ),
            Text(
              '异常案例：按钮文本长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮',
              secondaryButtonName: '次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮',
              secondaryButtonName: '次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
            ),
            AuBottomButtonPanel(
              mainButtonName: '主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮主按钮',
              secondaryButtonName: '次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮次按钮',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
              iconButtonList: [
                AuVerticalIconButton(
                  name: '写备注',
                  iconWidget: Icon(Icons.add),
                ),
                AuVerticalIconButton(
                  name: '写跟进',
                  iconWidget: Icon(Icons.functions),
                ),
                AuVerticalIconButton(
                  name: '更多',
                  iconWidget: Icon(Icons.input),
                ),
              ],
            ),
            Text(
              '异常案例：按钮文本长为空串',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuBottomButtonPanel(
              mainButtonName: '',
              secondaryButtonName: '',
              mainButtonOnTap: () {
                AuToast.show('主按钮', context);
              },
              secondaryButtonOnTap: () {
                AuToast.show('次按钮', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
