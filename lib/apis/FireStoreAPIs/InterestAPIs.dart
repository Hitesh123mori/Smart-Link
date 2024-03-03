import 'package:ingenious_5/apis/FirebaseAPIs.dart';

class InterestAPIs {
  static final _collectionRef = FirebaseAPIs.firestore.collection("interests");

  static Future<bool> addInterest(String interest) async {
    return await _collectionRef.doc().set({"tag": interest}).then((value) => true).onError((error, stackTrace) {
          print("#interest-api: $error, $stackTrace");
          return false;
        });
  }

  static Future<List<String>> getInterests() async {
    List<String> list = [];
    print("object");
    final d = await _collectionRef.get();
    d.docs.forEach((element) async {
      list.add(element.get("tag"));
      print("#val: ${element.get("tag")}");
    });
    return list;
  }
}


void main () async {

  InterestAPIs.getInterests();

}