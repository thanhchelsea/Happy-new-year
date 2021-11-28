import 'package:equatable/equatable.dart';

class CamNangModel extends Equatable {
  const CamNangModel({this.id, this.group, this.typeName, this.content});

  final int id;
  final int group;
  final String typeName;
  final String content;

  List<Object> get props => [id, group, typeName, content];

  factory CamNangModel.fromJson(Map<String, dynamic> json) {
    return CamNangModel(
        id: json['ID'],
        group: json['Nhom'],
        typeName: json['TenLoai'],
        content: json['Content']);
  }

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
      ..['id'] = this.id
      ..['Nhom'] = this.group
      ..['TenLoai'] = this.typeName
      ..['Content'] = this.content;
  }
}
