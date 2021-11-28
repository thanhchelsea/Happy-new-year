import 'package:equatable/equatable.dart';

class SMSTeenModel extends Equatable {
  SMSTeenModel({this.id, this.type, this.info});

  final int id;
  final int type;
  final String info;

  factory SMSTeenModel.fromJson(Map<String, dynamic> json) {
    return SMSTeenModel(
      id: json['Id'],
      type: json['Type'],
      info: json['Info'],
    );
  }

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
        ..['Id'] = this.id
        ..['Type'] = this.type
        ..['Info'] = this.info;
  }

  List<Object> get props => [id];
}