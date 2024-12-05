import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dialog_manager_widget.dart';
import '/components/popup_widget.dart';
import '/components/teacher_select_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'on_dialog_chat_widget.dart' show OnDialogChatWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class OnDialogChatModel extends FlutterFlowModel<OnDialogChatWidget> {
  ///  Local state fields for this page.

  List<MessageStruct> chatHistory = [];
  void addToChatHistory(MessageStruct item) => chatHistory.add(item);
  void removeFromChatHistory(MessageStruct item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, MessageStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(MessageStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  String? runId;

  String status = 'status';

  bool captionView = false;

  FFUploadedFile? recordedAudioFile;

  double progrssVal = 1.0;

  bool beforeEnd = false;

  bool teacherTurn = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? dialogController;
  // Stores action output result for [Firestore Query - Query a collection] action in on_dialog_chat widget.
  LessonsRecord? currLesson;
  // Model for TeacherSelect component.
  late TeacherSelectModel teacherSelectModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for ScollingChatColumn widget.
  ScrollController? scollingChatColumn;
  // State field(s) for ChatListView widget.
  ScrollController? chatListView;
  // State field(s) for Timer widget.
  final timerInitialTimeMs1 = 0;
  int timerMilliseconds1 = 0;
  String timerValue1 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Timer widget.
  final timerInitialTimeMs2 = 0;
  int timerMilliseconds2 = 0;
  String timerValue2 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for dialogManager component.
  late DialogManagerModel dialogManagerModel;
  // Stores action output result for [Custom Action - fetchAndPlaySpeech] action in dialogManager widget.
  String? repeatPath;
  // Model for popup component.
  late PopupModel popupModel;
  AudioRecorder? audioRecorder;
  // Stores action output result for [Custom Action - newRecord] action in popup widget.
  String? nw;
  String? audioRecording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Custom Action - renameAudio] action in popup widget.
  FFUploadedFile? renamedAudioFile;
  // Stores action output result for [Backend Call - API (createTranscription)] action in popup widget.
  ApiCallResponse? whisperResult;
  // Stores action output result for [Backend Call - API (createMessage)] action in popup widget.
  ApiCallResponse? apiMessageCreateResult;
  // Stores action output result for [Backend Call - API (createRun)] action in popup widget.
  ApiCallResponse? apiAssistantRunResult;
  // Stores action output result for [Backend Call - API (getRun)] action in popup widget.
  ApiCallResponse? apiRetrieveRunResult;
  // Stores action output result for [Backend Call - API (listMessages)] action in popup widget.
  ApiCallResponse? apiGetMessagesResult;
  // Stores action output result for [Custom Action - fetchAndPlaySpeech] action in popup widget.
  String? audioPath;

  @override
  void initState(BuildContext context) {
    teacherSelectModel = createModel(context, () => TeacherSelectModel());
    scollingChatColumn = ScrollController();
    chatListView = ScrollController();
    dialogManagerModel = createModel(context, () => DialogManagerModel());
    popupModel = createModel(context, () => PopupModel());
  }

  @override
  void dispose() {
    dialogController?.finish();
    teacherSelectModel.dispose();
    scollingChatColumn?.dispose();
    chatListView?.dispose();
    timerController1.dispose();
    timerController2.dispose();
    dialogManagerModel.dispose();
    popupModel.dispose();
  }

  /// Action blocks.
  Future finishChatting(BuildContext context) async {
    ApiCallResponse? summaryMessages1;
    SummaryObjStruct? summaryOutput1;
    LevelsRecord? subjectLevels;

    while (FFAppState().dialogState == DialogState.AI_talking) {
      logFirebaseEvent('finishChatting_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
    }
    logFirebaseEvent('finishChatting_backend_call');
    summaryMessages1 = await OpenAIAPIGroup.createChatCompletionCall.call(
      messages: valueOrDefault<String>(
        (String var3) {
          return var3
              .replaceAll('\n', ' ')
              .replaceAll(RegExp(r'\s+'), ' ')
              .trim();
        }(valueOrDefault<String>(
          (String var2) {
            return var2.replaceAll('"', '').replaceAll("'", '');
          }(((List<String> var1) {
            return var1.join('message: ');
          }(chatHistory
              .map((e) => getJsonField(
                    e.toMap(),
                    r'''$.content''',
                  ))
              .toList()
              .map((e) => e.toString())
              .toList()
              .toList()))),
          'hi',
        )),
        'hi',
      ),
    );

    logFirebaseEvent('finishChatting_update_app_state');
    FFAppState().onLesson = false;
    FFAppState().update(() {});
    logFirebaseEvent('finishChatting_custom_action');
    summaryOutput1 = await actions.buildSummary(
      OpenAIAPIGroup.createChatCompletionCall.summaryobj1(
        (summaryMessages1.jsonBody ?? ''),
      )!,
    );
    logFirebaseEvent('finishChatting_backend_call');

    await currLesson!.reference.update({
      ...createLessonsRecordData(
        summary: summaryOutput1.summary,
        steps: summaryOutput1.steps,
      ),
      ...mapToFirestore(
        {
          'end_at': FieldValue.serverTimestamp(),
        },
      ),
    });
    logFirebaseEvent('finishChatting_firestore_query');
    subjectLevels = await queryLevelsRecordOnce(
      queryBuilder: (levelsRecord) => levelsRecord
          .where(
            'user',
            isEqualTo: currentUserUid,
          )
          .where(
            'subject',
            isEqualTo:
                widget!.dialogSubject != null && widget!.dialogSubject != ''
                    ? widget!.dialogSubject
                    : 'כללי',
          ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (subjectLevels != null) {
      logFirebaseEvent('finishChatting_backend_call');

      await subjectLevels.reference.update({
        ...mapToFirestore(
          {
            'precent': FieldValue.increment(summaryOutput1.steps),
          },
        ),
      });
    } else {
      logFirebaseEvent('finishChatting_backend_call');

      await LevelsRecord.collection.doc().set(createLevelsRecordData(
            user: currentUserUid,
            subject: valueOrDefault<String>(
              widget!.dialogSubject,
              'כללי',
            ),
            precent: summaryOutput1.steps,
          ));
    }

    logFirebaseEvent('finishChatting_navigate_to');

    context.goNamed(
      'dialog_summary',
      queryParameters: {
        'lastLesson': serializeParam(
          true,
          ParamType.bool,
        ),
        'chatMessages': serializeParam(
          chatHistory,
          ParamType.DataStruct,
          isList: true,
        ),
        'lessonId': serializeParam(
          widget!.lessonId,
          ParamType.String,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 500),
        ),
      },
    );
  }
}
