import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_btn_widget.dart';
import '/components/primary_btn_widget.dart';
import '/components/teacher_select_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dialog_summary_model.dart';
export 'dialog_summary_model.dart';

class DialogSummaryWidget extends StatefulWidget {
  const DialogSummaryWidget({
    super.key,
    required this.lastLesson,
    this.chatMessages,
    String? lessonId,
    bool? profile,
  })  : lessonId = lessonId ?? 'lessonId',
        profile = profile ?? false;

  final bool? lastLesson;
  final List<MessageStruct>? chatMessages;
  final String lessonId;
  final bool profile;

  @override
  State<DialogSummaryWidget> createState() => _DialogSummaryWidgetState();
}

class _DialogSummaryWidgetState extends State<DialogSummaryWidget> {
  late DialogSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogSummaryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'dialog_summary'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LessonsRecord>>(
      stream: queryLessonsRecord(
        queryBuilder: (lessonsRecord) => lessonsRecord
            .where(
              'user',
              isEqualTo: currentUserUid,
            )
            .where(
              'lessonId',
              isEqualTo: widget.lessonId,
            ),
        singleRecord: true,
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
        List<LessonsRecord> dialogSummaryLessonsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final dialogSummaryLessonsRecord =
            dialogSummaryLessonsRecordList.isNotEmpty
                ? dialogSummaryLessonsRecordList.first
                : null;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 60.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            if (widget.profile)
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'DIALOG_SUMMARY_arrow_back_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamed(
                                    'profile',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 700),
                                      ),
                                    },
                                  );
                                },
                              ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zqep0wmv' /* שיחה */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: functions.setFontSize(24.0),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Color(0x64FFFFFF),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 21.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.teacherSelectModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: Hero(
                                        tag: '',
                                        transitionOnUserGestures: true,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TeacherSelectWidget(
                                            selected: true,
                                            imgWidth: 50.0,
                                            teacherImg:
                                                dialogSummaryLessonsRecord!
                                                    .teacher.name,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FutureBuilder<int>(
                                          future: queryLessonsRecordCount(
                                            queryBuilder: (lessonsRecord) =>
                                                lessonsRecord.where(
                                              'user',
                                              isEqualTo: currentUserUid,
                                            ),
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
                                            int textCount = snapshot.data!;

                                            return Text(
                                              'שיעור מס’ ${textCount.toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color: Colors.white,
                                                        fontSize: functions
                                                            .setFontSize(16.0),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        lineHeight: 1.5,
                                                      ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'מורה: ${dialogSummaryLessonsRecord.teacher.name}',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  color: Colors.white,
                                                  fontSize: functions
                                                      .setFontSize(14.0),
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.42,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 600.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Color(0xFF707F80),
                                      size: 18.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'fegks4us' /* השיעור הסתיים. כל הכבוד! */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: const Color(0xFF707F80),
                                          fontSize: functions.setFontSize(18.0),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'y3awxofa' /* הגשמת מטרות אישיות */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: functions.setFontSize(24.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.5,
                                  ),
                            ),
                            Text(
                              'השלמת עוד ${(dialogSummaryLessonsRecord.steps % 100).toString()}% מהדרך',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF707F80),
                                    fontSize: functions.setFontSize(14.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            Container(
                              width: 173.0,
                              constraints: const BoxConstraints(
                                maxWidth: 173.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 29.0),
                                  child: LinearPercentIndicator(
                                    percent:
                                        dialogSummaryLessonsRecord.steps / 100,
                                    lineHeight: 8.0,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    progressColor: const Color(0xFF6ABE62),
                                    backgroundColor: const Color(0xFFE2E4EF),
                                    barRadius: const Radius.circular(56.0),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 41.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: const Color(0xFFE8E8E8),
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 12.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'epc1gnmn' /* סיכום שיחה */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize:
                                                    functions.setFontSize(20.0),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.6,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 12.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dialogSummaryLessonsRecord.summary,
                                            'השיחה נסגרה באמצע- מומלץ בפעם הבאה לסיים אותה בכפתור לפני יציאה מהאפליקציה',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color: const Color(0xFF707F80),
                                                fontSize:
                                                    functions.setFontSize(16.0),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.6,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (widget.chatMessages != null &&
                                (widget.chatMessages)!.isNotEmpty)
                              Stack(
                                alignment: const AlignmentDirectional(-0.0, 0.0),
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DIALOG_SUMMARY_Image_57r86dqv_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_firestore_query');
                                            _model.lastLesson =
                                                await queryLessonsRecordOnce(
                                              queryBuilder: (lessonsRecord) =>
                                                  lessonsRecord
                                                      .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserUid,
                                                      )
                                                      .orderBy('start_at',
                                                          descending: true),
                                              limit: 1,
                                            );
                                            logFirebaseEvent(
                                                'Image_navigate_to');
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              'on_dialog_chat',
                                              queryParameters: {
                                                'chatMessages': serializeParam(
                                                  widget.chatMessages,
                                                  ParamType.DataStruct,
                                                  isList: true,
                                                ),
                                                'dialogSubject': serializeParam(
                                                  '',
                                                  ParamType.String,
                                                ),
                                                'lessonId': serializeParam(
                                                  widget.lessonId,
                                                  ParamType.String,
                                                ),
                                                'assistantId': serializeParam(
                                                  FFAppConstants.assistant1,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .topToBottom,
                                                  duration: Duration(
                                                      milliseconds: 700),
                                                ),
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/messages.svg',
                                              width: 34.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '5b905i4l' /* * זמן הצפייה בתמלול מוגבל בזמן */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color: const Color(0xFF95A5A6),
                                                fontSize:
                                                    functions.setFontSize(14.0),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 28.0)),
                                  ),
                                ],
                              ),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DIALOG_SUMMARY_Container_vn7sl47e_ON_TAP');
                                            logFirebaseEvent(
                                                'primaryBtn_navigate_to');

                                            context.pushNamed(
                                              'start_dialog',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                ),
                                              },
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model.primaryBtnModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: const PrimaryBtnWidget(
                                              text: 'התחלת שיעור חדש',
                                              phone: true,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DIALOG_SUMMARY_Container_y88s0y0s_ON_TAP');
                                            logFirebaseEvent(
                                                'newBtn_navigate_to');

                                            context.pushNamed(
                                              'homepage',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                ),
                                              },
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model.newBtnModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: const NewBtnWidget(
                                              text: 'מעבר למסך הבית',
                                              home: true,
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 20.0))
                                          .addToEnd(const SizedBox(height: 52.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
}
