import 'dart:math';

import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class TextContentExample extends StatefulWidget {
  @override
  _TextContentExampleState createState() => _TextContentExampleState();
}

class _TextContentExampleState extends State<TextContentExample> {
  late List<AuInfoModal> list;

  @override
  void initState() {
    super.initState();
    list = [
      AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
      AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
      AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
      AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
      AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
      AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
      AuInfoModal(
          keyPart: "名称名称名称名称：",
          valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
      AuInfoModal.valueLastClickInfo(context, "名称名：", '内容内容内容内容内容', '可点击内容',
          clickCallback: (text) {
        AuToast.show(text!, context);
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuAppBar(
        title: '单列展示左对齐',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '规则',
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            AuBubbleText(
              maxLines: 4,
              text: 'key的宽度最多为92，value是左对齐的，key和value过长的时候可以换行',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            GestureDetector(
              onTap: () {
                AuToast.show('点击', context);
              },
              child: AuPairInfoTable(
                children: <AuInfoModal>[
                  AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                  AuInfoModal(
                      keyPart: "名称名称名：",
                      valuePart: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '测试 valuevalu内容内容valuevalu内容内容',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            '2000元',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      )),
                  AuInfoModal(
                      keyPart: "名称名称名：",
                      valuePart: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '测试 valueva',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            '2000元',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      )),
                  AuInfoModal(
                      keyPart: "名称名称名：",
                      valuePart: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '测试 valuevalu内容内容',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            '2000元',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      )),
                  AuInfoModal(
                      keyPart: "名称名称名：",
                      valuePart: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '测试 valuevalu内容',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            '2000元',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      )),
                  AuInfoModal(
                      keyPart: "总费用：",
                      valuePart: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            '8000元',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuAlignPairInfo(
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名称名称：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
              ],
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            GestureDetector(
              onTap: () {
                AuToast.show('点击了卡片', context);
              },
              child: AuAlignPairInfo(
                children: <AuInfoModal>[
                  AuInfoModal(keyPart: "名称1：", valuePart: "内容内容内容内容"),
                  AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                  AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                  AuInfoModal(
                      keyPart: "名称名称名称名称：",
                      valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                  AuInfoModal.valueLastClickInfo(
                      context, "名称名：", '11111111', '22222222',
                      clickCallback: (text) {
                    AuToast.show(text!, context);
                  }),
                ],
              ),
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuPairInfoTable(
              expandAtIndex: 3,
              isFolded: false,
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名称名称：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal.valueLastClickInfo(
                    context, "名称名：", '内容内容内容内容内容', '可点击内容',
                    clickCallback: (text) {
                  AuToast.show(text!, context);
                }),
              ],
            ),
            Text(
              '正常案例：动态追加',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Stack(
              children: <Widget>[
                AuAlignPairInfo(
                  children: list,
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          list.add(
                            AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                          );
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Text(
                                '更多',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ),
                            Transform.rotate(
                                angle: pi,
                                child: BrunoTools.getAssetImage(
                                    'icons/icon_up_arrow.png')),
                          ],
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.white.withAlpha(100),
                            Colors.white,
                            Colors.white
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                      ),
                    )),
              ],
            ),
            Text(
              '正常案例：动态收起',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Stack(
              children: <Widget>[
                AuAlignPairInfo(
                  children: list,
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          list.removeLast();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Text(
                                '收起',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ),
                            Transform.rotate(
                                angle: pi,
                                child: BrunoTools.getAssetImage(
                                    'icons/icon_down_arrow.png')),
                          ],
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.white.withAlpha(100),
                            Colors.white,
                            Colors.white
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                      ),
                    )),
              ],
            ),
            Text(
              '异常案例：key过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuAlignPairInfo(
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "名称：", valuePart: "内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "11111111111111111111111111111111111：",
                    valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal.valueLastClickInfo(
                    context, "名称十分的长名称十分的长名称十分的长名称十分的长：", '内容内容内容内容内容', '可点击内容',
                    clickCallback: (text) {
                  AuToast.show(text!, context);
                }),
              ],
            ),
            Text(
              '异常案例：内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuAlignPairInfo(
              children: <AuInfoModal>[
                AuInfoModal(
                    keyPart: "名称：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称名：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(keyPart: "名称正常：", valuePart: "内容内容内容内容内容"),
                AuInfoModal(
                    keyPart: "名称名称名：",
                    valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"),
                AuInfoModal.valueLastClickInfo(
                    context,
                    "名称十分的长名称十分的长名称十分的长名称十分的长：",
                    '内容内容内容内容内容',
                    '可点击内容可点击内容可点击内容可点击内容可点击内容可点击内容', clickCallback: (text) {
                  AuToast.show(text!, context);
                }),
              ],
            ),
            Text(
              '异常案例某个元素缺失',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            AuAlignPairInfo(
              children: <AuInfoModal>[
                AuInfoModal(keyPart: "内容缺失：", valuePart: null),
                AuInfoModal(keyPart: "", valuePart: "名称缺失"),
                AuInfoModal(keyPart: "", valuePart: ""),
                AuInfoModal(keyPart: "上面的都缺失：", valuePart: "内容内容内容内容内容"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
