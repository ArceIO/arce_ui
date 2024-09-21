import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class SelectionViewMultiRangeExamplePage extends StatefulWidget {
  final String _title;
  final List<AuSelectionEntity>? _filters;

  SelectionViewMultiRangeExamplePage(this._title, this._filters);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState();
}

class _SelectionViewExamplePageState
    extends State<SelectionViewMultiRangeExamplePage> {
  List<String>? titles;

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
              originalSelectionData: widget._filters!,
              onSelectionChanged: (int menuIndex,
                  Map<String, String> filterParams,
                  Map<String, String> customParams,
                  AuSetCustomSelectionMenuTitle setCustomTitleFunction) {
                AuToast.show(filterParams.toString(), context);
              },
              onSelectionPreShow: (int index, AuSelectionEntity entity) {
                if (entity.key == "one_range_key" ||
                    entity.key == "two_range_key") {
                  return AuSelectionWindowType.range;
                }
                return entity.filterShowType!;
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
