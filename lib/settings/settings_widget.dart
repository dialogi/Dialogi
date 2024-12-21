import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/bottom_question_copy_widget.dart';
import '/components/bottom_question_widget.dart';
import '/components/popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'settings'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SETTINGS_PAGE_settings_ON_INIT_STATE');
      logFirebaseEvent('settings_action_block');
      await action_blocks.setLang(context);
      safeSetState(() {});
    });

    _model.textController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue1 =
        valueOrDefault<bool>(currentUserDocument?.lessonsAlert, false);
    _model.switchValue2 =
        valueOrDefault<bool>(currentUserDocument?.notification, false);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5kd8b0gs' /* הגדרות */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            ),
            Flexible(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 600.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 17.0, 24.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 88.0,
                                  height: 88.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 88.0,
                                        height: 88.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          currentUserPhoto,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 260.0,
                              height: 40.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => SizedBox(
                                          width: 250.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                logFirebaseEvent(
                                                    'SETTINGS_TextField_1brcdc42_ON_TEXTFIELD');
                                                logFirebaseEvent(
                                                    'TextField_backend_call');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  displayName: _model
                                                      .textController.text,
                                                ));
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'lzn2kvmu' /* TextField */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x8357636C),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: functions
                                                      .setFontSize(20.0),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.0,
                                                ),
                                            textAlign: TextAlign.center,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.pencilAlt,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 22.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: StreamBuilder<
                                        List<OnboardingQuestionsRecord>>(
                                      stream: queryOnboardingQuestionsRecord(
                                        queryBuilder:
                                            (onboardingQuestionsRecord) =>
                                                onboardingQuestionsRecord.where(
                                          'key',
                                          isEqualTo: 'תחומי עניין',
                                        ),
                                        singleRecord: true,
                                      ),
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
                                        List<OnboardingQuestionsRecord>
                                            rowOnboardingQuestionsRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final rowOnboardingQuestionsRecord =
                                            rowOnboardingQuestionsRecordList
                                                    .isNotEmpty
                                                ? rowOnboardingQuestionsRecordList
                                                    .first
                                                : null;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_Row_3iqi3o1q_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  const Color(0x4D000000),
                                              barrierColor: const Color(0x4D000000),
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: BottomQuestionWidget(
                                                      question:
                                                          rowOnboardingQuestionsRecord!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ae22v0be' /* העדפות תחומי עניין */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Rubik',
                                                      color: const Color(0xFF5F5F60),
                                                      fontSize: functions
                                                          .setFontSize(18.0),
                                                      letterSpacing: 0.0,
                                                      lineHeight: 1.77,
                                                    ),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SETTINGS_PAGE_Row_tuikp5z4_ON_TAP');
                                      logFirebaseEvent('Row_firestore_query');
                                      _model.englishLevelDocs =
                                          await queryEnglishLevelRecordOnce();
                                      logFirebaseEvent('Row_bottom_sheet');
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: const Color(0x4D000000),
                                        barrierColor: const Color(0x4D000000),
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: BottomQuestionCopyWidget(
                                                englishLevel:
                                                    _model.englishLevelDocs!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'lps9l0b0' /* שינוי רמת אנגלית */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color: const Color(0xFF5F5F60),
                                                fontSize:
                                                    functions.setFontSize(18.0),
                                                letterSpacing: 0.0,
                                                lineHeight: 1.77,
                                              ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 10.0),
                                    child: StreamBuilder<
                                        List<OnboardingQuestionsRecord>>(
                                      stream: queryOnboardingQuestionsRecord(
                                        queryBuilder:
                                            (onboardingQuestionsRecord) =>
                                                onboardingQuestionsRecord.where(
                                          'key',
                                          isEqualTo: 'מניע',
                                        ),
                                        singleRecord: true,
                                      ),
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
                                        List<OnboardingQuestionsRecord>
                                            rowOnboardingQuestionsRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final rowOnboardingQuestionsRecord =
                                            rowOnboardingQuestionsRecordList
                                                    .isNotEmpty
                                                ? rowOnboardingQuestionsRecordList
                                                    .first
                                                : null;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_Row_hxvui0u4_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  const Color(0x4C000000),
                                              barrierColor: const Color(0x4C000000),
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: BottomQuestionWidget(
                                                      question:
                                                          rowOnboardingQuestionsRecord!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fewzb0vf' /* יעדים ומטרות */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF5F5F60),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        18.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight:
                                                                    1.77,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 34.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      444.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  UserAnswersRecord>>(
                                                            stream:
                                                                queryUserAnswersRecord(
                                                              queryBuilder:
                                                                  (userAnswersRecord) =>
                                                                      userAnswersRecord
                                                                          .where(
                                                                            'user',
                                                                            isEqualTo:
                                                                                currentUserUid,
                                                                          )
                                                                          .where(
                                                                            'question',
                                                                            isEqualTo:
                                                                                rowOnboardingQuestionsRecord?.key,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<UserAnswersRecord>
                                                                  textUserAnswersRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textUserAnswersRecord =
                                                                  textUserAnswersRecordList
                                                                          .isNotEmpty
                                                                      ? textUserAnswersRecordList
                                                                          .first
                                                                      : null;

                                                              return Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  textUserAnswersRecord
                                                                      ?.answer
                                                                      .firstOrNull,
                                                                  'goal',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          functions
                                                                              .setFontSize(16.0),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 24.0)),
                                                  ),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SETTINGS_PAGE_Row_l0t03mji_ON_TAP');
                                        logFirebaseEvent(
                                            'Row_date_time_picker');
                                        await showModalBottomSheet<bool>(
                                            context: context,
                                            builder: (context) {
                                              return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .time,
                                                  minimumDate: DateTime(1900),
                                                  initialDateTime:
                                                      (currentUserDocument
                                                              ?.notificationsTime ??
                                                          DateTime.now()),
                                                  maximumDate: DateTime(2050),
                                                  use24hFormat: false,
                                                  onDateTimeChanged:
                                                      (newDateTime) =>
                                                          safeSetState(() {
                                                    _model.datePicked =
                                                        newDateTime;
                                                  }),
                                                ),
                                              );
                                            });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1f2a6tse' /* תזכורות לשיעורים */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color:
                                                              const Color(0xFF5F5F60),
                                                          fontSize: functions
                                                              .setFontSize(
                                                                  18.0),
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.77,
                                                        ),
                                                  ),
                                                  Container(
                                                    height: 34.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              444.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          _model.datePicked !=
                                                                  null
                                                              ? dateTimeFormat(
                                                                  "Hm",
                                                                  _model
                                                                      .datePicked,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                              : dateTimeFormat(
                                                                  "Hm",
                                                                  currentUserDocument!
                                                                      .notificationsTime!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        16.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) =>
                                                Switch.adaptive(
                                              value: _model.switchValue1!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .switchValue1 = newValue);
                                                if (newValue) {
                                                  logFirebaseEvent(
                                                      'SETTINGS_Switch_nab1hlno_ON_TOGGLE_ON');
                                                  logFirebaseEvent(
                                                      'Switch_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    lessonsAlert: true,
                                                  ));
                                                } else {
                                                  logFirebaseEvent(
                                                      'SETTINGS_Switch_nab1hlno_ON_TOGGLE_OFF');
                                                  logFirebaseEvent(
                                                      'Switch_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    lessonsAlert: false,
                                                  ));
                                                }
                                              },
                                              activeColor: Colors.white,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ivz59lac' /* התראות */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: const Color(0xFF5F5F60),
                                              fontSize:
                                                  functions.setFontSize(18.0),
                                              letterSpacing: 0.0,
                                              lineHeight: 1.77,
                                            ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue2!,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                .switchValue2 = newValue);
                                            if (newValue) {
                                              logFirebaseEvent(
                                                  'SETTINGS_Switch_7qdwwnvo_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'Switch_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notification: true,
                                              ));
                                            } else {
                                              logFirebaseEvent(
                                                  'SETTINGS_Switch_7qdwwnvo_ON_TOGGLE_OFF');
                                              logFirebaseEvent(
                                                  'Switch_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notification: false,
                                              ));
                                            }
                                          },
                                          activeColor: Colors.white,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if ((dateTimeFormat(
                                                "Hm",
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ) !=
                                              '') &&
                                      (dateTimeFormat(
                                            "Hm",
                                            _model.datePicked,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ) !=
                                          dateTimeFormat(
                                            "Hm",
                                            currentUserDocument
                                                ?.notificationsTime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: (dateTimeFormat(
                                                    "Hm",
                                                    _model.datePicked,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ) ==
                                                  dateTimeFormat(
                                                    "Hm",
                                                    currentUserDocument
                                                        ?.notificationsTime,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))
                                              ? null
                                              : () async {
                                                  logFirebaseEvent(
                                                      'SETTINGS_PAGE___BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    notificationsTime:
                                                        _model.datePicked,
                                                  ));
                                                },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '4pb1ixf3' /* שמירת השינויים */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 264.0,
                                            height: 48.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Rubik',
                                                      color: Colors.white,
                                                      fontSize: functions
                                                          .setFontSize(16.0),
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(56.0),
                                            disabledColor: const Color(0xFFA0A3A7),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 22.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SETTINGS_PAGE__BTN_ON_TAP');
                                    logFirebaseEvent('Button_auth');
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'login', context.mounted);
                                  },
                                  text:
                                      currentUserDocument?.gender == Gender.male
                                          ? 'התנתק'
                                          : 'התנתקי',
                                  options: FFButtonOptions(
                                    width: 400.0,
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
                                          color: Colors.white,
                                          fontSize: functions.setFontSize(16.0),
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(56.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 22.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SETTINGS_PAGE___BTN_ON_TAP');
                                    logFirebaseEvent('Button_send_email');
                                    await launchUrl(Uri(
                                        scheme: 'mailto',
                                        path: 'dialogi.app@gmail.com',
                                        query: {
                                          'subject': 'תמיכה טכנית',
                                        }
                                            .entries
                                            .map((MapEntry<String, String> e) =>
                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                            .join('&')));
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'a81nlu84' /* תמיכה טכנית */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 400.0,
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
                                          fontSize: functions.setFontSize(16.0),
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(56.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SETTINGS_PAGE___BTN_ON_TAP');
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: PopupWidget(
                                                title: 'מחיקת משתמש',
                                                subTitle:
                                                    'האם אתה בטוח שברצונך למחוק את החשבון שלך? פעולה זו תמחק את כל הנתונים שלך לצמיתות, ולא תהיה אפשרות לשחזרם. אנא ודא שאתה בטוח בהחלטתך לפני לחיצה על כפתור המחיקה.',
                                                footer: '',
                                                button: 'מחק חשבון',
                                                onClick: () async {
                                                  logFirebaseEvent(
                                                      '_custom_action');
                                                  await actions.deleteUser(
                                                    context,
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ug6nxk63' /* מחיקת משתמש */,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height: 48.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: const Color(0xFFE81522),
                                            fontSize:
                                                functions.setFontSize(16.0),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Color(0xFFE81522),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(56.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 22.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SETTINGS_PAGE___BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_launch_u_r_l');
                                          await launchURL(
                                              'https://dialogiapp.com/%D7%9E%D7%93%D7%99%D7%A0%D7%99%D7%95%D7%AA-%D7%A4%D7%A8%D7%98%D7%99%D7%95%D7%AA/');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'f26zmkub' /* מדיניות פרטיות */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize:
                                                    functions.setFontSize(16.0),
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Color(0x00FFFFFF),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(56.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SETTINGS_PAGE___BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_launch_u_r_l');
                                          await launchURL(
                                              'https://dialogiapp.com/%D7%AA%D7%A0%D7%90%D7%99-%D7%A9%D7%99%D7%9E%D7%95%D7%A9/');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '69z37oon' /* תנאי שימוש */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize:
                                                    functions.setFontSize(16.0),
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Color(0x00FFFFFF),
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(56.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
  }
}
