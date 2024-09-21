import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class SelectionViewMultiListExamplePage extends StatefulWidget {
  final String _title;
  final List<AuSelectionEntity>? _filterData;

  SelectionViewMultiListExamplePage(this._title, this._filterData);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState();
}

class _SelectionViewExamplePageState
    extends State<SelectionViewMultiListExamplePage> {
  List<AuSelectionEntity>? items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuAppBar(title: widget._title),
        body: Column(
          children: <Widget>[
            AuSelectionView(
              originalSelectionData: widget._filterData!,
              onSelectionChanged: (int menuIndex,
                  Map<String, String> filterParams,
                  Map<String, String> customParams,
                  AuSetCustomSelectionMenuTitle setCustomTitleFunction) {
                AuToast.show(filterParams.toString(), context);
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
