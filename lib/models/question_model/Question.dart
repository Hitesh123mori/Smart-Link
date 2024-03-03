import 'package:ingenious_5/apis/FirebaseAPIs.dart';

/// qID : ""
/// text : ""
/// vote : 1223
/// domain : ["asd","sad"]
/// isGloble : false
/// userId : ""
/// userName : ""
/// userType : ""
/// creatTime : ""
/// answer : [{"aId":"","text":"","vote":23123,"userId":"","userName":"","userType":"","createTime":""},{"aId":"","text":"","vote":23123,"userId":"","userName":"","userType":"","createTime":""},{"aId":"","text":"","vote":23123,"userId":"","userName":"","userType":"","createTime":""}]

class Question {
  Question({
      this.text, 
      this.vote, 
      this.domain, 
      this.isGlobal,
      this.userId, 
      this.userName, 
      this.userType, 
      this.createTime,
      this.chat,}){
    qID = FirebaseAPIs.uuid.v1();
  }

  Question.fromJson(dynamic json) {
    qID = json['qID'];
    text = json['text'];
    vote = json['vote'];
    domain = json['domain'] != null ? json['domain'].cast<String>() : [];
    isGlobal = json['isGlobal'];
    userId = json['userId'];
    userName = json['userName'];
    userType = json['userType'];
    createTime = json['createTime'];
    if (json['answer'] != null) {
      chat = [];
      json['answer'].forEach((k, v) {
        chat?.add(Chats.fromJson(v));
      });
    }
  }
  String? qID;
  String? text;
  num? vote;
  List<String>? domain;
  bool? isGlobal;
  String? userId;
  String? userName;
  String? userType;
  String? createTime;
  List<Chats>? chat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qID'] = qID;
    map['text'] = text;
    map['vote'] = vote;
    map['domain'] = domain;
    map['isGlobal'] = isGlobal;
    map['userId'] = userId;
    map['userName'] = userName;
    map['userType'] = userType;
    map['createTime'] = createTime;
    if (chat != null) {
      Map<dynamic, dynamic> ansMap = {};
      chat?.map((v) {
        ansMap[v.aId] = v;
      });
      map['chat'] = ansMap.isNotEmpty? ansMap: null;
    }
    return map;
  }

}

/// aId : ""
/// text : ""
/// vote : 23123
/// userId : ""
/// userName : ""
/// userType : ""
/// createTime : ""

class Chats {
  Chats({
      this.text, 
      this.vote, 
      this.fromId,
      this.userName, 
      this.userType, 
      this.createTime,}){
    aId = FirebaseAPIs.uuid.v1();
  }

  Chats.fromJson(dynamic json) {
    aId = json['aId'];
    text = json['text'];
    vote = json['vote'];
    fromId = json['fromId'];
    userName = json['userName'];
    userType = json['userType'];
    createTime = json['createTime'];
  }
  String? aId;
  String? text;
  num? vote;
  String? fromId;
  String? userName;
  String? userType;
  String? createTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aId'] = aId;
    map['text'] = text;
    map['vote'] = vote;
    map['userId'] = fromId;
    map['userName'] = userName;
    map['userType'] = userType;
    map['createTime'] = createTime;
    return map;
  }

}