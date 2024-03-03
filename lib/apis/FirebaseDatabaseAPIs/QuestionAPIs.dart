import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:ingenious_5/models/message_model.dart';
import 'package:ingenious_5/models/question_model/Question.dart';
import 'package:mailer/mailer.dart';

class QuestionAPIs{
  static final _nodeRef = FirebaseAPIs.rtdbRef;

  /// for asking question
  Future postQuestion(Question question)async{
    _nodeRef.child("questions/${question.qID}").push().set(question.toJson())
    .then((value) => "Question Posted")
    .onError((error, stackTrace) => "#error: $error \n $stackTrace")
    ;
  }


  /// for answering and sub questioning
  Future postAnswer(String qId, DoubtMessage message)async{
    _nodeRef.child("questions/${qId}/chats").push().set(message.toJson())
    .then((value) => "Posted")
    .onError((error, stackTrace) => "#error: $error \n $stackTrace")
    ;
  }



  /// Question stream for stream builder
  static Future getQuestions() async {
      return _nodeRef.child("questions").onValue;
  }

  Future deleteQuestion(String id) async {
    return _nodeRef.child("questions/${id.toString()}").remove();
  }

  static Future getMyQuestions(String userId) async {
    return _nodeRef.child("questions").orderByChild("userId").equalTo(userId).onValue;
  }

  static Future getHighRatingQuestions() async {
    return _nodeRef.child("questions").orderByChild("vote").limitToFirst(2).onValue;
  }

}
