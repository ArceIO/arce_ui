import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class SelectionViewDateFilterExamplePage extends StatefulWidget {
  final String _title;
  final List<AuSelectionEntity> _filters;

  SelectionViewDateFilterExamplePage(this._title, this._filters);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState(_filters);
}

class _SelectionViewExamplePageState
    extends State<SelectionViewDateFilterExamplePage> {
  late List<AuSelectionEntity> _filterData;

  _SelectionViewExamplePageState(List<AuSelectionEntity> filters) {
    _filterData = filters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuAppBar(title: widget._title),
        body: Column(
          children: <Widget>[
            AuSelectionView(
              originalSelectionData: _filterData,
              onCustomSelectionMenuClick: (int index,
                  AuSelectionEntity customMenuItem,
                  AuSetCustomSelectionParams customHandleCallBack) {
                customHandleCallBack({"customKey": "customValue"});
              },
              onMoreSelectionMenuClick:
                  (int index, AuOpenMorePage openMorePage) {
                openMorePage(
                    updateData: false, moreSelections: widget._filters);
              },
              onSelectionChanged: (int menuIndex,
                  Map<String, String> filterParams,
                  Map<String, String> customParams,
                  AuSetCustomSelectionMenuTitle setCustomTitleFunction) {
                AuToast.show(
                    'filterParams : $filterParams' +
                        ',\n customParams : $customParams',
                    context);
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 400),
              alignment: Alignment.center,
              child: Text("背景内容区域"),
            )
          ],
        ));
  }
}
