//
// import 'package:ingenious_5/apis/FirebaseAPIs.dart';
// import 'package:ingenious_5/models/post_model/post.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class StorageAPI{
//   static final _postFolder = FirebaseAPIs.storage.child("post");
//
//   Future uploadPostImg(String postId, var img) async {
//     final imgRef = _postFolder.child("${postId}/${FirebaseAPIs.uuid.v1()}");
//
//     await imgRef.putData(img)
//     .then((p0) {
//
//       return null;
//     })
//     .onError((error, stackTrace) => null)
//     ;
//
//   }
//
//   static List<String> getImg(String postId){
//     return ['assets/images/dp_img1.jpg', 'assets/images/dp_img2.jpg'];
//   }
//
//   static Future<List<String>> gi(String postId) async {
//     var imgDirRef = await _postFolder.child("${postId.toString()}");
//     return await imgDirRef.list()
//         .then((value) {
//       List<Reference> refs = value.items;
//       print("#res: ${refs.map((e) => e.name)}");
//       return refs.map((e) => e.getDownloadURL().toString()).toList();
//     })
//         .onError((error, stackTrace) => []);
//   }
//
// }