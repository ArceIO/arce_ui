/// 底部多选 Picker 数据类
class AuMultiSelectBottomPickerItem {
  /// 选项编号
  String code;

  /// 选项内容
  String content;

  /// 是否选中
  bool isChecked;

  AuMultiSelectBottomPickerItem(this.code, this.content,
      {this.isChecked = false});
}
