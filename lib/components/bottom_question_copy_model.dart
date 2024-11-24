import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_question_copy_widget.dart' show BottomQuestionCopyWidget;
import 'package:flutter/material.dart';

class BottomQuestionCopyModel
    extends FlutterFlowModel<BottomQuestionCopyWidget> {
  ///  Local state fields for this component.

  List<String> answer = [];
  void addToAnswer(String item) => answer.add(item);
  void removeFromAnswer(String item) => answer.remove(item);
  void removeAtIndexFromAnswer(int index) => answer.removeAt(index);
  void insertAtIndexInAnswer(int index, String item) =>
      answer.insert(index, item);
  void updateAnswerAtIndex(int index, Function(String) updateFn) =>
      answer[index] = updateFn(answer[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in bottomQuestionCopy widget.
  UserAnswersRecord? userAnswer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
