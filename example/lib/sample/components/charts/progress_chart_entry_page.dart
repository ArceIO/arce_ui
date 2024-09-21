import 'package:arce_ui/src/components/charts/au_progress_chart/au_progress_chart.dart';
import 'package:arce_ui/src/components/navbar/au_appbar.dart';
import 'package:flutter/material.dart';

class ProgressChartExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressChartExampleState();
  }
}

class ProgressChartExampleState extends State<ProgressChartExample> {
  double count = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: '数据展示',
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 44,
          ),
          AuProgressChart(
            width: 300,
            height: 20,
            value: count,
            duration: Duration(milliseconds: 500),
            colors: [Colors.lightBlueAccent, Colors.blue],
            backgroundColor: Colors.grey,
            showAnimation: true,
            isFromLastValue: true,
            brnProgressIndicatorBuilder: (BuildContext context, double value) {
              return Text(
                '自定义：$value',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('进度'),
              ),
              Expanded(
                child: Slider(
                    value: count,
                    divisions: 10,
                    onChanged: (data) {
                      if (!mounted) return;
                      setState(() {
                        count = data;
                      });
                    },
                    onChangeStart: (data) {},
                    onChangeEnd: (data) {},
                    min: 0,
                    max: 1,
                    label: '$count',
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    semanticFormatterCallback: (double newValue) {
                      return '$newValue';
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
