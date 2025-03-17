import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/popup_widget.dart';
import '/components/teacher_select_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/start_lesson.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'start_dialog_model.dart';
export 'start_dialog_model.dart';

class StartDialogWidget extends StatefulWidget {
  const StartDialogWidget({
    super.key,
    this.subject,
    bool? walkthrow,
  }) : this.walkthrow = walkthrow ?? false;

  final String? subject;
  final bool walkthrow;

  static String routeName = 'start_dialog';
  static String routePath = '/startDialog';

  @override
  State<StartDialogWidget> createState() => _StartDialogWidgetState();
}

class _StartDialogWidgetState extends State<StartDialogWidget>
    with TickerProviderStateMixin {
  late StartDialogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartDialogModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'start_dialog'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('START_DIALOG_start_dialog_ON_INIT_STATE');
      if (widget.walkthrow) {
        logFirebaseEvent('start_dialog_start_walkthrough');
        safeSetState(() =>
            _model.startLessonController = createPageWalkthrough(context));
        _model.startLessonController?.show(context: context);
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1230.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.175,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1230.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1230.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.175,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserAnswersRecord>>(
      stream: _model.answers(
        requestFn: () => queryUserAnswersRecord(
          queryBuilder: (userAnswersRecord) => userAnswersRecord
              .where(
                'user',
                isEqualTo: currentUserUid,
              )
              .orderBy('question'),
        ),
      ),
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
        List<UserAnswersRecord> startDialogUserAnswersRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    'שלום ${(String var1) {
                                      return var1.split(' ')[0];
                                    }(currentUserDisplayName)}!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: Colors.white,
                                          fontSize: functions.setFontSize(20.0),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.6,
                                        ),
                                  ),
                                ),
                              ),
                              if (widget.subject != null &&
                                  widget.subject != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'START_DIALOG_PAGE_arrow_back_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.goNamed(
                                        HomepageWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 700),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 52.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (widget.subject != null &&
                                      widget.subject != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'תרגול שיעור הגייה בנושא: ${widget.subject}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: Color(0xFF232C2E),
                                              fontSize:
                                                  functions.setFontSize(20.0),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.5,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation1']!),
                                    ),
                                  Lottie.asset(
                                    'assets/jsons/listen.json',
                                    width: 277.0,
                                    height: 247.0,
                                    fit: BoxFit.cover,
                                    animate: true,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDocument?.gender ==
                                                Gender.female
                                            ? 'עם איזה מורה תרצי לדבר?'
                                            : 'עם איזה מורה תרצה לדבר?',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: Color(0xFF232C2E),
                                              fontSize:
                                                  functions.setFontSize(24.0),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              lineHeight: 1.5,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation2']!),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'bdnitpy6' /* בחר את האפשרות שמתאימה לך */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: Color(0xFF232C2E),
                                            fontSize:
                                                functions.setFontSize(16.0),
                                            letterSpacing: 0.0,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 28.0, 0.0, 0.0),
                                        child: FutureBuilder<
                                            List<TeacherNewRecord>>(
                                          future: FFAppState().getTeachers(
                                            requestFn: () =>
                                                queryTeacherNewRecordOnce(),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TeacherNewRecord>
                                                gridViewTeacherNewRecordList =
                                                snapshot.data!;

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                childAspectRatio: 1.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewTeacherNewRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewTeacherNewRecord =
                                                    gridViewTeacherNewRecordList[
                                                        gridViewIndex];
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
                                                        'START_DIALOG_Container_fvmyhnie_ON_TAP');
                                                    if (_model
                                                            .teacherSelected ==
                                                        gridViewTeacherNewRecord
                                                            .name) {
                                                      logFirebaseEvent(
                                                          'TeacherSelect_update_page_state');
                                                      _model.teacherSelected =
                                                          null;
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'TeacherSelect_update_page_state');
                                                      _model.teacherSelected =
                                                          gridViewTeacherNewRecord
                                                              .name;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'TeacherSelect_update_page_state');
                                                      _model.teacherObj =
                                                          TeachersObjStruct(
                                                        image:
                                                            gridViewTeacherNewRecord
                                                                .image,
                                                        name: _model
                                                            .teacherSelected,
                                                        voice:
                                                            gridViewTeacherNewRecord
                                                                .voice,
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: TeacherSelectWidget(
                                                    key: Key(
                                                        'Keyfvm_${gridViewIndex}_of_${gridViewTeacherNewRecordList.length}'),
                                                    selected: _model
                                                            .teacherSelected ==
                                                        gridViewTeacherNewRecord
                                                            .name,
                                                    name:
                                                        valueOrDefault<String>(
                                                      gridViewTeacherNewRecord
                                                          .name,
                                                      'dewd',
                                                    ),
                                                    imgWidth: 56.0,
                                                    teacherImg:
                                                        gridViewTeacherNewRecord
                                                            .name,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ).addWalkthrough(
                                    columnW1z0v1kz,
                                    _model.startLessonController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'START_DIALOG_PAGE_Stack_mr49rejh_ON_TAP');
                                if (_model.teacherSelected != null &&
                                    _model.teacherSelected != '') {
                                  if (!valueOrDefault<bool>(
                                      currentUserDocument?.walkthrow, false)) {
                                    logFirebaseEvent('Stack_update_app_state');
                                    FFAppState().startPopup = false;
                                    safeSetState(() {});
                                    logFirebaseEvent('Stack_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: PopupWidget(
                                              title:
                                                  'הנחיות לשיחה עם המורה הוירטואלי',
                                              instructions: [
                                                "בחרו סביבה שקטה – למיקוד ללא הפרעות.",
                                                "השתמשו באוזניות – לשמיעה ודיבור ברורים יותר. (מומלץ)",
                                                "דברו בבירור – בקצב רגוע כדי שהמורה יבין אותך היטב.",
                                                "קבלו פידבק – השתמשו במשוב לשיפור מתמיד.",
                                                "אל תפחדו לטעות – זה חלק מהלמידה!"
                                              ],
                                              button:
                                                  currentUserDocument?.gender ==
                                                          Gender.female
                                                      ? 'התחילי שיעור'
                                                      : 'התחל שיעור',
                                              onClick: () async {
                                                logFirebaseEvent(
                                                    '_action_block');
                                                await _model.rtt(context);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    if (FFAppState().userSub.subId == '0') {
                                      logFirebaseEvent('Stack_action_block');
                                      await action_blocks
                                          .userSubscriptionLoad(context);
                                      safeSetState(() {});
                                      if (FFAppState().userSub.subId == '0') {
                                        logFirebaseEvent('Stack_action_block');
                                        await action_blocks
                                            .paywallRevenueCat(context);
                                        safeSetState(() {});
                                      }
                                    }
                                    if (FFAppState().userSub.subId != '0') {
                                      logFirebaseEvent('Stack_firestore_query');
                                      _model.lastestLessonsWeek =
                                          await queryLessonsRecordCount(
                                        queryBuilder: (lessonsRecord) =>
                                            lessonsRecord
                                                .where(
                                                  'user',
                                                  isEqualTo: currentUserUid,
                                                )
                                                .where(
                                                  'start_at',
                                                  isGreaterThanOrEqualTo:
                                                      FFAppState().LastWeekSub,
                                                )
                                                .where(
                                                  'first',
                                                  isEqualTo: false,
                                                )
                                                .orderBy('start_at',
                                                    descending: true),
                                      );
                                      logFirebaseEvent(
                                          'Stack_update_app_state');
                                      FFAppState().startPopup = false;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Stack_update_app_state');
                                      FFAppState().lessonEnable = _model
                                              .lastestLessonsWeek! <
                                          FFAppState().userSub.frequencyPerWeek;
                                      FFAppState().update(() {});
                                      if ((FFAppState().userSub.name ==
                                              'Champion') &&
                                          !FFAppState().lessonEnable) {
                                        logFirebaseEvent('Stack_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: PopupWidget(
                                                  title: 'איזה טירוף!!!',
                                                  subTitle:
                                                      'תרגלת המון השבוע, התמדה זה המפתח!',
                                                  footer: 'לא בושה לנוח קצת...',
                                                  onClick: () async {},
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        if ((FFAppState().lessonEnable ==
                                                true) ||
                                            widget.walkthrow) {
                                          logFirebaseEvent(
                                              'Stack_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: PopupWidget(
                                                    title:
                                                        'הנחיות לשיחה עם המורה הוירטואלי',
                                                    instructions: [
                                                      "בחרו סביבה שקטה – למיקוד ללא הפרעות.",
                                                      "השתמשו באוזניות – לשמיעה ודיבור ברורים יותר. (מומלץ)",
                                                      "דברו בבירור – בקצב רגוע כדי שהמורה יבין אותך היטב.",
                                                      "קבלו פידבק – השתמשו במשוב לשיפור מתמיד.",
                                                      "אל תפחדו לטעות – זה חלק מהלמידה!"
                                                    ],
                                                    button: currentUserDocument
                                                                ?.gender ==
                                                            Gender.female
                                                        ? 'התחילי שיעור'
                                                        : 'התחל שיעור',
                                                    onClick: () async {
                                                      logFirebaseEvent(
                                                          '_action_block');
                                                      await _model.rtt(context);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Stack_action_block');
                                          await action_blocks
                                              .paywallRevenueCat(context);
                                          safeSetState(() {});
                                        }
                                      }
                                    }
                                  }
                                }

                                safeSetState(() {});
                              },
                              child: Stack(
                                children: [
                                  FFButtonWidget(
                                    onPressed:
                                        (_model.teacherSelected == null ||
                                                _model.teacherSelected == '')
                                            ? null
                                            : () {
                                                print('Button pressed ...');
                                              },
                                    text: FFLocalizations.of(context).getText(
                                      '4g2ls3jt' /*  */,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 40.0, 0.0),
                                      iconAlignment: IconAlignment.start,
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: Colors.white,
                                            fontSize:
                                                functions.setFontSize(16.0),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(56.0),
                                      disabledColor: Color(0xFFE8ECEF),
                                      disabledTextColor: Color(0xFF95A5A6),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/phone_call.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5a4mjtyz' /* התחלת שיחה */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Rubik',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: functions
                                                          .setFontSize(16.0),
                                                      letterSpacing: 0.0,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 32.0)),
                      ),
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

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.startLessonController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
