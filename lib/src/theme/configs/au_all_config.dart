import 'package:arce_ui/src/theme/base/au_default_config_utils.dart';
import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_abnormal_state_config.dart';
import 'package:arce_ui/src/theme/configs/au_action_sheet_config.dart';
import 'package:arce_ui/src/theme/configs/au_appbar_config.dart';
import 'package:arce_ui/src/theme/configs/au_button_config.dart';
import 'package:arce_ui/src/theme/configs/au_card_title_config.dart';
import 'package:arce_ui/src/theme/configs/au_common_config.dart';
import 'package:arce_ui/src/theme/configs/au_dialog_config.dart';
import 'package:arce_ui/src/theme/configs/au_enhance_number_card_config.dart';
import 'package:arce_ui/src/theme/configs/au_form_config.dart';
import 'package:arce_ui/src/theme/configs/au_gallery_detail_config.dart';
import 'package:arce_ui/src/theme/configs/au_pair_info_config.dart';
import 'package:arce_ui/src/theme/configs/au_picker_config.dart';
import 'package:arce_ui/src/theme/configs/au_selection_config.dart';
import 'package:arce_ui/src/theme/configs/au_tabbar_config.dart';
import 'package:arce_ui/src/theme/configs/au_tag_config.dart';

/// 描述: 全局配置
///
/// 当用户使用时对单个组件自定义配置，优先走单个组件特定配置（作用范围档次使用）
/// 当用户配置组件通用配置时如 [AuDialogConfig] 优先使用该配置
/// 若没有配置组件通用配置，走 [AuCommonConfig] 全局配置
/// 如果以上都没有配置走 Bruno 默认配置，即 [AuDefaultConfigUtils] 中的配置
/// 当没有配置组件的特定属性时使用上一级特定配置
class AuAllThemeConfig {
  AuAllThemeConfig({
    AuCommonConfig? commonConfig,
    AuAppBarConfig? appBarConfig,
    AuButtonConfig? buttonConfig,
    AuDialogConfig? dialogConfig,
    AuFormItemConfig? formItemConfig,
    AuCardTitleConfig? cardTitleConfig,
    AuAbnormalStateConfig? abnormalStateConfig,
    AuTagConfig? tagConfig,
    AuPairInfoTableConfig? pairInfoTableConfig,
    AuPairRichInfoGridConfig? pairRichInfoGridConfig,
    AuActionSheetConfig? actionSheetConfig,
    AuPickerConfig? pickerConfig,
    AuEnhanceNumberCardConfig? enhanceNumberCardConfig,
    AuTabBarConfig? tabBarConfig,
    AuSelectionConfig? selectionConfig,
    AuGalleryDetailConfig? galleryDetailConfig,
    String configId = GLOBAL_CONFIG_ID,
  })  : _commonConfig = commonConfig,
        _appBarConfig = appBarConfig,
        _buttonConfig = buttonConfig,
        _dialogConfig = dialogConfig,
        _formItemConfig = formItemConfig,
        _cardTitleConfig = cardTitleConfig,
        _abnormalStateConfig = abnormalStateConfig,
        _tagConfig = tagConfig,
        _pairInfoTableConfig = pairInfoTableConfig,
        _pairRichInfoGridConfig = pairRichInfoGridConfig,
        _actionSheetConfig = actionSheetConfig,
        _pickerConfig = pickerConfig,
        _enhanceNumberCardConfig = enhanceNumberCardConfig,
        _tabBarConfig = tabBarConfig,
        _selectionConfig = selectionConfig,
        _galleryDetailConfig = galleryDetailConfig;

  AuCommonConfig? _commonConfig;

  AuCommonConfig get commonConfig =>
      _commonConfig ?? AuDefaultConfigUtils.defaultCommonConfig;

  AuAppBarConfig? _appBarConfig;

  AuAppBarConfig get appBarConfig =>
      _appBarConfig ?? AuDefaultConfigUtils.defaultAppBarConfig;

  AuButtonConfig? _buttonConfig;

  AuButtonConfig get buttonConfig =>
      _buttonConfig ?? AuDefaultConfigUtils.defaultButtonConfig;

  AuDialogConfig? _dialogConfig;

  AuDialogConfig get dialogConfig =>
      _dialogConfig ?? AuDefaultConfigUtils.defaultDialogConfig;

  AuCardTitleConfig? _cardTitleConfig;

  AuCardTitleConfig get cardTitleConfig =>
      _cardTitleConfig ?? AuDefaultConfigUtils.defaultCardTitleConfig;

  AuAbnormalStateConfig? _abnormalStateConfig;

  AuAbnormalStateConfig get abnormalStateConfig =>
      _abnormalStateConfig ?? AuDefaultConfigUtils.defaultAbnormalStateConfig;

  AuTagConfig? _tagConfig;

  AuTagConfig get tagConfig =>
      _tagConfig ?? AuDefaultConfigUtils.defaultTagConfig;

  AuPairInfoTableConfig? _pairInfoTableConfig;

  AuPairInfoTableConfig get pairInfoTableConfig =>
      _pairInfoTableConfig ?? AuDefaultConfigUtils.defaultPairInfoTableConfig;

  AuPairRichInfoGridConfig? _pairRichInfoGridConfig;

  AuPairRichInfoGridConfig get pairRichInfoGridConfig =>
      _pairRichInfoGridConfig ??
      AuDefaultConfigUtils.defaultPairRichInfoGridConfig;

  AuActionSheetConfig? _actionSheetConfig;

  AuActionSheetConfig get actionSheetConfig =>
      _actionSheetConfig ?? AuDefaultConfigUtils.defaultActionSheetConfig;

  AuPickerConfig? _pickerConfig;

  AuPickerConfig get pickerConfig =>
      _pickerConfig ?? AuDefaultConfigUtils.defaultPickerConfig;

  AuEnhanceNumberCardConfig? _enhanceNumberCardConfig;

  AuEnhanceNumberCardConfig get enhanceNumberCardConfig =>
      _enhanceNumberCardConfig ??
      AuDefaultConfigUtils.defaultEnhanceNumberInfoConfig;

  AuTabBarConfig? _tabBarConfig;

  AuTabBarConfig get tabBarConfig =>
      _tabBarConfig ?? AuDefaultConfigUtils.defaultTabBarConfig;

  AuFormItemConfig? _formItemConfig;

  AuFormItemConfig get formItemConfig =>
      _formItemConfig ?? AuDefaultConfigUtils.defaultFormItemConfig;

  AuSelectionConfig? _selectionConfig;

  AuSelectionConfig get selectionConfig =>
      _selectionConfig ?? AuDefaultConfigUtils.defaultSelectionConfig;

  AuGalleryDetailConfig? _galleryDetailConfig;

  AuGalleryDetailConfig get galleryDetailConfig =>
      _galleryDetailConfig ?? AuDefaultConfigUtils.defaultGalleryDetailConfig;

  void initThemeConfig(String configId) {
    _commonConfig ??= AuCommonConfig();
    _appBarConfig ??= AuAppBarConfig();
    _buttonConfig ??= AuButtonConfig();
    _dialogConfig ??= AuDialogConfig();
    _formItemConfig ??= AuFormItemConfig();
    _cardTitleConfig ??= AuCardTitleConfig();
    _abnormalStateConfig ??= AuAbnormalStateConfig();
    _tagConfig ??= AuTagConfig();
    _appBarConfig ??= AuAppBarConfig();
    _pairInfoTableConfig ??= AuPairInfoTableConfig();
    _pairRichInfoGridConfig ??= AuPairRichInfoGridConfig();
    _actionSheetConfig ??= AuActionSheetConfig();
    _pickerConfig ??= AuPickerConfig();
    _enhanceNumberCardConfig ??= AuEnhanceNumberCardConfig();
    _tabBarConfig ??= AuTabBarConfig();
    _selectionConfig ??= AuSelectionConfig();
    _galleryDetailConfig ??= AuGalleryDetailConfig();

    commonConfig.initThemeConfig(configId);
    appBarConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    buttonConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    dialogConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    formItemConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    cardTitleConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    abnormalStateConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    tagConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    pairInfoTableConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    pairRichInfoGridConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    selectionConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    actionSheetConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    pickerConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    enhanceNumberCardConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    tabBarConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
    galleryDetailConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}
