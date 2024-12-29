import '/backend/backend.dart';
import '/components/popup_lessons_alert_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'question_widget.dart' show QuestionWidget;
import 'package:flutter/material.dart';

class QuestionModel extends FlutterFlowModel<QuestionWidget> {
  ///  Local state fields for this page.

  List<String> answer = [];
  void addToAnswer(String item) => answer.add(item);
  void removeFromAnswer(String item) => answer.remove(item);
  void removeAtIndexFromAnswer(int index) => answer.removeAt(index);
  void insertAtIndexInAnswer(int index, String item) =>
      answer.insert(index, item);
  void updateAnswerAtIndex(int index, Function(String) updateFn) =>
      answer[index] = updateFn(answer[index]);

  UserAnswersRecord? currUserAnswer;

  bool popupLessonNotification = false;

  ///  State fields for stateful widgets in this page.

  List<OnboardingQuestionsRecord>? questionPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in question widget.
  List<UserAnswersRecord>? userAnswerDB;
  // Stores action output result for [Firestore Query - Query a collection] action in question widget.
  int? userExist;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  int? userExist1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserAnswersRecord>? gender1;
  // Model for popupLessonsAlert component.
  late PopupLessonsAlertModel popupLessonsAlertModel;

  @override
  void initState(BuildContext context) {
    popupLessonsAlertModel =
        createModel(context, () => PopupLessonsAlertModel());
  }

  @override
  void dispose() {
    popupLessonsAlertModel.dispose();
  }
}
