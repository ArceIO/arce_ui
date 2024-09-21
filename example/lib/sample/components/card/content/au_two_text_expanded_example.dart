import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class AuTextExpandedContentExample extends StatefulWidget {
  @override
  _AuTextExpandedContentExampleState createState() =>
      _AuTextExpandedContentExampleState();
}

class _AuTextExpandedContentExampleState
    extends State<AuTextExpandedContentExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '展开收起文本',
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
              text: '显示指定行数的文本，超过的收起，点击更多会显示全部',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuExpandableText(
              text: '冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在；门店位于昌平区390号，'
                  '距离昌平线生命科学冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在标语是我家我自在。',
              onExpanded: (value) {
                AuToast.show("当前的状态是$value", context);
              },
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
