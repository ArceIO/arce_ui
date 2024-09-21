import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class DashedLineExample extends StatefulWidget {
  @override
  _DashedLineExampleState createState() => _DashedLineExampleState();
}

class _DashedLineExampleState extends State<DashedLineExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '虚线分割线',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '分割线的空间是由内部内容撑开',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            // 分割线的空间是由内部内容撑开
            AuDashedLine(
              dashedLength: 20,
              dashedThickness: 5,
              axis: Axis.vertical,
              color: Colors.red,
              dashedOffset: 20,
              position: AuDashedLinePosition.leading,
              contentWidget: Container(
                margin:
                    EdgeInsets.only(left: 60, right: 20, top: 10, bottom: 10),
                child: Text(
                    "穿插介绍、公司模式一句话C端服务承诺介绍、价值穿插介绍、公司模式一句话C端服务承诺介绍、价值穿插介绍、公司模式一句话C端服务承诺介绍、价值"),
              ),
            ),
            Text(
              '分割线的空间是由内部容器设定',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            // 分割线的空间是由内部容器设定
            AuDashedLine(
              dashedLength: 10,
              dashedThickness: 3,
              axis: Axis.horizontal,
              color: Colors.green,
              dashedOffset: 20,
              position: AuDashedLinePosition.leading,
              contentWidget: Container(
                width: 200,
                height: 100,
              ),
            ),
            Text(
              '分割线的空间由外部设定',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            // 分割线的空间由外部设定
            Container(
              height: 50,
              width: 300,
              padding: EdgeInsets.all(5),
              color: Colors.red,
              child: AuDashedLine(
                axis: Axis.horizontal,
                dashedOffset: 10,
                contentWidget: Container(
                  width: 200,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
