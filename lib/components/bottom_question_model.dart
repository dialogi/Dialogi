import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bottom_question_widget.dart' show BottomQuestionWidget;
import 'package:flutter/material.dart';

class BottomQuestionModel extends FlutterFlowModel<BottomQuestionWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in bottomQuestion widget.
  UserAnswersRecord? userAnswer;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
