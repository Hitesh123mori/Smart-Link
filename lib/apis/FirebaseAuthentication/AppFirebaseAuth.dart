import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingenious_5/apis/FirebaseAuthentication/pwd.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:otp/otp.dart';


class AppFirebaseAuth {
  static var _otp;

  static Future<String> sendOTP(String emailAddress) async{
    var otp1 = OTP.generateTOTPCodeString(
        'MTYU2SGIDNEKS32N', DateTime.now().millisecondsSinceEpoch,
        algorithm: Algorithm.SHA1, interval: 10);
    _otp = otp1;
    print("#opt: $otp1");

    try{
      String username = 'niraj.kc.128@gmail.com';
      String password = pass;

      final smtpServer = gmail(username, password);


      // Create our message.
      final message = Message()
        ..from = Address(username, '<AppName>')
        ..recipients.add(emailAddress.toString())
        ..subject = 'OTP verification for SmartLink ${DateTime.now()}'
        ..text = 'Your OTP for verification is $otp1';

      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent: ' + sendReport.toString());

      } on MailerException catch (e) {
        print('Message not sent.');
        for (var p in e.problems) {
          print('Problem: ${p.code}: ${p.msg}');
        }

        return "Error sending OTP.";
      }
      // DONE


      var connection = PersistentConnection(smtpServer);
      await connection.send(message);
      await connection.close();
    }

    catch (e) {
      print("#error: $e");
      return "Unknown Error occurred";
    }

    _otp = otp1;

    return "OTP Sent";
  }

  static bool verifyOTP(String verifyOTP){
    return _otp == verifyOTP;
  }

  static Future<String> signUp(String emailAddress, String password) async {
    try {
      print("#Fauth: $emailAddress, $password");
      final credential = FirebaseAPIs.auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );


      return "Registered";

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else if (e.code == 'too-many-requests'){
        return 'Server busy. Please try again later.';
      }
      // else if (e.code == 'internal-error') return 'Something want wrong. Please try again later.';

      else {
        print("#error-signUp: ${ e.code.toString()}");
        return 'Something want wrong. Please try again later.';
      }
    } catch (e) {
        print("#error2-signUp: ${ e.toString()}");
      return 'Something want wrong. Please try again later.';
    }
  }

  static Future<String> signIn (String emailAddress, String password) async {
    try {
      final credential = await FirebaseAPIs.auth.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      return "Logged In";

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') return 'No user found for that email.';
      else if (e.code == 'too-many-requests') return 'Server busy. Please try again later.';
      // else if (e.code == 'internal-error') return 'Something want wrong. Please try again later.';
      else if (e.code == 'invalid-credential') return 'Wrong username or password';

      else {
        return 'Something want wrong. Please try again.';
      }
    }
  }

  static Future<bool> signOut() async {
    return FirebaseAPIs.auth.signOut()
        .then((value) => true)
        .onError((error, stackTrace) => false)
    ;
  }
}

//
// main(){
//   FirebaseAuth.sendOTP("22bce209@nirmauni.ac.in");
// }