import 'package:ingenious_5/apis/FirebaseAPIs.dart';

class DoubtMessage{
  DoubtMessage({
    required this.msg,
    required this.type,
    required this.fromId,
    required this.fromName,
    required this.time,
    required this.vote,
  }){
    cId = FirebaseAPIs.uuid.v1();
  }
  late final String msg;
  late final Type type;
  late final String fromId;
  late final String time;
  late final num vote;
  late final String fromName;
  late final String cId;

  DoubtMessage.fromJson(Map<String, dynamic> json){
    cId = json['cId'].toString();
    msg = json['msg'].toString();
    type = json['type'].toString() == Type.image.name ? Type.image  :Type.text;
    fromId = json['fromId'].toString();
    time = json['time'].toString();
    vote = json['vote'];
    fromName = json['fromName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cId'] = cId;
    data['msg'] = msg;
    data['type'] = type.name;
    data['fromId'] = fromId;
    data['time'] = time ;
    data['vote'] = vote;
    data['fromName'] = fromName;
    return data;
  }
}

enum Type{ text,image }
