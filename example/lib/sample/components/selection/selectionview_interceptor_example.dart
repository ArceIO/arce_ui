import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class SelectionViewCloseOrInterceptorExamplePage extends StatefulWidget {
  final String _title;
  final List<AuSelectionEntity>? _filterData;

  SelectionViewCloseOrInterceptorExamplePage(this._title, this._filterData);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState();
}

class _SelectionViewExamplePageState
    extends State<SelectionViewCloseOrInterceptorExamplePage> {
  List<AuSelectionEntity>? items;

  AuSelectionViewController? controller;

  @override
  void initState() {
    super.initState();

    controller = AuSelectionViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(title: widget._title),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text("点击关闭弹窗"),
              onTap: () {
                controller!.closeSelectionView();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text("点击刷新筛选 Title， 清除【双列】Filter 项"),
              onTap: () {
                widget._filterData![1].configRelationshipAndDefaultValue();
                widget._filterData![1].clearChildSelection();
                controller!.refreshSelectionTitle();
              },
            ),
          ),
          AuSelectionView(
            selectionViewController: controller,
            originalSelectionData: widget._filterData!,
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                AuSetCustomSelectionMenuTitle setCustomTitleFunction) {
              AuToast.show('选中 ${filterParams.toString()}，但筛选条件被清除了', context);
              if (menuIndex == 1 && filterParams['two_list_key'] != null) {
                widget._filterData![1].clearChildSelection();
                widget._filterData![1].configRelationshipAndDefaultValue();
                controller!.refreshSelectionTitle();
              }
            },
            onMenuClickInterceptor: (index) {
              if (index == 0) {
                AuToast.show('第$index个被拦截了', context);
                return true;
              } else {
                return false;
              }
            },
          ),
          Container(
            padding: EdgeInsets.only(top: 300),
            alignment: Alignment.center,
            child: Text("背景内容区域"),
          ),
        ],
      )),
    );
  }
}
