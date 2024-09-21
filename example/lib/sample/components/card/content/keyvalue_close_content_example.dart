import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class KeyTextCloseContentExample extends StatefulWidget {
  @override
  _KeyTextCloseContentExampleState createState() =>
      _KeyTextCloseContentExampleState();
}

class _KeyTextCloseContentExampleState
    extends State<KeyTextCloseContentExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '单列展示紧随',
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
              text: '一行展示内容，key和value都不换行',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuPairInfoTable(
              isValueAlign: false,
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名称：", valuePart: "内容内容内容内容内容"),
              ],
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            GestureDetector(
              onTap: () {
                AuToast.show("点击了卡片", context);
              },
              child: AuPairInfoTable(
                isValueAlign: false,
                children: <AuInfoModal>[
                  AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                  AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                  AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                  AuInfoModal.valueLastClickInfo(
                      context, "名称名：", '内容内容内容内容内容', '可点击内容',
                      clickCallback: (text) {
                    AuToast.show(text!, context);
                  }),
                ],
              ),
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Text(
              '异常案例：key过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuPairInfoTable(
              isValueAlign: false,
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称十分的长名称十分的长名称十分的长名称十分的长：",
                    valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称十分的长名称十分的长名称十分的长名称十分的长十分的长：",
                    valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
              ],
            ),
            Text(
              '异常案例：内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuPairInfoTable(
              isValueAlign: false,
              children: <AuInfoModal>[
                AuInfoModal(
                    keyPart: "名称：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称正常：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名：",
                    valuePart:
                        "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内"),
              ],
            ),
            Text(
              '异常案例：可点击内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuPairInfoTable(
              isValueAlign: false,
              expandAtIndex: 2,
              children: <AuInfoModal>[
                AuInfoModal(
                    keyPart: "名称：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称正常：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名：",
                    valuePart:
                        "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内"),
                AuInfoModal.valueLastClickInfo(
                    context, "名称十分的长名：", '内容内容内容内容内容', '可点击内容可点击内容可点击内容可点击内容',
                    clickCallback: (text) {
                  AuToast.show(text!, context);
                }),
                AuInfoModal.valueLastClickInfo(
                    context,
                    "名称十分的长名：",
                    '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容',
                    '可点击内容可点击内容可点击内容可点击内容', clickCallback: (text) {
                  AuToast.show(text!, context);
                }),
              ],
            ),
            Text(
              '异常案例某个元素缺失',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuPairInfoTable(
              isValueAlign: false,
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "内容缺失：", valuePart: null),
                AuInfoModal(keyPart: "", valuePart: "名称缺失"),
                AuInfoModal(keyPart: "", valuePart: ""),
                AuInfoModal(keyPart: "上面的都缺失：", valuePart: "内容内容内容内容内容"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
