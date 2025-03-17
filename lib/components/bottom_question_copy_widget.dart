import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/select_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'bottom_question_copy_model.dart';
export 'bottom_question_copy_model.dart';

class BottomQuestionCopyWidget extends StatefulWidget {
  const BottomQuestionCopyWidget({
    super.key,
    required this.englishLevel,
  });

  final List<EnglishLevelRecord>? englishLevel;

  @override
  State<BottomQuestionCopyWidget> createState() =>
      _BottomQuestionCopyWidgetState();
}

class _BottomQuestionCopyWidgetState extends State<BottomQuestionCopyWidget>
    with TickerProviderStateMixin {
  late BottomQuestionCopyModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomQuestionCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOTTOM_QUESTION_COPY_bottomQuestionCopy_');
      logFirebaseEvent('bottomQuestionCopy_firestore_query');
      _model.userAnswer = await queryUserAnswersRecordOnce(
        queryBuilder: (userAnswersRecord) => userAnswersRecord
            .where(
              'question',
              isEqualTo: 'רמת אנגלית',
            )
            .where(
              'user',
              isEqualTo: currentUserUid,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('bottomQuestionCopy_update_component_stat');
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
            offset: Offset(0.0, 0.0),
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
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
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
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
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
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                constraints: BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  border: Border.all(
                    color: Color(0xFFF5FBFB),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_QUESTION_COPY_Icon_dcu1xbu5_ON_TA');
                                logFirebaseEvent(
                                    'Icon_close_dialog_drawer_etc');
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FFIcons.kcarbonCloseOutline,
                                color: Color(0xFF95A5A6),
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                75.0, 0.0, 75.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 36.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'hh7irsb0' /* שינוי רמת אנגלית */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: Color(0xFF232C2E),
                                          fontSize: functions.setFontSize(24.0),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'p4ww83t9' /* *רמת השיעורים תשתנה בהתאם לבחי... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Color(0xFF797979),
                                        fontSize: functions.setFontSize(16.0),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.5,
                                      ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'textOnActionTriggerAnimation']!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                      child: StreamBuilder<List<EnglishLevelRecord>>(
                        stream: queryEnglishLevelRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<EnglishLevelRecord>
                              listViewEnglishLevelRecordList = snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewEnglishLevelRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 20.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewEnglishLevelRecord =
                                  listViewEnglishLevelRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'BOTTOM_QUESTION_COPY_Container_ef4xo15v_');
                                  if (_model.answer.contains(
                                      listViewEnglishLevelRecord.value)) {
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
                                        0, listViewEnglishLevelRecord.value);
                                    safeSetState(() {});
                                  }
                                },
                                child: SelectWidget(
                                  key: Key(
                                      'Keyef4_${listViewIndex}_of_${listViewEnglishLevelRecordList.length}'),
                                  checked: _model.answer.contains(
                                      listViewEnglishLevelRecord.value),
                                  text: listViewEnglishLevelRecord.text,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 40.0),
                      child: FFButtonWidget(
                        onPressed: !(_model.answer.isNotEmpty)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'BOTTOM_QUESTION_COPY_COMP__BTN_ON_TAP');
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
                          'js52ea9q' /* עדכן */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Rubik',
                                    fontSize: functions.setFontSize(16.0),
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(56.0),
                          disabledColor: Color(0xFFE8ECEF),
                          disabledTextColor: Color(0xFF95A5A6),
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
