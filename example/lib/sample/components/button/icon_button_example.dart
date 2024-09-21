import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

/// @desc    图片和文字随意组合

class AuIconBtnExample extends StatefulWidget {
  @override
  _AuIconBtnExampleState createState() => _AuIconBtnExampleState();
}

class _AuIconBtnExampleState extends State<AuIconBtnExample>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: '图文组合示列',
      ),
      body: SingleChildScrollView(
        child: iconButton(),
      ),
    );
  }

  Widget iconButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: Center(
            child: AuIconButton(
                name: '文字在下',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF999999),
                ),
                direction: Direction.bottom,
                padding: 4,
                iconHeight: 30,
                iconWidth: 30,
                iconWidget: Icon(Icons.arrow_upward),
                onTap: () {
                  AuToast.show('按钮被点击', context);
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 50),
          child: Center(
            child: AuIconButton(
                name: '文字在上',
                direction: Direction.top,
                padding: 4,
                iconWidget: Icon(Icons.assignment),
                onTap: () {
                  AuToast.show('按钮被点击', context);
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 50),
          child: Center(
            child: AuIconButton(
                name: '文字在右',
                direction: Direction.right,
                padding: 4,
                iconWidget: Icon(Icons.autorenew),
                onTap: () {
                  AuToast.show('按钮被点击', context);
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 50),
          child: Center(
            child: AuIconButton(
                name: '文字在左',
                direction: Direction.left,
                padding: 4,
                iconWidget: Icon(Icons.backspace),
                onTap: () {
                  AuToast.show('按钮被点击', context);
                }),
          ),
        )
      ],
    );
  }
}
