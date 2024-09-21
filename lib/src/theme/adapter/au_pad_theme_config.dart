import 'package:arce_ui/src/theme/base/au_text_style.dart';
import 'package:flutter/material.dart';

import '../configs/au_all_config.dart';
import '../configs/au_appbar_config.dart';
import '../configs/au_button_config.dart';
import '../configs/au_common_config.dart';
import '../configs/au_dialog_config.dart';
import '../configs/au_enhance_number_card_config.dart';
import '../configs/au_form_config.dart';
import '../configs/au_pair_info_config.dart';
import '../configs/au_tag_config.dart';

/// Pad 主题配置
class AuPadThemeConfig {
  ///  默认全局配置
  static AuAllThemeConfig allConfig = AuAllThemeConfig(
      commonConfig: commonConfig,
      formItemConfig: formItemConfig,
      dialogConfig: dialogConfig,
      appBarConfig: appbarConfig,
      pairInfoTableConfig: metaPairInfoTableConfig,
      pairRichInfoGridConfig: metaPairRichInfoGridConfig,
      buttonConfig: buttonConfig,
      enhanceNumberCardConfig: numberInfoConfig,
      tagConfig: tagConfig);

  /// 全局默认配置
  static AuCommonConfig commonConfig = AuCommonConfig(
    /// 主题色相关
    brandPrimary: const Color(0xFF3072F6),
    brandPrimaryTap: const Color(0x193072F6),
    brandSuccess: const Color(0xFF3072F6),
    brandWarning: const Color(0xFFFA5741),
    brandError: const Color(0xFFFA5741),
    brandImportant: const Color(0xFFFA5741),
    brandImportantValue: const Color(0xFFFA5741),

    colorTextBase: const Color(0xFF222222),

    colorTextImportant: const Color(0xFF222222),

    colorTextBaseInverse: const Color(0xFFFFFFFF),

    colorTextSecondary: const Color(0xFF999999),

    colorTextDisabled: const Color(0xFFCCCCCC),

    colorTextHint: const Color(0xFFCCCCCC),

    colorLink: const Color(0xFF0055FF),

    dividerColorBase: const Color(0xFFCCCCCC),

    fillBase: const Color(0xFFFFFFFF),
    fillBody: const Color(0xFFF8F8F8),
    fillMask: const Color(0x99000000),
    fontSizeBebas: 18,
    fontSizeHeadLg: 28,
    fontSizeHead: 22,
    fontSizeSubHead: 18,
    fontSizeBase: 16,
    fontSizeCaption: 14,
    fontSizeCaptionSm: 14,

    radiusXs: 2.0,
    radiusSm: 4.0,
    radiusMd: 5.0,
    radiusLg: 12.0,
    borderWidthSm: 0.5,
    borderWidthMd: 1,
    borderWidthLg: 2,

    hSpacingXs: 8,
    hSpacingSm: 12,
    hSpacingMd: 16,
    hSpacingLg: 20,
    hSpacingXl: 24,
    hSpacingXxl: 42,

    vSpacingXs: 4,
    vSpacingSm: 8,
    vSpacingMd: 12,
    vSpacingLg: 14,
    vSpacingXl: 16,
    vSpacingXxl: 28,

    iconSizeXxs: 8,
    iconSizeXs: 12,
    iconSizeSm: 14,
    iconSizeMd: 16,
    iconSizeLg: 32,
  );

  ///******** 以下是子配置项 ********///

  /// tagView 默认配置
  static AuTagConfig tagConfig = AuTagConfig(
      tagRadius: 6,
      tagMinWidth: 110,
      tagTextStyle: AuTextStyle(fontSize: 12, fontWeight: FontWeight.w600));

  /// 数字信息展示默认配置
  static AuEnhanceNumberCardConfig numberInfoConfig = AuEnhanceNumberCardConfig(
    itemRunningSpace: 0,
    titleTextStyle: AuTextStyle(fontSize: 32),
    descTextStyle: AuTextStyle(fontSize: 16),
  );

  /// 表单项默认配置
  static AuFormItemConfig formItemConfig = AuFormItemConfig(
      subTitleTextStyle: AuTextStyle(fontSize: 14),
      optionsMiddlePadding: const EdgeInsets.only(left: 20),
      errorTextStyle: AuTextStyle(fontSize: 14));

  /// Dialog默认配置
  static AuDialogConfig dialogConfig = AuDialogConfig(
    dialogWidth: 420,
    radius: 12.0,
    titleTextStyle: AuTextStyle(fontSize: 22),
    titlePaddingSm: const EdgeInsets.only(top: 14, left: 32, right: 32),
    titlePaddingLg: const EdgeInsets.only(top: 28, left: 32, right: 32),
    contentTextStyle: AuTextStyle(fontSize: 16),
    contentPaddingSm: const EdgeInsets.only(top: 14, left: 32, right: 32),
    contentPaddingLg: const EdgeInsets.only(top: 28, left: 32, right: 32),
  );

  static AuAppBarConfig appbarConfig = AuAppBarConfig(
    appBarHeight: 57,
    leftAndRightPadding: 24,
    itemSpacing: 24,
    titleMaxLength: 20,
    titleStyle: AuTextStyle(
        color: const Color(0xff222222), fontWeight: FontWeight.w600, fontSize: 24),
    actionsStyle: AuTextStyle(
        color: const Color(0xFF3072F6), fontWeight: FontWeight.w600, fontSize: 18),
  );

  static AuButtonConfig buttonConfig = AuButtonConfig(
      bigButtonRadius: 12,
      bigButtonHeight: 50,
      bigButtonFontSize: 18,
      smallButtonRadius: 12,
      smallButtonFontSize: 14,
      smallButtonHeight: 36);

  static AuPairInfoTableConfig metaPairInfoTableConfig = AuPairInfoTableConfig(
      rowSpacing: 6,
      itemSpacing: 8,
      valueTextStyle: AuTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      keyTextStyle: AuTextStyle(fontSize: 16),
      linkTextStyle: AuTextStyle(fontSize: 16));

  static AuPairRichInfoGridConfig metaPairRichInfoGridConfig =
      AuPairRichInfoGridConfig(
          rowSpacing: 6,
          itemSpacing: 4,
          valueTextStyle:
              AuTextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          keyTextStyle: AuTextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          linkTextStyle: AuTextStyle(fontSize: 16));
}
