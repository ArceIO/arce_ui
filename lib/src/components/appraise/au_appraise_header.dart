import 'package:arce_ui/src/components/appraise/au_appraise_interface.dart';
import 'package:arce_ui/src/constants/au_asset_constants.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/utils/au_tools.dart';
import 'package:flutter/material.dart';

/// 描述: 评价组件title
class AuAppraiseHeader extends StatelessWidget {
  /// 是否显示标题，默认为 true，显示
  final bool showHeader;

  /// 标题文字，默认 ''
  final String title;

  /// 标题最大行数，默认为 1
  final int maxLines;

  /// 标题类型，默认 [AuAppraiseHeaderType.spaceBetween]
  final AuAppraiseHeaderType headerType;

  /// 标题的 padding，为 null 时为默认 padding。
  /// headerType 为 spaceBetween 时默认为 EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 20)
  /// headerType 为 center 时默认为 EdgeInsets.only(top: 20, bottom: 20)
  final EdgeInsets? headPadding;

  /// 点击关闭的回掉
  final AuAppraiseCloseClickCallBack? cancelCallBack;

  const AuAppraiseHeader(
      {super.key,
      this.showHeader = true,
      this.title = '',
      this.maxLines = 1,
      this.headerType = AuAppraiseHeaderType.spaceBetween,
      this.headPadding,
      this.cancelCallBack});

  @override
  Widget build(BuildContext context) {
    if (showHeader) {
      if (headerType == AuAppraiseHeaderType.spaceBetween) {
        return _spaceHeader(context);
      } else if (headerType == AuAppraiseHeaderType.center) {
        return _centerHeader();
      }
    }
    return const SizedBox.shrink();
  }

  Widget _centerHeader() {
    return Container(
      color: Colors.white,
      padding: headPadding ?? const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        title,
        maxLines: maxLines,
        style: TextStyle(
          color: AuThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .colorTextBase,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _spaceHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 38 + maxLines * 22.0,
      child: Padding(
        padding: headPadding ??
            const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, right: 12),
                child: Text(
                  title,
                  maxLines: maxLines,
                  style: TextStyle(
                    color: AuThemeConfigurator.instance
                        .getConfig()
                        .commonConfig
                        .colorTextBase,
                    fontSize: 18.0,
                    height: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (cancelCallBack != null) {
                  cancelCallBack!(context);
                }
                Navigator.of(context).pop();
              },
              child: BrunoTools.getAssetImage(AuAsset.iconPickerClose),
            ),
          ],
        ),
      ),
    );
  }
}

/// title类型
enum AuAppraiseHeaderType {
  /// 居中
  center,

  /// 两边
  spaceBetween,
}
