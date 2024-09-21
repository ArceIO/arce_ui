import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class LoadingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: 'Loading案例',
      ),
      body: Center(
          child: Column(children: [
        Text("正常 Loading 展示"),
        AuPageLoading(),
        Text("短文案 Loading 展示"),
        AuPageLoading(
          content: "我是较短的 Loading",
        ),
        Text("长文案 Loading 展示"),
        AuPageLoading(
          content: "我是较长的我是较长的我是较长的Loading",
        )
      ])),
    );
  }
}
