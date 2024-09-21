import 'package:arce_ui/arce_ui.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

class Setting extends StatelessWidget {
  final GlobalKey _localKey = GlobalKey();
  final GlobalKey _themeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuAppBar(
        title: '设置',
        leading: AuBackLeading(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            ListItem(
              key: _localKey,
              title: "切换组件词条语言",
              describe: "仅改变组件内部词条语言，Demo示例部分不支持",
              isShowLine: false,
              onPressed: () {
                AuPopupListWindow.showPopListWindow(context, _localKey,
                    data: ['中文', '英文', '德语'], onItemClick: (int index, item) {
                  switch (index) {
                    case 0:
                      AuToast.showInCenter(
                          text: "已切换为英语词条（AuResourceZh）。\n注意：组件传入的默认值会影响词条展示",
                          context: context);
                      ChangeLocalEvent.locale = Locale('zh', 'CN');
                      ChangeLocalEvent()..dispatch(context);
                      break;
                    case 1:
                      AuToast.showInCenter(
                          text: "已切换为英语词条（AuResourceEn）。\n注意：组件传入的默认值会影响词条展示",
                          context: context);
                      ChangeLocalEvent.locale = Locale('en', 'US');
                      ChangeLocalEvent()..dispatch(context);
                      break;
                    case 2:
                      AuToast.showInCenter(
                          text: "已切换为德语词条（ResourceDe 部分）。\n注意：组件传入的默认值会影响词条展示",
                          context: context);
                      ChangeLocalEvent.locale = Locale('de', 'DE');
                      ChangeLocalEvent()..dispatch(context);
                      break;
                  }
                  return false;
                }, arrowOffset: 100);
              },
            ),
            ListItem(
              key: _themeKey,
              title: "主题定制切换",
              describe: "当切换为 Pad 主题样式请选用 Pad 设备查看",
              onPressed: () {
                AuPopupListWindow.showPopListWindow(context, _themeKey,
                    data: ['App 主题样式', 'Pad 主题样式'],
                    onItemClick: (int index, item) {
                  if (index == 0) {
                    AuInitializer.register(
                        allThemeConfig: AuDefaultConfigUtils.defaultAllConfig);
                    AuToast.showInCenter(
                        text: "已切换为 App 主题样式", context: context);
                  } else {
                    AuInitializer.register(
                        allThemeConfig: AuPadThemeConfig.allConfig);
                    AuToast.showInCenter(
                        text: "已切换为 Pad 主题样式", context: context);
                  }
                  return false;
                }, arrowOffset: 100);
              },
            ),
          ],
        ),
      ),
    );
  }
}
