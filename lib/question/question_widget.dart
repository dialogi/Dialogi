import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/popup_lessons_alert_widget.dart';
import '/components/select_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget>
    with TickerProviderStateMixin {
  late QuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasTextTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'question'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTION_PAGE_question_ON_INIT_STATE');
      logFirebaseEvent('question_action_block');
      unawaited(
        () async {
          await action_blocks.setLang(context);
          safeSetState(() {});
        }(),
      );
      logFirebaseEvent('question_firestore_query');
      _model.userExist = await queryUsersRecordCount(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
      );
    });

    animationsMap.addAll({
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 540.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 540.0.ms,
            duration: 570.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.8, 0.8),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OnboardingQuestionsRecord>>(
      stream: queryOnboardingQuestionsRecord(
        queryBuilder: (onboardingQuestionsRecord) =>
            onboardingQuestionsRecord.where(
          'state',
          isEqualTo: FFAppState().questionNum,
        ),
        singleRecord: true,
      )..listen((snapshot) {
          List<OnboardingQuestionsRecord>
              questionOnboardingQuestionsRecordList = snapshot;
          final questionOnboardingQuestionsRecord =
              questionOnboardingQuestionsRecordList.isNotEmpty
                  ? questionOnboardingQuestionsRecordList.first
                  : null;
          if (_model.questionPreviousSnapshot != null &&
              !const ListEquality(OnboardingQuestionsRecordDocumentEquality())
                  .equals(questionOnboardingQuestionsRecordList,
                      _model.questionPreviousSnapshot)) {
            () async {
              logFirebaseEvent('QUESTION_PAGE_question_ON_DATA_CHANGE');
              logFirebaseEvent('question_firestore_query');
              _model.userAnswerDB = await queryUserAnswersRecordOnce(
                queryBuilder: (userAnswersRecord) => userAnswersRecord.where(
                  'user',
                  isEqualTo: currentUserUid,
                ),
              );
              logFirebaseEvent('question_update_page_state');
              _model.currUserAnswer = _model.userAnswerDB
                  ?.where((e) =>
                      questionOnboardingQuestionsRecord?.key == e.question)
                  .toList()
                  .firstOrNull;
              safeSetState(() {});
              logFirebaseEvent('question_update_page_state');
              _model.answer = [];
              safeSetState(() {});
              logFirebaseEvent('question_update_page_state');
              _model.answer =
                  _model.currUserAnswer!.answer.toList().cast<String>();
              safeSetState(() {});
              logFirebaseEvent('question_set_form_field');
              safeSetState(() {
                _model.choiceChipsValueController?.value = _model.answer;
              });

              safeSetState(() {});
            }();
          }
          _model.questionPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<OnboardingQuestionsRecord> questionOnboardingQuestionsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final questionOnboardingQuestionsRecord =
            questionOnboardingQuestionsRecordList.isNotEmpty
                ? questionOnboardingQuestionsRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFD6DCFF),
                                        Color(0xB0546DEF)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, 1.0),
                                      end: AlignmentDirectional(0, -1.0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FutureBuilder<int>(
                                      future:
                                          queryOnboardingQuestionsRecordCount(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int columnCount = snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 60.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    columnCount.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      key: ValueKey(columnCount
                                                          .toString()),
                                                      valueOrDefault<String>(
                                                        '/${(questionOnboardingQuestionsRecord!.state + 1).toString()}',
                                                        '1/',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 30.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              questionOnboardingQuestionsRecord
                                                                  .title,
                                                              'רמת האנגלית הנוכחית שלך',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: const Color(
                                                                      0xFF232C2E),
                                                                  fontSize: functions
                                                                      .setFontSize(
                                                                          21.0),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              questionOnboardingQuestionsRecord
                                                                  .description,
                                                              'בחרו את התשובה המתאימה',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: const Color(
                                                                      0xFF232C2E),
                                                                  fontSize: functions
                                                                      .setFontSize(
                                                                          14.0),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      1.4,
                                                                ),
                                                          ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'textOnActionTriggerAnimation']!,
                                                              hasBeenTriggered:
                                                                  hasTextTriggered),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/question.svg',
                                                      height: 90.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 40.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 6.5, 0.0, 13.0),
                                              child: Transform.rotate(
                                                angle: 180.0 * (math.pi / 180),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: LinearPercentIndicator(
                                                    percent:
                                                        valueOrDefault<double>(
                                                      FFAppState().questionNum /
                                                          columnCount,
                                                      0.5,
                                                    ),
                                                    lineHeight: 7.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    backgroundColor:
                                                        const Color(0x52546DEF),
                                                    barRadius:
                                                        const Radius.circular(32.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (questionOnboardingQuestionsRecord
                                              ?.answers.type ==
                                          AnswerType.multi_select)
                                        ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 24.0, 24.0, 0.0),
                                              child: FlutterFlowChoiceChips(
                                                options:
                                                    questionOnboardingQuestionsRecord!
                                                        .answers.possibleAnswers
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                      .choiceChipsValues = val);
                                                  logFirebaseEvent(
                                                      'QUESTION_ChoiceChips_c5o7gti8_ON_FORM_WI');
                                                  logFirebaseEvent(
                                                      'ChoiceChips_update_page_state');
                                                  _model.answer = _model
                                                      .choiceChipsValues!
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                  if ((questionOnboardingQuestionsRecord
                                                              .limit !=
                                                          null) &&
                                                      (_model.choiceChipsValues!
                                                              .length >
                                                          questionOnboardingQuestionsRecord
                                                              .limit)) {
                                                    logFirebaseEvent(
                                                        'ChoiceChips_haptic_feedback');
                                                    HapticFeedback.vibrate();
                                                    logFirebaseEvent(
                                                        'ChoiceChips_widget_animation');
                                                    if (animationsMap[
                                                            'textOnActionTriggerAnimation'] !=
                                                        null) {
                                                      safeSetState(() =>
                                                          hasTextTriggered =
                                                              true);
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback((_) async =>
                                                              await animationsMap[
                                                                      'textOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                    }
                                                  }
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: Colors.white,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  iconColor: Colors.white,
                                                  iconSize: 20.0,
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 6.0,
                                                              12.0, 6.0),
                                                  elevation: 0.0,
                                                  borderWidth: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  iconSize: 20.0,
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 6.0,
                                                              12.0, 6.0),
                                                  elevation: 0.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderWidth: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                chipSpacing: 8.0,
                                                rowSpacing: 8.0,
                                                multiselect: true,
                                                initialized:
                                                    _model.choiceChipsValues !=
                                                        null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (questionOnboardingQuestionsRecord
                                              ?.answers.type ==
                                          AnswerType.single_select)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final possible =
                                                  questionOnboardingQuestionsRecord
                                                          ?.answers
                                                          .possibleAnswers
                                                          .toList() ??
                                                      [];

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: possible.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 16.0),
                                                itemBuilder:
                                                    (context, possibleIndex) {
                                                  final possibleItem =
                                                      possible[possibleIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'QUESTION_PAGE_Container_if8wyi02_ON_TAP');
                                                      logFirebaseEvent(
                                                          'select_update_page_state');

                                                      safeSetState(() {});
                                                      if (_model.answer
                                                          .contains(
                                                              possibleItem)) {
                                                        logFirebaseEvent(
                                                            'select_update_page_state');
                                                        _model.answer = [];
                                                        safeSetState(() {});
                                                      } else {
                                                        if ((_model.answer
                                                                .isNotEmpty) ==
                                                            true) {
                                                          logFirebaseEvent(
                                                              'select_update_page_state');
                                                          _model
                                                              .updateAnswerAtIndex(
                                                            0,
                                                            (_) => possibleItem,
                                                          );
                                                          safeSetState(() {});
                                                        } else {
                                                          logFirebaseEvent(
                                                              'select_update_page_state');
                                                          _model.addToAnswer(
                                                              possibleItem);
                                                          safeSetState(() {});
                                                        }
                                                      }
                                                    },
                                                    child: SelectWidget(
                                                      key: Key(
                                                          'Keyif8_${possibleIndex}_of_${possible.length}'),
                                                      checked: _model.answer
                                                              .contains(
                                                                  possibleItem) ==
                                                          true,
                                                      text: possibleItem,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 26.0, 24.0, 40.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent('QUESTION_PAGE__BTN_ON_TAP');
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.answer = [];
                                  safeSetState(() {});
                                  if (FFAppState().questionNum.toString() ==
                                      '0') {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('start_onboarding');
                                  } else {
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().questionNum =
                                        FFAppState().questionNum + -1;
                                    safeSetState(() {});
                                  }

                                  logFirebaseEvent('Button_update_page_state');
                                  _model.answer = [];
                                  _model.currUserAnswer = null;
                                  safeSetState(() {});
                                  if (_model.currUserAnswer != null) {
                                    logFirebaseEvent('Button_set_form_field');
                                    safeSetState(() {
                                      _model.choiceChipsValueController?.value =
                                          _model.answer;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Button_clear_all_select_all');
                                    safeSetState(() => _model
                                        .choiceChipsValueController
                                        ?.value = []);
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4gc0ips9' /* קודם */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(56.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: ((questionOnboardingQuestionsRecord
                                                    ?.limit !=
                                                null) &&
                                            (questionOnboardingQuestionsRecord
                                                    ?.limit !=
                                                0)
                                        ? (questionOnboardingQuestionsRecord
                                                ?.limit
                                                .toString() !=
                                            _model.answer.length.toString())
                                        : (((_model.answer.isNotEmpty) ==
                                                false) &&
                                            (questionOnboardingQuestionsRecord
                                                    ?.key !=
                                                'מגדר')))
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'QUESTION_PAGE__BTN_ON_TAP');
                                        var shouldSetState = false;
                                        if (_model.currUserAnswer != null) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await _model.currUserAnswer!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'answer': _model.answer,
                                              },
                                            ),
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await UserAnswersRecord.collection
                                              .doc()
                                              .set({
                                            ...createUserAnswersRecordData(
                                              question:
                                                  questionOnboardingQuestionsRecord
                                                      ?.key,
                                              user: currentUserUid,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'answer': _model.answer,
                                              },
                                            ),
                                          });
                                        }

                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.answer = [];
                                        safeSetState(() {});
                                        if (_model.userExist.toString() !=
                                            '1') {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().log = '3';
                                          safeSetState(() {});
                                          logFirebaseEvent('Button_auth');
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signOut();
                                          GoRouter.of(context)
                                              .clearRedirectLocation();

                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamedAuth(
                                              'login', context.mounted);

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }
                                        if (questionOnboardingQuestionsRecord
                                                ?.lastQuestion ==
                                            true) {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().log = '20';
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_firestore_query');
                                          _model.gender1 =
                                              await queryUserAnswersRecordOnce(
                                            queryBuilder: (userAnswersRecord) =>
                                                userAnswersRecord
                                                    .where(
                                                      'user',
                                                      isEqualTo: currentUserUid,
                                                    )
                                                    .where(
                                                      'question',
                                                      isEqualTo: 'מגדר',
                                                    ),
                                            limit: 1,
                                          );
                                          shouldSetState = true;
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().log = 'hbhjbhbh';
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().log = 'ytybh';
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            gender: () {
                                              if (!(_model.gender1!.firstOrNull!
                                                  .answer.isNotEmpty)) {
                                                return Gender.male;
                                              } else if (_model
                                                      .gender1
                                                      ?.firstOrNull
                                                      ?.answer
                                                      .firstOrNull ==
                                                  'נקבה') {
                                                return Gender.female;
                                              } else {
                                                return Gender.male;
                                              }
                                            }(),
                                          ));
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.popupLessonNotification = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().questionNum =
                                              FFAppState().questionNum + 1;
                                          safeSetState(() {});
                                        }

                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.answer = [];
                                        _model.currUserAnswer = null;
                                        safeSetState(() {});
                                        if (_model.currUserAnswer != null) {
                                          logFirebaseEvent(
                                              'Button_set_form_field');
                                          safeSetState(() {
                                            _model.choiceChipsValueController
                                                ?.value = _model.answer;
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'Button_clear_all_select_all');
                                          safeSetState(() => _model
                                              .choiceChipsValueController
                                              ?.value = []);
                                        }

                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                      },
                                text: FFLocalizations.of(context).getText(
                                  '7gdcs4kc' /* המשך */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(56.0),
                                  disabledColor: const Color(0xFFE8ECEF),
                                  disabledTextColor: const Color(0xFF95A5A6),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_model.popupLessonNotification)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(
                      color: Color(0x71000000),
                    ),
                    child: wrapWithModel(
                      model: _model.popupLessonsAlertModel,
                      updateCallback: () => safeSetState(() {}),
                      child: PopupLessonsAlertWidget(
                        title: 'תזכורת לשיעורים',
                        subTitle:
                            'רגע לפני שאנחנו מסיימים את השאלון - נקבע שעה שבה תקבל תזכורת לשיעורים',
                        button: 'סיום השאלון',
                        onClick: () async {
                          logFirebaseEvent(
                              'QUESTION_Container_5hzz9psj_CALLBACK');
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
