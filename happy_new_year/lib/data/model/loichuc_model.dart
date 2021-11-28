import 'package:equatable/equatable.dart';

class LoiChucModel extends Equatable {
  final int id;
  final int group;
  final String content;

  const LoiChucModel({this.id, this.group, this.content});

  List<Object> get props => [id, group, content];

  factory LoiChucModel.fromJson(Map<String, dynamic> json) {
    return LoiChucModel(
      id: json['Id'],
      group: json['Nhom'],
      content: json['Content'],
    );
  }

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
      ..['id'] = id
      ..['group'] = group
      ..['content'] = content;
  }
}
