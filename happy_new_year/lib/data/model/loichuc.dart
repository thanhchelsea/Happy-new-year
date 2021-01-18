import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoiChuc extends Equatable {
  final int id;
  final String role;
  final String content;

  const LoiChuc({this.id, this.role, this.content});

  @override
  // TODO: implement props
  List<Object> get props => [id, role, content];

  static LoiChuc fromJson(Map<String, dynamic> json) {
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return LoiChuc(
      id: json['ID'],
      role: json['ROLE'],
      content: stringToBase64.decode(json['CONTENT']),
    );
      // id = json["id"]
      // role = json["role"]
      // ..content = json["content"];
  }

  Map<String, dynamic> toMap() {
    return Map<String, dynamic>()
        ..["id"] = id
        ..["role"] = role
        ..['content'] = content;
  }
}