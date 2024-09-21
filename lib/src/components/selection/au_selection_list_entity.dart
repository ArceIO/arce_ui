import 'package:arce_ui/src/components/selection/bean/au_selection_common_entity.dart';

class AuSelectionEntityListBean {
  List<AuSelectionEntity>? list;

  AuSelectionEntityListBean(this.list);

  static AuSelectionEntityListBean? fromJson(Map<String, dynamic>? map) {
    if (map == null || map['list'] == null) return null;
    AuSelectionEntityListBean bean = AuSelectionEntityListBean(null);
    bean.list =
        (map['list'] as List).map((o) => AuSelectionEntity.fromMap(o)).toList();
    return bean;
  }
}
