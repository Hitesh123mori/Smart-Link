class AppUser {
  AppUser({
    this.userId,
    this.name,
    this.email,
    this.address,
    this.pincode,
    this.type,
    this.interest,
    this.qualification,
    this.vacancy,
    this.institute,
    this.staredList,
    this.notificationPushToken,
  });

  AppUser.fromJson(dynamic json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    pincode = json['pincode'];
    type = json['type'];
    interest = json['interest'] != null ? json['interest'].cast<String>() : [];
    qualification = json['qualification'] != null ? json['qualification'].cast<String>() : [];
    staredList = json['staredList'] != null ? json['staredList'].cast<String>() : [];
    vacancy = json['vacancy'] != null ? Vacancy.fromJson(json['vacancy']) : null;
    institute = json['institute'];
    notificationPushToken = json['notificationPushToken'];
  }
  String? userId;
  String? name;
  String? email;
  String? address;
  String? pincode;
  String? type;
  List<String>? interest;
  List<String>? qualification;
  List<String>? staredList;
  Vacancy? vacancy;
  String? institute;
  String? notificationPushToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['pincode'] = pincode;
    map['type'] = type;
    map['interest'] = interest;
    map['qualification'] = qualification;
    if (vacancy != null) {
      map['vacancy'] = vacancy?.toJson();
    }
    map['institute'] = institute;
    map['staredList'] = staredList;
    map['notificationPushToken'] = notificationPushToken;
    return map;
  }

}

/// post : ""
/// qtn : ""

class Vacancy {
  Vacancy({
    this.post,
    this.qtn,});

  Vacancy.fromJson(dynamic json) {
    post = json['post'];
    qtn = json['qtn'];
  }
  String? post;
  String? qtn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post'] = post;
    map['qtn'] = qtn;
    return map;
  }

}