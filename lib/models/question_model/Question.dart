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
      this.answer,}){
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
      answer = [];
      json['answer'].forEach((k, v) {
        answer?.add(Answer.fromJson(v));
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
  List<Answer>? answer;

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
    if (answer != null) {
      Map<dynamic, dynamic> ansMap = {};
      answer?.map((v) {
        ansMap[v.aId] = v;
      });
      map['answer'] = ansMap.isNotEmpty? ansMap: null;
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

class Answer {
  Answer({
      this.text, 
      this.vote, 
      this.userId, 
      this.userName, 
      this.userType, 
      this.createTime,}){
    aId = FirebaseAPIs.uuid.v1();
  }

  Answer.fromJson(dynamic json) {
    aId = json['aId'];
    text = json['text'];
    vote = json['vote'];
    userId = json['userId'];
    userName = json['userName'];
    userType = json['userType'];
    createTime = json['createTime'];
  }
  String? aId;
  String? text;
  num? vote;
  String? userId;
  String? userName;
  String? userType;
  String? createTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aId'] = aId;
    map['text'] = text;
    map['vote'] = vote;
    map['userId'] = userId;
    map['userName'] = userName;
    map['userType'] = userType;
    map['createTime'] = createTime;
    return map;
  }

}