import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'au_resources.dart';

///
/// Bruno 多语言支持
///
class AuIntl {
  /// 内置支持的语言和资源
  final Map<String, AuBaseResource> _defaultResourceMap = {
    'en': AuResourceEn(),
    'zh': AuResourceZh()
  };

  /// 缓存当前语言对应的资源，用于无 context 的情况
  static AuIntl? _current;
  static AuBaseResource get currentResource {
    assert(
        _current != null,
        'No instance of AuIntl was loaded. \n'
        'Try to initialize the AuLocalizationDelegate before accessing AuIntl.currentResource.');

    /// 若应用未做本地化，则默认使用 zh-CN 资源
    _current ??= AuIntl(AuResourceZh.locale);
    return _current!.localizedResource;
  }

  final Locale locale;

  AuIntl(this.locale);

  /// 获取当前语言下对应的资源，若为 null 则返回 [AuResourceZh]
  AuBaseResource get localizedResource {
    // 支持动态资源文件
    AuBaseResource? resource =
        _AuIntlHelper.findIntlResourceOfType<AuBaseResource>(locale);
    if (resource != null) return resource;
    // 常规的多语言资源加载
    return _defaultResourceMap[locale.languageCode] ??
        _defaultResourceMap['zh']!;
  }

  /// 获取[AuIntl]实例
  static AuIntl of(BuildContext context) {
    return Localizations.of(context, AuIntl) ?? AuIntl(AuResourceZh.locale);
  }

  /// 获取当前语言下 [AuBaseResource] 资源
  static AuBaseResource i10n(BuildContext context) {
    return AuIntl.of(context).localizedResource;
  }

  /// 应用加载本地化资源
  static Future<AuIntl> _load(Locale locale) {
    _current = AuIntl(locale);
    return SynchronousFuture<AuIntl>(_current!);
  }

  /// 支持非内置的本地化能力
  static void add(Locale locale, AuBaseResource resource) {
    _AuIntlHelper.add(locale, resource);
  }

  /// 支持非内置的本地化能力
  static void addAll(Locale locale, List<AuBaseResource> resources) {
    _AuIntlHelper.addAll(locale, resources);
  }
}

///
/// 组件多语言适配代理
///
class AuLocalizationDelegate extends LocalizationsDelegate<AuIntl> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AuIntl> load(Locale locale) {
    debugPrint('$runtimeType load: locale = $locale, ${locale.countryCode}, ${locale.languageCode}');
    return AuIntl._load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AuIntl> old) => false;

  /// 需在app入口注册
  static AuLocalizationDelegate delegate = AuLocalizationDelegate();
}

///
/// 支持外部动态添加其他语言支的本地化
///
final Map<Locale, Map<Type, dynamic>> _additionalIntls = {};

class _AuIntlHelper {
  ///
  /// 根据 locale 查找 value 类型为[T]的资源
  ///
  static T? findIntlResourceOfType<T>(Locale locale) {
    Map<Type, dynamic>? res = _additionalIntls[locale];
    if (res != null && res.isNotEmpty) {
      for (var entry in res.entries) {
        if (entry.value is T) {
          return entry.value;
        }
      }
    }
    return null;
  }

  ///
  /// 设置自定义 locale 的资源
  ///
  static void addAll(Locale locale, List<AuBaseResource> resources) {
    var res = _additionalIntls[locale];
    if (res == null) {
      res = {};
      _additionalIntls[locale] = res;
    }
    for (AuBaseResource resource in resources) {
      res[resource.runtimeType] = resource;
    }
  }

  ///
  /// 设置自定义 locale 的资源
  ///
  static void add(Locale locale, AuBaseResource resource) {
    var res = _additionalIntls[locale];
    if (res == null) {
      res = {};
      _additionalIntls[locale] = res;
    }
    res[resource.runtimeType] = resource;
  }
}
