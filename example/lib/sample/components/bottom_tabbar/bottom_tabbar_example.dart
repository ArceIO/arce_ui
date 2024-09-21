import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

/// 底部导航栏example
class BottomTabbarExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomTabbarExampleState();
  }
}

class BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  /// 选中的index
  int _selectedIndex = 0;

  /// test1
  int _selectedIndexTest1 = 0;

  /// test2
  int _selectedIndexTest2 = 0;

  /// test3
  int _selectedIndexTest3 = 0;

  /// test4
  int _selectedIndexTest4 = 0;

  /// 未读消息数量
  String badgeNo1 = '100';

  /// title数组
  var titles = ['One', 'Two', 'Three', 'Four', 'Five', 'Six'];

  /// icon数组
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none,
    Icons.star
  ];

  /// 选中状态时state设置
  void _onItemSelected(int index) {
    setState(() {
      /// 置为当前选中item的索引值
      _selectedIndex = index;

      /// 选中后未读消息的数量
      badgeNo1 = '';
    });
  }

  /// test1
  void _onItemSelectedTest1(int index) {
    setState(() {
      /// 置为当前选中item的索引值
      _selectedIndexTest1 = index;
    });
  }

  /// test2
  void _onItemSelectedTest2(int index) {
    setState(() {
      /// 置为当前选中item的索引值
      _selectedIndexTest2 = index;
    });
  }

  /// test3
  void _onItemSelectedTest3(int index) {
    setState(() {
      /// 置为当前选中item的索引值
      _selectedIndexTest3 = index;
    });
  }

  /// test4
  void _onItemSelectedTest4(int index) {
    setState(() {
      /// 置为当前选中item的索引值
      _selectedIndexTest4 = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AuAppBar(
            title: 'BottomTabBar',
            backLeadCallback: () {
              Navigator.pop(context);
            },
          ),

          /// 首先定义一个BottomTabBar容器
          bottomNavigationBar: AuBottomTabBar(
            // 选中item后的颜色
            fixedColor: Color(0xFF0984F9),
            // 当前选中的item索引值
            currentIndex: _selectedIndex,
            // item点击事件
            onTap: _onItemSelected,
            // 未读信息背景颜色
            badgeColor: Colors.red,
            // 定义itemLists
            items: <AuBottomTabBarItem>[
              // 定义每个BottomTabBarItem，子属性请看源码
              AuBottomTabBarItem(
                  icon:
                      Image(image: AssetImage("assets/icons/navbar_house.png")),
                  activeIcon: Image(
                    image: AssetImage("assets/icons/navbar_house.png"),
                    color: Colors.blue,
                  ),
                  title: Text(titles[0])),
              AuBottomTabBarItem(
                  icon:
                      Image(image: AssetImage("assets/icons/navbar_house.png")),
                  activeIcon: Image(
                    image: AssetImage("assets/icons/navbar_house.png"),
                    color: Colors.blue,
                  ),
                  title: Text(titles[1])),
              AuBottomTabBarItem(
                  icon:
                      Image(image: AssetImage("assets/icons/navbar_house.png")),
                  activeIcon: Image(
                    image: AssetImage("assets/icons/navbar_house.png"),
                    color: Colors.blue,
                  ),
                  title: Text(titles[2])),
              AuBottomTabBarItem(
                  icon:
                      Image(image: AssetImage("assets/icons/navbar_house.png")),
                  activeIcon: Image(
                    image: AssetImage("assets/icons/navbar_house.png"),
                    color: Colors.blue,
                  ),
                  title: Text(titles[3])),
              AuBottomTabBarItem(
                icon: Image(image: AssetImage("assets/icons/navbar_house.png")),
                activeIcon: Image(
                  image: AssetImage("assets/icons/navbar_house.png"),
                  color: Colors.blue,
                ),
                title: Text(titles[4]),
              ),
              AuBottomTabBarItem(
                  icon:
                      Image(image: AssetImage("assets/icons/navbar_house.png")),
                  activeIcon: Image(
                    image: AssetImage("assets/icons/navbar_house.png"),
                    color: Colors.blue,
                  ),
                  title: Text(titles[5])),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('极限条件测试1，只有一个item'),
              ),
              AuBottomTabBar(
                fixedColor: Colors.blue,
                currentIndex: _selectedIndexTest1,
                onTap: _onItemSelectedTest1,
                items: <AuBottomTabBarItem>[
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text(titles[0])),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('有 2 个 item'),
              ),
              AuBottomTabBar(
                fixedColor: Colors.blue,
                currentIndex: _selectedIndexTest2,
                type: AuBottomTabBarDisplayType.shifting,
                onTap: _onItemSelectedTest2,
                items: <AuBottomTabBarItem>[
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text(titles[0])),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text(titles[0])),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('极限条件测试2，有8个item'),
              ),
              AuBottomTabBar(
                fixedColor: Colors.blue,
                type: AuBottomTabBarDisplayType.shifting,
                currentIndex: _selectedIndexTest3,
                onTap: _onItemSelectedTest3,
                items: _getTabBarItems(count: 8),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('极限条件测试3，text比较长的情况'),
              ),
              AuBottomTabBar(
                fixedColor: Colors.blue,
                currentIndex: _selectedIndexTest4,
                onTap: _onItemSelectedTest4,
                items: <AuBottomTabBarItem>[
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("1111111111")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("2222222222")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("3333333333")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("4444444444")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("5555555555")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("6666666666")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("7777777777")),
                  AuBottomTabBarItem(
                      icon: Icon(icons[0]), title: Text("8888888888")),
                ],
              ),
            ],
          )),
    );
  }

  List<AuBottomTabBarItem> _getTabBarItems({int count = 1}) {
    return List<AuBottomTabBarItem>.generate(
        count,
        (index) => AuBottomTabBarItem(
              icon: Icon(
                icons[0],
                color: Colors.grey,
              ),
              title: Text(titles[0]),
              activeIcon: Icon(
                icons[0],
                color: Colors.blue,
              ),
            ));
  }
}
