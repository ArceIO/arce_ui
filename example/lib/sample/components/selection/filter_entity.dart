import 'package:arce_ui/arce_ui.dart';

class AuFilterEntity {
  String? key;
  late String name;
  String? defaultValue;
  late List<ItemEntity> children;

  AuFilterEntity.fromJson(Map<String, dynamic> map) {
    key = map['key'] ?? '';
    name = map['title'] ?? '';
    defaultValue = map['defaultValue'] ?? '';
    children = []..addAll(
        (map['children'] as List? ?? []).map((o) => ItemEntity.fromJson(o)));
  }
}
