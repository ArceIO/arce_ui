import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class AuTwoRichContentExample extends StatefulWidget {
  @override
  _AuTwoRichContentExampleState createState() =>
      _AuTwoRichContentExampleState();
}

class _AuTwoRichContentExampleState extends State<AuTwoRichContentExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '两列复杂文本',
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
              text: '两组key-value内容平分屏幕，每一组key-value都是一行展示，'
                  'value紧挨着key，不考虑对齐',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuRichInfoGrid(
              pairInfoList: <AuRichGridInfo>[
                AuRichGridInfo("名称：", '内容内容内容内容'),
                AuRichGridInfo("名称：", '内容内容内容'),
                AuRichGridInfo("名称：", '内容内容'),
                AuRichGridInfo.valueLastClickInfo(context, '名称', '内容内容',
                    keyQuestionCallback: (value) {
                  AuToast.show(value, context);
                }),
                AuRichGridInfo.valueLastClickInfo(context, '名称', '内容内容',
                    valueQuestionCallback: (value) {
                  AuToast.show(value, context);
                }),
                AuRichGridInfo.valueLastClickInfo(context, '名称', '内容内容',
                    valueQuestionCallback: (value) {
                      AuToast.show(value, context);
                    },
                    clickTitle: "可点击内容",
                    clickCallback: (value) {
                      AuToast.show(value, context);
                    }),
                AuRichGridInfo.valueLastClickInfo(context, '名称', '内容内容',
                    clickTitle: "可点击内容", clickCallback: (value) {
                  AuToast.show(value, context);
                }),
              ],
            ),
            Text(
              '异常案例：key过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuRichInfoGrid(
              pairInfoList: <AuRichGridInfo>[
                AuRichGridInfo.valueLastClickInfo(
                    context, '名称名称名称名称名称名称名称', '内容内容',
                    keyQuestionCallback: (value) {
                  AuToast.show(value, context);
                }),
                AuRichGridInfo("名称：", '内容内容内容'),
                AuRichGridInfo("名称：", '内容内容'),
                AuRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuRichInfoGrid(
              pairInfoList: <AuRichGridInfo>[
                AuRichGridInfo.valueLastClickInfo(
                    context, '名称名称', '内容内容内容内容内容内容内容内容内容内容内容',
                    keyQuestionCallback: (value) {
                  AuToast.show(value, context);
                }),
                AuRichGridInfo("名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                AuRichGridInfo("名称：", '内容内容'),
                AuRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：Key和Value过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuRichInfoGrid(
              pairInfoList: <AuRichGridInfo>[
                AuRichGridInfo("名称名称：", '内容内容内容内容'),
                AuRichGridInfo.valueLastClickInfo(
                    context, "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                AuRichGridInfo("名称：", '内容内容'),
                AuRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：可点击内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuRichInfoGrid(
              pairInfoList: <AuRichGridInfo>[
                AuRichGridInfo("名称名称：", '内容内容内容内容'),
                AuRichGridInfo.valueLastClickInfo(context, "名称名称名", '内容内容内容',
                    clickTitle: '可点击内容可点击内容可点击内容',
                    valueQuestionCallback: (value) {
                  AuToast.show(value, context);
                }),
                AuRichGridInfo("名称：", '内容内容'),
                AuRichGridInfo("名称：", '内容'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
