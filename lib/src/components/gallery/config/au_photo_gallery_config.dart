import 'package:arce_ui/src/components/gallery/config/au_basic_gallery_config.dart';
import 'package:arce_ui/src/components/gallery/config/au_bottom_card.dart';
import 'package:arce_ui/src/components/loading/au_loading.dart';
import 'package:arce_ui/src/constants/au_strings_constants.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_gallery_detail_config.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class AuPhotoGroupConfig extends AuBasicGroupConfig {
  final List<String>? urls;
  @override
  final String? title;
  final AuGalleryDetailConfig? themeData;

  /// 通过 [urls] 列表生成配置
  AuPhotoGroupConfig.url(
      {this.title,
      required this.urls,
      this.themeData,
      List<AuBasicItemConfig>? configList})
      : super(
            title: title,
            configList: urls
                ?.map((item) =>
                    AuPhotoItemConfig(url: item, themeData: themeData))
                .toList());

  /// 自定义配置列表
  AuPhotoGroupConfig(
      {this.urls,
      this.title,
      super.configList,
      this.themeData})
      : super(title: title);
}

/// 图片类的配置
class AuPhotoItemConfig extends AuBasicItemConfig {
  /// 图片url
  final String url;

  /// 图片的展示模式
  final BoxFit fit;

  /// 占位图
  final String placeHolder;

  /// 图片名称 用于详情页展示
  final String? name;

  /// 图片描述公 用于详情页展示
  final String? des;

  /// 详情页图片点击回调
  final VoidCallback? onTap;

  /// 详情页双击回调
  final VoidCallback? onDoubleTap;

  /// 详情页长按回调
  final VoidCallback? onLongPress;

  /// 详情页是否展示底部卡片，需要提供name和des信息
  final bool showBottom;

  /// [PhotoBottomCardState] 底部展示卡片的模式
  final PhotoBottomCardState bottomCardModel;

  /// 指定展开不可收起下 content的高度
  final double bottomContentHeight;

  AuGalleryDetailConfig? themeData;

  AuPhotoItemConfig({
    required this.url,
    this.fit = BoxFit.cover,
    this.placeHolder =
        "packages/${AuStrings.flutterPackageName}/assets/icons/grey_place_holder.png",
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.name,
    this.des,
    this.showBottom = false,
    this.bottomCardModel = PhotoBottomCardState.cantFold,
    this.bottomContentHeight = 150,
    this.themeData,
  }) {
    themeData ??= AuGalleryDetailConfig();
    themeData = AuThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .galleryDetailConfig
        .merge(themeData);
  }

  @override
  Widget buildSummaryWidget(BuildContext context,
      List<AuBasicGroupConfig> allConfig, int groupId, int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
          border: Border.all(color: const Color(0xFFF0F0F0), width: 0.5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: FadeInImage.assetNetwork(
          image: url,
          fit: fit,
          placeholder: placeHolder,
        ),
      ),
    );
  }

  @override
  Widget buildDetailWidget(BuildContext context,
      List<AuBasicGroupConfig> allConfig, int groupId, int index) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                onTap?.call();
              },
              onDoubleTap: () {
                onDoubleTap?.call();
              },
              onLongPress: () {
                onLongPress?.call();
              },
              child: Container(
                color: Colors.white,
                child: PhotoView(
                  backgroundDecoration:
                      BoxDecoration(color: themeData!.pageBackgroundColor),
                  loadingBuilder: (context, event) {
                    return Container(
                      color: themeData!.pageBackgroundColor,
                      child: const AuLoadingDialog(),
                    );
                  },
                  imageProvider: NetworkImage(url),
                ),
              ),
            ),
          ),
          showBottom
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SafeArea(
                    top: false,
                    child: AuPhotoBottomCard(
                      name: name,
                      des: des,
                      model: bottomCardModel,
                      contentHeight: bottomContentHeight,
                      themeData: themeData,
                    ),
                  ),
                )
              : const Row()
        ],
      ),
    );
  }
}
