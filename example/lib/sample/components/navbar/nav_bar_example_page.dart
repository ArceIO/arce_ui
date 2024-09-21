import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  final int index;

  NavBarPage(this.index);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> with TickerProviderStateMixin {
  TextEditingController? textEditingController;

  TextStyle? selectedHeiStyle;
  TextStyle? unSelectedHeiStyle;
  TextStyle? commonHeiStyle;

  TextStyle? selectedBaiStyle;
  TextStyle? unSelectedBaiStyle;
  TextStyle? commonBaiStyle;
  int currentIndex = 0;

  late ValueNotifier<bool> valueNotifier;
  FocusNode? focusNode;

  TabController? tabController;

  GlobalKey keyLeading = GlobalKey();

  GlobalKey actionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    valueNotifier = ValueNotifier(false);

    selectedHeiStyle = TextStyle(
        fontSize: 18, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600);
    selectedBaiStyle = TextStyle(
        fontSize: 18, color: Color(0xFF222222), fontWeight: FontWeight.w600);

    unSelectedHeiStyle = TextStyle(
        fontSize: 18, color: Color(0xFF999999), fontWeight: FontWeight.w600);
    unSelectedBaiStyle = TextStyle(
        fontSize: 18, color: Color(0xFF999999), fontWeight: FontWeight.w600);

    commonHeiStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
    commonBaiStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF222222));

    focusNode = FocusNode();
    focusNode!.addListener(() {
      if (focusNode!.hasFocus) {
        valueNotifier.value = true;
      }
    });

    tabController = TabController(vsync: this, length: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBarByIndex(context),
      body: buildContentByIndex(context),
    );
  }

  PreferredSizeWidget? buildBarByIndex(BuildContext context) {
    PreferredSizeWidget? appBar;
    switch (widget.index) {
      case 0:
        //2个文字模块切换 左右两个icon hei
        appBar = _getBlackBar1();
        break;

      case 4:
        //文字标题 左2个icon 右文本
        appBar = _getBlackBar5();
        break;

      case 5:
        //文字标题 下拉框
        appBar = _getBlackBar6();
        break;

      case 8:
        ////文字标题 左1个icon 右文本
        appBar = _getBlackBar9();
        break;

      case 9:
        ////文字标题  带标签
        appBar = _getBlackBar10();
        break;

      case 10:
        //文字标题 左2个icon 右文本
        appBar = _getBlackBar11();
        break;

      case 11:
        appBar = _getBlackBar12();
        break;

      case 12:
        appBar = _getBlackBar13();
        break;

      case 13:
        appBar = _getBlackBar14();
        break;

      case 14:
        //多切换文本
        appBar = _getBlackBar15();
        break;

      case 15:
        //多切换文本
        appBar = _getBlackBar16();
        break;

      case 16:
        //多切换文本
        appBar = _getWhiteSearchBar();
        break;
      case 17:
        //单独搜索
        appBar = _getBlackBar17();
        break;

      case 19:
        //多切换文本
        appBar = _getAppBarWithSearchResult();
        break;
      default:
    }
    return appBar;
  }

  Widget? buildContentByIndex(BuildContext context) {
    Widget? widget;
    switch (this.widget.index) {
      case 0:
        widget = Center(
            child: Text(
                '1. 左上角的返回按钮图标支持自定义，本例改成了搜索图标\n2.切换类型的导航栏\n3.顶部模块切换可不限于两个，可多个'));
        break;
      case 4:
        widget = Center(child: Text('多Actions'));
        break;
      case 13:
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
          ],
        );
        break;
      default:
    }

    return widget;
  }

  //2个文字模块切换 左右两个icon hei
  AuAppBar _getBlackBar1() {
    return AuAppBar(
      leading: AuBackLeading(
        child: Image.asset(
          'assets/image/icon_navbar_sousuo_bai.png',
          scale: 3.0,
          height: 20,
          width: 20,
        ),
      ),
      themeData: AuAppBarConfig.dark(),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              currentIndex = 0;
              setState(() {});
            },
            child: Text(
              '二手',
              style: currentIndex == 0 ? selectedHeiStyle : unSelectedHeiStyle,
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              currentIndex = 1;
              setState(() {});
            },
            child: Text(
              '新房',
              style: currentIndex == 1 ? selectedHeiStyle : unSelectedHeiStyle,
            ),
          )
        ],
      ),
      actions: AuIconAction(
        child: Image.asset(
          'assets/image/icon_navbar_add_bai.png',
          scale: 3.0,
          width: 20,
          height: 20,
        ),
        iconPressed: () {
          AuToast.show('点击了右上角的+号', context);
        },
      ),
    );
  }

  //文字标题 左2个icon 右文本
  AuAppBar _getBlackBar5() {
    return AuAppBar(
      title: '标题名称',
      leading: AuDoubleLeading(
        first: AuBackLeading(),
        second: AuBackLeading(
          child: Image.asset(
            'assets/image/icon_navbar_close_bai.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: AuTextAction(
        '弹出菜单',
        key: actionKey,
        iconPressed: () {
          AuPopupListWindow.showPopListWindow(context, actionKey,
              offset: 10, data: ["aaaa", "bbbbb"], onItemClick: (index, item) {
            AuDialogManager.showConfirmDialog(context,
                cancel: 'cancel',
                confirm: 'confirm',
                message: 'message', onCancel: () {
              Navigator.pop(context);
            });
            return true;
          }, onDismiss: () {
            AuToast.show('onDismiss', context);
          });
        },
      ),
    );
  }

  //文字标题 下拉框
  AuAppBar _getBlackBar6() {
    return AuAppBar(
      themeData: AuAppBarConfig.dark(),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "标题名称",
            style: commonHeiStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Image.asset(
              'assets/image/icon_navbar_xiala_bai.png',
              scale: 3.0,
              width: 20,
              height: 20,
            ),
          )
        ],
      ),
    );
  }

  //文字标题 左1个icon 右文本 bai
  AuAppBar _getBlackBar9() {
    return AuAppBar(
      themeData: AuAppBarConfig.light(),
      leading: Image.asset(
        'assets/image/icon_navbar_sousuo_hei.png',
        scale: 3.0,
        width: 20,
        height: 20,
      ),
      title: '标题名称',
    );
  }

  //文字标题 带标签
  AuAppBar _getBlackBar10() {
    return AuAppBar(
      themeData: AuAppBarConfig.light(),
      leading: Image.asset(
        'assets/image/icon_navbar_sousuo_hei.png',
        scale: 3.0,
        width: 20,
        height: 20,
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '标题名称',
            style: TextStyle(
                fontSize: 18,
                height: 1,
                fontWeight: FontWeight.w600,
                color: Color(0xFF222222)),
          ),
          Container(
              height: 17,
              padding: EdgeInsets.only(left: 3, right: 3),
              margin: EdgeInsets.only(left: 6),
              decoration:
                  BoxDecoration(color: Color(0xff8E8E8E).withOpacity(0.15)),
              child: Center(
                child: Text(
                  '住宅',
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1,
                    color: Color(0xFF222222),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  //文字标题 左2个icon 右文本
  AuAppBar _getBlackBar11() {
    return AuAppBar(
      themeData: AuAppBarConfig.light(),
      title: '标题名称',
      leading: AuDoubleLeading(
        first: AuBackLeading(),
        second: AuBackLeading(
          child: Image.asset(
            'assets/image/icon_navbar_close_hei.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: AuTextAction(
        '文本按钮',
      ),
    );
  }

  //多icon的bar hei
  AuAppBar _getBlackBar12() {
    return AuAppBar(
      themeData: AuAppBarConfig.dark(),
      automaticallyImplyLeading: true,
      title: "天通苑天通苑天通苑天通苑天通苑天通苑天通苑天通苑天通苑",
      actions: <Widget>[
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_share_bai.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_pin_bai.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_focus_bai.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }

  //多icon的bar bai
  AuAppBar _getBlackBar13() {
    return AuAppBar(
      themeData: AuAppBarConfig.light(),
      automaticallyImplyLeading: true,
      title: "",
      actions: <Widget>[
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_im_hei.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_share_hei.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_pin_hei.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
        AuIconAction(
          iconPressed: () {},
          child: Image.asset(
            'assets/image/icon_navbar_focus_hei.png',
            scale: 3.0,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }

  PreferredSize _getBlackBar14() {
    return AuSearchAppbar(
      // leading: '新房',
      showDivider: false,
      //点击 leading的回调
      leadClickCallback: (controller, update) {
        //controller 是文本控制器，通过controller 可以拿到输入的内容 以及 对输入的内容更改
        //update 是setState方法的方法命，update() 就可以刷新输入框
        AuToast.show(controller.text, context);
      },
      //输入框 文本内容变化的监听
      searchBarInputChangeCallback: (input) {
        AuToast.show(input, context);
      },
      //输入框 键盘确定的监听
      searchBarInputSubmitCallback: (input) {
        AuToast.show(input, context);
      },
      //为输入框添加 文本控制器，如果不传则使用默认的
      controller: textEditingController,
      //为输入框添加 焦点控制器，如果不传则使用默认的
      focusNode: focusNode,
      //右侧取消action的点击回调
      //参数同leadClickCallback 一样
      dismissClickCallback: (controller, update) {
        Navigator.of(context).pop();
      },
    );
  }

  PreferredSize _getWhiteSearchBar() {
    return AuSearchAppbar(
      themeData: AuAppBarConfig.light(),
      showDivider: true,
      //自定义的leading显示
      leading: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          key: keyLeading,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '类型1',
              style:
                  TextStyle(color: Color(0xFF222222), height: 1, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset(
                'assets/image/icon_triangle.png',
                color: Colors.grey,
                scale: 3.0,
                height: 7,
                width: 7,
              ),
            )
          ],
        ),
      ),
      //点击 leading的回调
      leadClickCallback: (controller, update) {
        //controller 是文本控制器，通过controller 可以拿到输入的内容 以及 对输入的内容更改
        //update 是setState方法的方法命，update() 就可以刷新输入框
        AuPopupListWindow.showPopListWindow(
          context,
          keyLeading,
          data: ["aaaa", "bbbbb"],
          onItemClick: (index, data) {
            AuDialogManager.showConfirmDialog(context,
                cancel: 'cancel', confirm: 'confirm', message: 'message');
            return true;
          },
          onDismiss: () {
            AuToast.show('onDismiss', context);
          },
        );
      },
      //输入框 文本内容变化的监听
      searchBarInputChangeCallback: (input) {
        AuToast.show(input, context);
      },
      //输入框 键盘确定的监听
      searchBarInputSubmitCallback: (input) {
        AuToast.show(input, context);
      },
      //为输入框添加 文本控制器，如果不传则使用默认的
      controller: textEditingController,
      //为输入框添加 焦点控制器，如果不传则使用默认的
      focusNode: focusNode,
      //右侧取消action的点击回调
      //参数同leadClickCallback 一样
      dismissClickCallback: (controller, update) {
        Navigator.of(context).pop();
      },
    );
  }

  PreferredSize _getAppBarWithSearchResult() {
    return AuAppBar.buildSearchResultStyle(
      title: '天通苑天通苑天通苑天通苑天通苑天通苑天通苑天通苑天通苑',
      showLeadingDivider: false,
    );
  }

  PreferredSize _getBlackBar16() {
    return AuSearchAppbar(
      //自定义的leading显示
      leading: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          key: keyLeading,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '类型1',
              style: TextStyle(color: Colors.white, height: 1, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset(
                'assets/image/icon_triangle.png',
                scale: 3.0,
                height: 7,
                width: 7,
              ),
            )
          ],
        ),
      ),
      //点击 leading的回调
      leadClickCallback: (controller, update) {
        //controller 是文本控制器，通过controller 可以拿到输入的内容 以及 对输入的内容更改
        //update 是setState方法的方法命，update() 就可以刷新输入框
        AuPopupListWindow.showPopListWindow(context, keyLeading,
            data: ["aaaa", "bbbbb"], offset: 10);
      },
      //输入框 文本内容变化的监听
      searchBarInputChangeCallback: (input) {
        AuToast.show(input, context);
      },
      //输入框 键盘确定的监听
      searchBarInputSubmitCallback: (input) {
        AuToast.show(input, context);
      },
      //为输入框添加 文本控制器，如果不传则使用默认的
      controller: textEditingController,
      //为输入框添加 焦点控制器，如果不传则使用默认的
      focusNode: focusNode,
      //右侧取消action的点击回调
      //参数同leadClickCallback 一样
      dismissClickCallback: (controller, update) {
        Navigator.of(context).pop();
      },
    );
  }

  AuAppBar _getBlackBar15() {
    Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            currentIndex = 0;
            setState(() {});
          },
          child: Text(
            '二手',
            style: currentIndex == 0 ? selectedHeiStyle : unSelectedHeiStyle,
          ),
        ),
        SizedBox(
          width: 24,
        ),
        GestureDetector(
          onTap: () {
            currentIndex = 1;
            setState(() {});
          },
          child: Text(
            '新房',
            style: currentIndex == 1 ? selectedHeiStyle : unSelectedHeiStyle,
          ),
        ),
        SizedBox(
          width: 24,
        ),
        GestureDetector(
          onTap: () {
            currentIndex = 2;
            setState(() {});
          },
          child: Text(
            '类型',
            style: currentIndex == 2 ? selectedHeiStyle : unSelectedHeiStyle,
          ),
        )
      ],
    );
    return AuAppBar(
      themeData: AuAppBarConfig.dark(),
      automaticallyImplyLeading: false,
      //自定义leading
      leading: AuBackLeading(
        child: Image.asset(
          'assets/image/icon_navbar_sousuo_bai.png',
          scale: 3.0,
          height: 20,
          width: 20,
        ),
      ),
      //自定义title
      title: Container(
        height: 44,
        padding: EdgeInsets.only(left: 24, right: 12),
        child: ListView.separated(
          itemCount: 10,
          //横滑
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.currentIndex = index;
                });
              },
              child: Center(
                child: Text(
                  '标题',
                  style: index == currentIndex
                      ? selectedHeiStyle
                      : unSelectedHeiStyle,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 24,
            );
          },
        ),
      ),
      actions: AuIconAction(
        child: Image.asset(
          'assets/image/icon_navbar_add_bai.png',
          scale: 3.0,
          height: 20,
          width: 20,
        ),
        iconPressed: () {},
      ),
    );
  }

  PreferredSize _getBlackBar17() {
    return AuSearchAppbar(
      autoFocus: true,
      showDivider: false,
      //输入框 文本内容变化的监听
      searchBarInputChangeCallback: (input) {
        AuToast.show(input, context);
      },
      //输入框 键盘确定的监听
      searchBarInputSubmitCallback: (input) {
        AuToast.show(input, context);
      },
      //为输入框添加 文本控制器，如果不传则使用默认的
      controller: textEditingController,
      //为输入框添加 焦点控制器，如果不传则使用默认的
      focusNode: focusNode,
      //右侧取消action的点击回调
      //参数同leadClickCallback 一样
      dismissClickCallback: (controller, update) {
        Navigator.of(context).pop();
      },
    );
  }
}
