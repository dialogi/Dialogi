import '/backend/backend.dart';
import '/components/new_btn_widget.dart';
import '/components/primary_btn_widget.dart';
import '/components/teacher_select_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dialog_summary_widget.dart' show DialogSummaryWidget;
import 'package:flutter/material.dart';

class DialogSummaryModel extends FlutterFlowModel<DialogSummaryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TeacherSelect component.
  late TeacherSelectModel teacherSelectModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Image widget.
  List<LessonsRecord>? lastLesson;
  // Model for primaryBtn component.
  late PrimaryBtnModel primaryBtnModel;
  // Model for newBtn component.
  late NewBtnModel newBtnModel;

  @override
  void initState(BuildContext context) {
    teacherSelectModel = createModel(context, () => TeacherSelectModel());
    primaryBtnModel = createModel(context, () => PrimaryBtnModel());
    newBtnModel = createModel(context, () => NewBtnModel());
  }

  @override
  void dispose() {
    teacherSelectModel.dispose();
    primaryBtnModel.dispose();
    newBtnModel.dispose();
  }
}
