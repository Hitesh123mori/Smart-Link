import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';

class UserProfile {
  static final _collectionRef = FirebaseAPIs.firestore.collection("appUser");

  static Future addProfile(AppUser user) async {
    final docRef = _collectionRef.doc(user.userId);

    await docRef.set(user.toJson()).then((value) => null).onError((error, stackTrace) => null);
  }

  static Future<dynamic> signupUser({
    required String name,
    required List<String> interest,
    required String type,
    required String pincode,
    required String address,
    List<String>? qualification,
    String? institute,
  }) async {
    User? user = FirebaseAPIs.auth.currentUser;

    if (user != null) {
      AppUser appUser = AppUser(
        userId: user.uid,
        name: name,
        email: user.email,
        interest: interest,
        type: type,
        notificationPushToken: '',
        qualification: qualification,
        address: address,
        institute: institute,
        pincode:pincode,
      );
      print("#UP: ${appUser.toJson().toString()}");
      return await _collectionRef.doc(user.uid)
          .set(appUser.toJson())
          .then((value) => 'ok')
          .onError((error, stackTrace) => error.toString());
    }
  }

  // appUser/id
  static Future<Map<dynamic, dynamic>?> getUser(String userId) async {

    return await _collectionRef
        .doc(userId)
        .get()
        .then((value) => value.data())
        .onError((error, stackTrace) => {"error": error, "stackTrace": stackTrace});
  }
}
