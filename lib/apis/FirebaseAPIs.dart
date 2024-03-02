import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseAPIs {
  // for authentication
  static final FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static final Reference storage = FirebaseStorage.instance.refFromURL("gs://ingenious-5.appspot.com");

  // for notification
  static final FirebaseMessaging fmessaging = FirebaseMessaging.instance;

  //for realtime database
  static final DatabaseReference rtdbRef = FirebaseDatabase.instance.refFromURL("https://ingenious-5-default-rtdb.asia-southeast1.firebasedatabase.app/");

  //for id generation;
  static final uuid = Uuid();
}