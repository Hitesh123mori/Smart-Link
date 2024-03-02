import 'package:ingenious_5/apis/FireStoreAPIs/UserProfileAPI.dart';
import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUserProvider extends ChangeNotifier{
  AppUser? user;

  void notify(){
    notifyListeners();
  }

  Future initUser() async {
    String? uid = FirebaseAPIs.auth.currentUser?.uid;
    print("#authId: $uid");
    if(uid != null)
      user = AppUser.fromJson(await UserProfile.getUser(uid));
    notifyListeners();
  }

  Future logOut() async {
    await FirebaseAPIs.auth.signOut();
    user = null;
    notifyListeners();
  }

}