import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/select_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'bottom_question_model.dart';
export 'bottom_question_model.dart';

class BottomQuestionWidget extends StatefulWidget {
  const BottomQuestionWidget({
    super.key,
    required this.question,
  });

  final OnboardingQuestionsRecord? question;

  @override
  State<BottomQuestionWidget> createState() => _BottomQuestionWidgetState();
}

class _BottomQuestionWidgetState extends State<BottomQuestionWidget>
    with TickerProviderStateMixin {
  late BottomQuestionModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomQuestionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOTTOM_QUESTION_bottomQuestion_ON_INIT_S');
      logFirebaseEvent('bottomQuestion_firestore_query');
      _model.userAnswer = await queryUserAnswersRecordOnce(
        queryBuilder: (userAnswersRecord) => userAnswersRecord
            .where(
              'question',
              isEqualTo: widget.question?.key,
            )
            .where(
              'user',
              isEqualTo: currentUserUid,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('bottomQuestion_set_form_field');
      safeSetState(() {
        _model.choiceChipsValueController?.value = _model.userAnswer!.answer;
      });
      logFirebaseEvent('bottomQuestion_update_component_state');
      _model.answer = _model.userAnswer!.answer.toList().cast<String>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 510.0.ms,
            hz: 4,
            offset: const Offset(0.0, 0.0),
            rotation: 0.052,
          ),
        ],
      ),
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 670.0.ms,
            duration: 450.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.2, 1.2),
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 110.0.ms,
            duration: 2500.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.349,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1440.0.ms,
            duration: 400.0.ms,
            begin: const Offset(1.2, 1.2),
            end: const Offset(1.0, 1.0),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                constraints: const BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  border: Border.all(
                    color: const Color(0xFFF5FBFB),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_QUESTION_Icon_6spege3l_ON_TAP');
                                logFirebaseEvent(
                                    'Icon_close_dialog_drawer_etc');
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                FFIcons.kcarbonCloseOutline,
                                color: Color(0xFF95A5A6),
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                75.0, 0.0, 75.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 36.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.question?.title,
                                      'title',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: const Color(0xFF232C2E),
                                          fontSize: functions.setFontSize(24.0),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.question?.description,
                                      'description',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: const Color(0xFF797979),
                                          fontSize: functions.setFontSize(16.0),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.5,
                                        ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'textOnActionTriggerAnimation']!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.question?.answers.type ==
                              AnswerType.multi_select)
                            Flexible(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 14.0, 24.0, 24.0),
                                    child: FlutterFlowChoiceChips(
                                      options: widget
                                          .question!.answers.possibleAnswers
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.choiceChipsValues = val);
                                        logFirebaseEvent(
                                            'BOTTOM_QUESTION_ChoiceChips_huzuk6ve_ON_');
                                        logFirebaseEvent(
                                            'ChoiceChips_update_component_state');
                                        _model.answer = _model
                                            .choiceChipsValues!
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        if (widget.question!.hasLimit() &&
                                            (_model.choiceChipsValues!.length >
                                                widget.question!.limit)) {
                                          logFirebaseEvent(
                                              'ChoiceChips_widget_animation');
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'containerOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          logFirebaseEvent(
                                              'ChoiceChips_widget_animation');
                                          if (animationsMap[
                                                  'textOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'textOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                        }
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontSize:
                                                  functions.setFontSize(18.0),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 20.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 6.0, 12.0, 6.0),
                                        elevation: 0.0,
                                        borderWidth: 1.0,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize:
                                                  functions.setFontSize(18.0),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        iconSize: 20.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 6.0, 12.0, 6.0),
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderWidth: 1.0,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      chipSpacing: 8.0,
                                      rowSpacing: 8.0,
                                      multiselect: true,
                                      initialized:
                                          _model.choiceChipsValues != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        _model.answer,
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (widget.question?.answers.type ==
                        AnswerType.single_select)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 0.0, 40.0),
                        child: Builder(
                          builder: (context) {
                            final possible = widget
                                    .question?.answers.possibleAnswers
                                    .toList() ??
                                [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: possible.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 20.0),
                              itemBuilder: (context, possibleIndex) {
                                final possibleItem = possible[possibleIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BOTTOM_QUESTION_Container_06z611ct_ON_TA');
                                    if (_model.answer.contains(possibleItem)) {
                                      logFirebaseEvent(
                                          'select_update_component_state');
                                      _model.answer = [];
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'select_update_component_state');
                                      _model.answer = [];
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'select_update_component_state');
                                      _model.insertAtIndexInAnswer(
                                          0, possibleItem);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: SelectWidget(
                                    key: Key(
                                        'Key06z_${possibleIndex}_of_${possible.length}'),
                                    checked:
                                        _model.answer.contains(possibleItem),
                                    text: possibleItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 40.0),
                      child: FFButtonWidget(
                        onPressed: ((widget.question?.limit.toString() !=
                                            null &&
                                        widget.question?.limit.toString() !=
                                            '') &&
                                    (widget.question?.limit.toString() != '0')
                                ? (valueOrDefault<String>(
                                      widget.question?.limit.toString(),
                                      'title',
                                    ) !=
                                    _model.choiceChipsValues?.length.toString())
                                : !(_model.answer.isNotEmpty))
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'BOTTOM_QUESTION_COMP__BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await _model.userAnswer!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'answer': _model.answer,
                                    },
                                  ),
                                });
                                logFirebaseEvent(
                                    'Button_close_dialog_drawer_etc');
                                Navigator.pop(context);
                              },
                        text: FFLocalizations.of(context).getText(
                          'jrbba0gz' /* עדכן */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Rubik',
                                    fontSize: functions.setFontSize(16.0),
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
                      ),
                    ),
                  ],
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
