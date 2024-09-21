import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class AuSelectionBottomButtonExample extends StatefulWidget {
  @override
  _AuSelectionBottomButtonExampleState createState() =>
      _AuSelectionBottomButtonExampleState();
}

class _AuSelectionBottomButtonExampleState
    extends State<AuSelectionBottomButtonExample> {
  AuMultipleBottomController controller = AuMultipleBottomController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '多选吸底按钮',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AuMultipleBottomButton(
                  bottomController: controller,
                  onSelectAll: (state) {
                    AuToast.show('全选状态为 : $state', context);
                  },
                  onSelectedButtonTap: selectedButtonOnTap,
                  hasArrow: true,
                  mainButton: '主要按钮',
                  subButton: '次要按钮',
                  onMainButtonTap: () {
                    controller.setState(selectedCount: 11);
                    AuToast.show('已选数量置为 : 11', context);
                  },
                  onSubButtonTap: () {
                    controller.setState(selectedCount: 0);
                    AuToast.show('已选数量置为 : 0', context);
                  },
                ),
                AuMultipleBottomButton(
                  onSelectedButtonTap: selectedButtonOnTap,
                  hasArrow: true,
                  mainButton: '主要按钮',
                  onMainButtonTap: () {
                    AuToast.show('主按钮点击', context);
                  },
                ),
                AuMultipleBottomButton(
                  onSelectedButtonTap: selectedButtonOnTap,
                  hasArrow: false,
                  mainButton: '主要按钮',
                  onMainButtonTap: () {
                    AuToast.show('主按钮点击', context);
                  },
                ),
                AuMultipleBottomButton(
                  onSelectedButtonTap: selectedButtonOnTap,
                  hasArrow: false,
                  mainButton: '主要按钮',
                  onMainButtonTap: () {
                    AuToast.show('主按钮点击', context);
                  },
                  subButton: '次要按钮',
                ),
                AuMultipleBottomButton(
                  bottomController: AuMultipleBottomController(
                      initMultiSelectState:
                          MultiSelectState(selectedCount: 99)),
                  onSelectedButtonTap: selectedButtonOnTap,
                  hasArrow: false,
                  mainButton: '主要按钮',
                  onMainButtonTap: () {
                    AuToast.show('主按钮点击', context);
                  },
                  subButton: '次要按钮',
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void selectedButtonOnTap(AuMultipleButtonArrowState state) {
    String info = "";
    switch (state) {
      case AuMultipleButtonArrowState.unfold:
        info = '展开状态';
        break;
      case AuMultipleButtonArrowState.cantUnfold:
        info = '无法展开状态';
        break;
      case AuMultipleButtonArrowState.fold:
        info = '收起状态';
        break;
      case AuMultipleButtonArrowState.defaultStatus:
        break;
    }
    AuToast.show('已选择状态为 : $info', context);
  }
}
