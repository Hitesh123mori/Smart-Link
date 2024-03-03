class DoubtMessage{
  DoubtMessage({
    required this.msg,
    required this.type,
    required this.fromId,
    required this.time,
    required this.vote,
  });
  late final String msg;
  late final Type type;
  late final String fromId;
  late final String time;
  late final num vote;

  DoubtMessage.fromJson(Map<String, dynamic> json){
    msg = json['msg'].toString();
    type = json['type'].toString() == Type.image.name ? Type.image  :Type.text;
    fromId = json['fromId'].toString();
    time = json['time'].toString();
    vote = json['vote'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    data['type'] = type.name;
    data['fromId'] = fromId;
    data['time'] = time ;
    data['vote'] = vote;
    return data;
  }
}

enum Type{ text,image }