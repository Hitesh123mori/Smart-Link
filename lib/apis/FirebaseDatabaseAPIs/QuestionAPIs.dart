import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:ingenious_5/models/question_model/Question.dart';

class QuestionAPIs{
  static final _nodeRef = FirebaseAPIs.rtdbRef;

  /// for asking question
  Future postQuestion(Question question)async{
    _nodeRef.child("questions/${question.qID}").push().set(question.toJson())
    .then((value) => "Question Posted")
    .onError((error, stackTrace) => "#error: $error \n $stackTrace")
    ;
  }

  /// Question stream for stream builder
  static Future getQuestions({String? filterBy, String? filterVal, bool? isGlobal}) async {
    if (filterBy != null && filterVal != null){
      final data = await _nodeRef.child("questions").orderByChild(filterBy.toString()).equalTo(filterVal.toString()).get();
      print("#data: ${data.value}");
      Map<dynamic, dynamic> map = data.value as Map<dynamic, dynamic>;
      map.forEach(
          (k, v) {
            print("$k, $v");
          }
      );

      return data;
    }
    else{
      return _nodeRef.child("questions").get();
    }

  }

  Future deleteQuestion(String id) async {
    return _nodeRef.child("questions/${id.toString()}").remove();
  }

}
