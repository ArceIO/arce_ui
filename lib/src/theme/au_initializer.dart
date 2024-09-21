import 'package:arce_ui/src/theme/au_theme_configurator.dart';
import 'package:arce_ui/src/theme/configs/au_all_config.dart';

/// Bruno 初始化
class AuInitializer {
  /// 手动注册时，默认注册渠道是 GLOBAL_CONFIG_ID
  static register({
    AuAllThemeConfig? allThemeConfig,
    String configId = GLOBAL_CONFIG_ID,
  }) {
    /// 配置主题定制
    AuThemeConfigurator.instance.register(allThemeConfig, configId: configId);
  }
}
