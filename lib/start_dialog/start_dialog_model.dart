import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'start_dialog_widget.dart' show StartDialogWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class StartDialogModel extends FlutterFlowModel<StartDialogWidget> {
  ///  Local state fields for this page.

  String? teacherSelected;

  TeachersObjStruct? teacherObj;
  void updateTeacherObjStruct(Function(TeachersObjStruct) updateFn) {
    updateFn(teacherObj ??= TeachersObjStruct());
  }

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? startLessonController;
  // Stores action output result for [Firestore Query - Query a collection] action in Stack widget.
  int? lastestLessonsWeek;

  /// Query cache managers for this widget.

  final _answersManager = StreamRequestManager<List<UserAnswersRecord>>();
  Stream<List<UserAnswersRecord>> answers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UserAnswersRecord>> Function() requestFn,
  }) =>
      _answersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAnswersCache() => _answersManager.clear();
  void clearAnswersCacheKey(String? uniqueKey) =>
      _answersManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    startLessonController?.finish();

    /// Dispose query cache managers for this widget.

    clearAnswersCache();
  }

  /// Action blocks.
  Future rtt(BuildContext context) async {
    int? lessonsCount;
    ApiCallResponse? apiResultr2i;
    String? lessonId;
    LessonsRecord? newLesson;
    UserAnswersRecord? englishLevel;

    logFirebaseEvent('rtt_firestore_query');
    lessonsCount = await queryLessonsRecordCount(
      queryBuilder: (lessonsRecord) => lessonsRecord.where(
        'user',
        isEqualTo: currentUserUid,
      ),
    );
    logFirebaseEvent('rtt_backend_call');
    apiResultr2i = await OpenAIAPIGroup.createThreadCall.call();

    logFirebaseEvent('rtt_update_app_state');
    FFAppState().log = (apiResultr2i.jsonBody ?? '').toString();
    if ((apiResultr2i.succeeded ?? true)) {
      logFirebaseEvent('rtt_action_block');
      await action_blocks.userSubscriptionLoad(context);
      logFirebaseEvent('rtt_custom_action');
      lessonId = await actions.createRandomUuid();
      logFirebaseEvent('rtt_backend_call');

      var lessonsRecordReference = LessonsRecord.collection.doc();
      await lessonsRecordReference.set(createLessonsRecordData(
        user: currentUserUid,
        startAt: getCurrentTimestamp,
        summary: '',
        teacher: updateTeachersObjStruct(
          teacherObj,
          clearUnsetFields: false,
          create: true,
        ),
        lessonId: lessonId,
        lessonNum: (lessonsCount) + 1,
        first: ((lessonsCount) + 1).toString() == '1' ? true : false,
      ));
      newLesson = LessonsRecord.getDocumentFromData(
          createLessonsRecordData(
            user: currentUserUid,
            startAt: getCurrentTimestamp,
            summary: '',
            teacher: updateTeachersObjStruct(
              teacherObj,
              clearUnsetFields: false,
              create: true,
            ),
            lessonId: lessonId,
            lessonNum: (lessonsCount) + 1,
            first: ((lessonsCount) + 1).toString() == '1' ? true : false,
          ),
          lessonsRecordReference);
      logFirebaseEvent('rtt_firestore_query');
      englishLevel = await queryUserAnswersRecordOnce(
        queryBuilder: (userAnswersRecord) => userAnswersRecord
            .where(
              'user',
              isEqualTo: currentUserUid,
            )
            .where(
              'question',
              isEqualTo: 'רמת אנגלית',
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('rtt_update_app_state');
      FFAppState().onLesson = true;
      logFirebaseEvent('rtt_navigate_to');

      context.pushNamed(
        'on_dialog_chat',
        queryParameters: {
          'threadId': serializeParam(
            OpenAIAPIGroup.createThreadCall.threadId(
              (apiResultr2i.jsonBody ?? ''),
            ),
            ParamType.String,
          ),
          'dialogSubject': serializeParam(
            widget!.subject,
            ParamType.String,
          ),
          'lessonId': serializeParam(
            lessonId,
            ParamType.String,
          ),
          'assistantId': serializeParam(
            () {
              if (widget!.subject != null && widget!.subject != '') {
                return FFAppConstants.pronounce;
              } else if ((englishLevel?.answer.firstOrNull ==
                      'אני לא יודע לנהל שיחה כלל') ||
                  (englishLevel?.answer.firstOrNull ==
                      'אני מבין אנגלית בסיסית')) {
                return FFAppConstants.assistant1;
              } else if (englishLevel?.answer.firstOrNull ==
                  'אני יכול להבין ולהשתתף בשיחות פשוטות') {
                return FFAppConstants.assistant2;
              } else {
                return FFAppConstants.assistant3;
              }
            }(),
            ParamType.String,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 400),
          ),
        },
      );
    }
  }
}
