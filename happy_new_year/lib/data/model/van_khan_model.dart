import 'package:equatable/equatable.dart';

class VanKhanModel extends Equatable {
  const VanKhanModel({
    this.id,
    this.groupId,
    this.groupName,
    this.meaning,
    this.samle,
    this.vankhan,
  });

  final int id;
  final int groupId;
  final String groupName;
  final String meaning;
  final String samle;
  final String vankhan;

  List<Object> get props => [id];

  factory VanKhanModel.fromJson(Map<String, dynamic> json) => VanKhanModel(
      id: json['ID'],
      groupId: json['Nhom'],
      groupName: json['TenLoai'],
      meaning: json['YNghia'],
      samle: json['SamLe'],
      vankhan: json['VanKhan']);

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
      ..['ID'] = this.id
      ..['Nhom'] = this.groupId
      ..['TenLoai'] = this.groupName
      ..['YNghia'] = this.meaning
      ..['SamLe'] = this.samle
      ..['VanKhan'] = this.vankhan;
  }
}
