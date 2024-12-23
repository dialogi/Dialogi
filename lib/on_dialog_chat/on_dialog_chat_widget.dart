import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dialog_manager_widget.dart';
import '/components/loader_popup_widget.dart';
import '/components/popup_widget.dart';
import '/components/teacher_select_widget.dart';
import '/components/user_message_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/dialog.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'on_dialog_chat_model.dart';
export 'on_dialog_chat_model.dart';

class OnDialogChatWidget extends StatefulWidget {
  const OnDialogChatWidget({
    super.key,
    this.threadId,
    this.dialogSubject,
    this.chatMessages,
    required this.lessonId,
    required this.assistantId,
  });

  final String? threadId;
  final String? dialogSubject;
  final List<MessageStruct>? chatMessages;
  final String? lessonId;
  final String? assistantId;

  @override
  State<OnDialogChatWidget> createState() => _OnDialogChatWidgetState();
}

class _OnDialogChatWidgetState extends State<OnDialogChatWidget>
    with TickerProviderStateMixin {
  late OnDialogChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnDialogChatModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'on_dialog_chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ON_DIALOG_CHAT_on_dialog_chat_ON_INIT_ST');
      logFirebaseEvent('on_dialog_chat_firestore_query');
      _model.currLesson = await queryLessonsRecordOnce(
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
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('on_dialog_chat_firestore_query');
      _model.last3Lessons = await queryLessonsRecordOnce(
        queryBuilder: (lessonsRecord) => lessonsRecord
            .where(
              'user',
              isEqualTo: currentUserUid,
            )
            .orderBy('start_at', descending: true),
        limit: 3,
      );
      logFirebaseEvent('on_dialog_chat_update_app_state');
      FFAppState().onHold = false;
      safeSetState(() {});
      logFirebaseEvent('on_dialog_chat_custom_action');
      await actions.stopInterruption();
      if (!valueOrDefault<bool>(currentUserDocument?.walkthrow, false)) {
        logFirebaseEvent('on_dialog_chat_start_walkthrough');
        safeSetState(
            () => _model.dialogController = createPageWalkthrough(context));
        _model.dialogController?.show(context: context);
        while (!valueOrDefault<bool>(currentUserDocument?.walkthrow, false)) {
          logFirebaseEvent('on_dialog_chat_wait__delay');
          await Future.delayed(const Duration(milliseconds: 2000));
        }
      }
      if (widget.chatMessages != null && (widget.chatMessages)!.isNotEmpty) {
        logFirebaseEvent('on_dialog_chat_update_page_state');
        _model.captionView = true;
        safeSetState(() {});
      } else {
        if (FFAppState().onLesson) {
          logFirebaseEvent('on_dialog_chat_update_app_state');
          FFAppState().dialogState = DialogState.user_talking;
          safeSetState(() {});
          logFirebaseEvent('on_dialog_chat_update_app_state');
          FFAppState().userInput = 'בואו נתחיל בשיעור!';
          safeSetState(() {});
          logFirebaseEvent('on_dialog_chat_update_app_state');
          FFAppState().startPopup = true;
          safeSetState(() {});
        }
        if (!(widget.assistantId != null && widget.assistantId != '')) {
          logFirebaseEvent('on_dialog_chat_trigger_push_notification');
          triggerPushNotification(
            notificationTitle: 'hellloooooo',
            notificationText: 'hellloooooo',
            userRefs: [currentUserReference!],
            initialPageName: 'profile',
            parameterData: {},
          );
        }
      }
    });

    animationsMap.addAll({
      'carouselOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 860.0.ms,
            begin: const Offset(0.0, 0.0),
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<LessonsRecord>>(
      future: queryLessonsRecordOnce(
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
            backgroundColor: _model.captionView
                ? FlutterFlowTheme.of(context).primary
                : Colors.white,
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
        List<LessonsRecord> onDialogChatLessonsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final onDialogChatLessonsRecord =
            onDialogChatLessonsRecordList.isNotEmpty
                ? onDialogChatLessonsRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: _model.captionView
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.white,
              body: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 60.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (widget.chatMessages != null &&
                                        (widget.chatMessages)!.isNotEmpty)
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ON_DIALOG_CHAT_arrow_back_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ON_DIALOG_CHAT_PAGE_Text_k93are54_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_action_block');
                                            await _model
                                                .finishChatting(context);
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'fb7kzi9n' /* שיחה */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  color: Colors.white,
                                                  fontSize: functions
                                                      .setFontSize(24.0),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.teacherSelectModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: Hero(
                                              tag: '',
                                              transitionOnUserGestures: true,
                                              child: Material(
                                                color: Colors.transparent,
                                                child: TeacherSelectWidget(
                                                  selected: true,
                                                  name: null,
                                                  imgWidth: 50.0,
                                                  teacherImg:
                                                      onDialogChatLessonsRecord!
                                                          .teacher.name,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'שיעור מס’ ${onDialogChatLessonsRecord.lessonNum.toString()}',
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  'מורה: ${onDialogChatLessonsRecord.teacher.name} / ${() {
                                                    if (widget.assistantId ==
                                                        FFAppConstants
                                                            .assistant1) {
                                                      return 'רמת מתחילים';
                                                    } else if (widget
                                                            .assistantId ==
                                                        FFAppConstants
                                                            .assistant2) {
                                                      return 'רמת מתקדמים';
                                                    } else if (widget
                                                            .assistantId ==
                                                        FFAppConstants
                                                            .assistant3) {
                                                      return 'רמת אלופים';
                                                    } else {
                                                      return 'הגייה - בנושא ${widget.dialogSubject}';
                                                    }
                                                  }()}',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                  ).addWalkthrough(
                                    rowJnt8g7ix,
                                    _model.dialogController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 600.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (!_model.captionView)
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              if (FFAppState().dialogState ==
                                                  DialogState.pause)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 40.0),
                                                    child: Lottie.asset(
                                                      'assets/jsons/listen.json',
                                                      width: 312.0,
                                                      height: 276.0,
                                                      fit: BoxFit.cover,
                                                      animate: true,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState().dialogState ==
                                                  DialogState.user_talking)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Lottie.asset(
                                                    'assets/jsons/listen.json',
                                                    width: 312.0,
                                                    height: 276.0,
                                                    fit: BoxFit.cover,
                                                    animate: true,
                                                  ),
                                                ),
                                              if (FFAppState().dialogState ==
                                                  DialogState.processing)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Lottie.asset(
                                                    'assets/jsons/thinking.json',
                                                    width: 312.0,
                                                    height: 276.0,
                                                    fit: BoxFit.cover,
                                                    animate: true,
                                                  ),
                                                ),
                                              if (FFAppState().dialogState ==
                                                  DialogState.AI_talking)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Lottie.asset(
                                                    'assets/jsons/talking.json',
                                                    width: 312.0,
                                                    height: 276.0,
                                                    fit: BoxFit.cover,
                                                    animate: true,
                                                  ),
                                                ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.97),
                                                child: Builder(
                                                  builder: (context) {
                                                    final quickQuestion =
                                                        FFAppConstants
                                                            .quickQuestions
                                                            .toList();

                                                    return SizedBox(
                                                      width: double.infinity,
                                                      height: 37.0,
                                                      child: CarouselSlider
                                                          .builder(
                                                        itemCount: quickQuestion
                                                            .length,
                                                        itemBuilder: (context,
                                                            quickQuestionIndex,
                                                            _) {
                                                          final quickQuestionItem =
                                                              quickQuestion[
                                                                  quickQuestionIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ON_DIALOG_CHAT_Container_05o79kbe_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState()
                                                                      .userInput =
                                                                  quickQuestionItem;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFF8590C8),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Text(
                                                                  quickQuestionItem,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        color: const Color(
                                                                            0xFF8590C8),
                                                                        fontSize:
                                                                            functions.setFontSize(14.0),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        lineHeight:
                                                                            1.4,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        carouselController: _model
                                                                .carouselController ??=
                                                            CarouselSliderController(),
                                                        options:
                                                            CarouselOptions(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  1,
                                                                  quickQuestion
                                                                          .length -
                                                                      1)),
                                                          viewportFraction: 0.4,
                                                          disableCenter: true,
                                                          enlargeCenterPage:
                                                              true,
                                                          enlargeFactor: 0.2,
                                                          enableInfiniteScroll:
                                                              true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          autoPlay: false,
                                                          onPageChanged: (index,
                                                                  _) =>
                                                              _model.carouselCurrentIndex =
                                                                  index,
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'carouselOnActionTriggerAnimation']!,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.captionView == true)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 30.0, 24.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              constraints: const BoxConstraints(
                                                minHeight: 276.0,
                                                maxHeight: 276.0,
                                              ),
                                              decoration: const BoxDecoration(),
                                              child: SingleChildScrollView(
                                                controller:
                                                    _model.scollingChatColumn,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Flexible(
                                                      child: Builder(
                                                        builder: (context) {
                                                          final chat = (widget.chatMessages !=
                                                                              null &&
                                                                          (widget.chatMessages)!
                                                                              .isNotEmpty
                                                                      ? widget
                                                                          .chatMessages
                                                                      : _model
                                                                          .chatHistory)
                                                                  ?.toList() ??
                                                              [];

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                chat.length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                const SizedBox(
                                                                    height:
                                                                        12.0),
                                                            itemBuilder:
                                                                (context,
                                                                    chatIndex) {
                                                              final chatItem =
                                                                  chat[
                                                                      chatIndex];
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              UserMessageWidget(
                                                                            key:
                                                                                Key('Key9u7_${chatIndex}_of_${chat.length}'),
                                                                            user:
                                                                                chatItem.role == 'user',
                                                                            image: chatItem.role == 'user'
                                                                                ? currentUserPhoto
                                                                                : onDialogChatLessonsRecord.teacher.image,
                                                                            content:
                                                                                chatItem.content,
                                                                            name:
                                                                                onDialogChatLessonsRecord.teacher.name,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            controller: _model
                                                                .chatListView,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (!(widget.chatMessages != null &&
                                          (widget.chatMessages)!.isNotEmpty))
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 12.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (!_model.captionView)
                                                    InkWell(
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
                                                            'ON_DIALOG_CHAT_Image_rlqdscy0_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_update_page_state');
                                                        _model.captionView =
                                                            !_model.captionView;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Image_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    20));
                                                        logFirebaseEvent(
                                                            'Image_scroll_to');
                                                        await _model
                                                            .scollingChatColumn
                                                            ?.animateTo(
                                                          _model
                                                              .scollingChatColumn!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds: 1),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/messages.svg',
                                                          width: 34.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ).addWalkthrough(
                                                      imageRlqdscy0,
                                                      _model.dialogController,
                                                    ),
                                                  if (_model.captionView)
                                                    InkWell(
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
                                                            'ON_DIALOG_CHAT_Image_nh91tgpd_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_update_page_state');
                                                        _model.captionView =
                                                            !_model.captionView;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Image_scroll_to');
                                                        await _model
                                                            .chatListView
                                                            ?.animateTo(
                                                          _model
                                                              .chatListView!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/messagesWhite.svg',
                                                          width: 34.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                FlutterFlowTimer(
                                                              initialTime: (!valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.walkthrow,
                                                                          false)
                                                                      ? 7
                                                                      : FFAppState()
                                                                          .userSub
                                                                          .lessonLimit) *
                                                                  60000,
                                                              getDisplayTime: (value) =>
                                                                  StopWatchTimer
                                                                      .getDisplayTime(
                                                                value,
                                                                hours: false,
                                                                milliSecond:
                                                                    false,
                                                              ),
                                                              controller: _model
                                                                  .timerController1,
                                                              updateStateInterval:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1000),
                                                              onChanged: (value,
                                                                  displayTime,
                                                                  shouldUpdate) {
                                                                _model.timerMilliseconds1 =
                                                                    value;
                                                                _model.timerValue1 =
                                                                    displayTime;
                                                                if (shouldUpdate) {
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              onEnded:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ON_DIALOG_CHAT_Timer_9plz1ig8_ON_TIMER_E');
                                                                while (FFAppState()
                                                                        .dialogState ==
                                                                    DialogState
                                                                        .AI_talking) {
                                                                  logFirebaseEvent(
                                                                      'Timer_wait__delay');
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                }
                                                                logFirebaseEvent(
                                                                    'Timer_action_block');
                                                                await _model
                                                                    .finishChatting(
                                                                        context);
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rubik',
                                                                    color: () {
                                                                      if (_model
                                                                          .beforeEnd) {
                                                                        return const Color(
                                                                            0xFFD2131F);
                                                                      } else if (_model
                                                                          .captionView) {
                                                                        return Colors
                                                                            .white;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      }
                                                                    }(),
                                                                    fontSize: functions
                                                                        .setFontSize(
                                                                            18.0),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            color: () {
                                                              if (_model
                                                                  .beforeEnd) {
                                                                return const Color(
                                                                    0xFFD2131F);
                                                              } else if (_model
                                                                  .captionView) {
                                                                return Colors
                                                                    .white;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              }
                                                            }(),
                                                            size: 20.0,
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 6.0)),
                                                      ).addWalkthrough(
                                                        rowDosgrcgx,
                                                        _model.dialogController,
                                                      ),
                                                      FlutterFlowTimer(
                                                        initialTime: ((FFAppState()
                                                                            .userSub
                                                                            .lessonLimit ==
                                                                        0
                                                                    ? 3
                                                                    : FFAppState()
                                                                        .userSub
                                                                        .lessonLimit) *
                                                                60000) -
                                                            30000,
                                                        getDisplayTime: (value) =>
                                                            StopWatchTimer
                                                                .getDisplayTime(
                                                          value,
                                                          hours: false,
                                                          milliSecond: false,
                                                        ),
                                                        controller: _model
                                                            .timerController2,
                                                        updateStateInterval:
                                                            const Duration(
                                                                milliseconds:
                                                                    1000),
                                                        onChanged: (value,
                                                            displayTime,
                                                            shouldUpdate) {
                                                          _model.timerMilliseconds2 =
                                                              value;
                                                          _model.timerValue2 =
                                                              displayTime;
                                                          if (shouldUpdate) {
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        onEnded: () async {
                                                          logFirebaseEvent(
                                                              'ON_DIALOG_CHAT_Timer_rbzd9cza_ON_TIMER_E');
                                                          logFirebaseEvent(
                                                              'Timer_update_page_state');
                                                          _model.beforeEnd =
                                                              true;
                                                          safeSetState(() {});
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 0.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 6.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (FFAppState().onHold ||
                                                (FFAppState().dialogState ==
                                                    DialogState.user_talking) ||
                                                (FFAppState().dialogState ==
                                                    DialogState.processing))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.02, 0.69),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (FFAppState()
                                                                .dialogState ==
                                                            DialogState
                                                                .user_talking) {
                                                          return 'מאזין...';
                                                        } else if (widget
                                                                    .chatMessages !=
                                                                null &&
                                                            (widget.chatMessages)!
                                                                .isNotEmpty) {
                                                          return 'לחזרה לעמוד הראשי';
                                                        } else if (FFAppState()
                                                            .onHold) {
                                                          return 'שיחה בהשהייה';
                                                        } else if (FFAppState()
                                                                .dialogState ==
                                                            DialogState
                                                                .processing) {
                                                          return 'מעבד...';
                                                        } else {
                                                          return 'm';
                                                        }
                                                      }(),
                                                      ' m',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: _model
                                                                  .captionView
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                          fontSize: functions
                                                              .setFontSize(
                                                                  14.0),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ).addWalkthrough(
                                                    textYlu0c17m,
                                                    _model.dialogController,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 52.0),
                                        child: Stack(
                                          children: [
                                            if (!(widget.chatMessages !=
                                                    null &&
                                                (widget.chatMessages)!
                                                    .isNotEmpty))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Builder(
                                                  builder: (context) =>
                                                      wrapWithModel(
                                                    model: _model
                                                        .dialogManagerModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: DialogManagerWidget(
                                                      repeatActive: false,
                                                      progressVal:
                                                          _model.progrssVal,
                                                      onHold:
                                                          FFAppState().onHold,
                                                      repeatAction: () async {
                                                        logFirebaseEvent(
                                                            'ON_DIALOG_CHAT_Container_f8u3q301_CALLBA');
                                                        while (FFAppState()
                                                                .dialogState ==
                                                            DialogState
                                                                .AI_talking) {
                                                          logFirebaseEvent(
                                                              'dialogManager_wait__delay');
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      500));
                                                        }
                                                        logFirebaseEvent(
                                                            'dialogManager_update_app_state');
                                                        FFAppState().onHold =
                                                            true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'dialogManager_custom_action');
                                                        _model.repeatPath =
                                                            await actions
                                                                .fetchAndPlaySpeech(
                                                          _model.chatHistory
                                                              .where((e) =>
                                                                  e.role ==
                                                                  'teacher')
                                                              .toList()
                                                              .lastOrNull!
                                                              .content,
                                                          FFAppConstants
                                                              .apiKeyOpenAi,
                                                          _model.currLesson!
                                                              .teacher.voice,
                                                          FFAppState()
                                                              .userSub
                                                              .ttsHD,
                                                        );
                                                        logFirebaseEvent(
                                                            'dialogManager_custom_action');
                                                        await actions.playAudio(
                                                          _model.repeatPath!,
                                                        );
                                                        logFirebaseEvent(
                                                            'dialogManager_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1000));
                                                        logFirebaseEvent(
                                                            'dialogManager_update_app_state');
                                                        FFAppState()
                                                                .dialogState =
                                                            DialogState
                                                                .processing;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'dialogManager_update_app_state');
                                                        FFAppState().onHold =
                                                            false;
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      stopAction: () async {
                                                        logFirebaseEvent(
                                                            'ON_DIALOG_CHAT_Container_f8u3q301_CALLBA');
                                                        logFirebaseEvent(
                                                            'dialogManager_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: const AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    PopupWidget(
                                                                  title:
                                                                      'מעוניין לצאת מהשיעור?',
                                                                  subTitle:
                                                                      'לא יהיה ניתן לחזור לשיעור הנוכחי לאחר היציאה ממנו.',
                                                                  button:
                                                                      'חייב ללכת, ניפגש בהמשך',
                                                                  onClick:
                                                                      () async {
                                                                    if (FFAppState()
                                                                            .dialogState ==
                                                                        DialogState
                                                                            .AI_talking) {
                                                                      logFirebaseEvent(
                                                                          '_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: const LoaderPopupWidget(
                                                                                title: 'המורה יסיים לדבר וכבר תצא מהשיעור...',
                                                                                description: '',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );

                                                                      while (FFAppState()
                                                                              .dialogState ==
                                                                          DialogState
                                                                              .AI_talking) {
                                                                        logFirebaseEvent(
                                                                            '_wait__delay');
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                1000));
                                                                      }
                                                                      logFirebaseEvent(
                                                                          '_close_dialog_drawer_etc');
                                                                      Navigator.pop(
                                                                          context);
                                                                    }
                                                                    logFirebaseEvent(
                                                                        '_action_block');
                                                                    await _model
                                                                        .finishChatting(
                                                                            context);
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      onPause: () async {
                                                        logFirebaseEvent(
                                                            'ON_DIALOG_CHAT_Container_f8u3q301_CALLBA');
                                                        logFirebaseEvent(
                                                            'dialogManager_update_app_state');
                                                        FFAppState().onHold =
                                                            true;
                                                        safeSetState(() {});
                                                        while (FFAppState()
                                                                .onHold ==
                                                            true) {
                                                          logFirebaseEvent(
                                                              'dialogManager_update_page_state');
                                                          _model.progrssVal =
                                                              _model.progrssVal +
                                                                  -0.05;
                                                          safeSetState(() {});
                                                          if (_model
                                                                  .progrssVal <
                                                              0.01) {
                                                            logFirebaseEvent(
                                                                'dialogManager_update_page_state');
                                                            _model.progrssVal =
                                                                1.0;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'dialogManager_update_app_state');
                                                            FFAppState()
                                                                .onHold = false;
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .progrssVal <
                                                              0.7) {}

                                                          logFirebaseEvent(
                                                              'dialogManager_wait__delay');
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      500));
                                                        }
                                                      },
                                                      onResume: () async {
                                                        logFirebaseEvent(
                                                            'ON_DIALOG_CHAT_Container_f8u3q301_CALLBA');
                                                        logFirebaseEvent(
                                                            'dialogManager_update_app_state');
                                                        FFAppState().onHold =
                                                            false;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'dialogManager_update_page_state');
                                                        _model.progrssVal = 1.0;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ).addWalkthrough(
                                                    containerF8u3q301,
                                                    _model.dialogController,
                                                  ),
                                                ),
                                              ),
                                            if (!valueOrDefault<bool>(
                                                currentUserDocument?.walkthrow,
                                                false))
                                              AuthUserStreamWidget(
                                                builder: (context) => Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Stack(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'jui9r5k9' /* סיים שיחה */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                height: 57.7,
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            70.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                color: const Color(
                                                                    0xFFE4445A),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          functions
                                                                              .setFontSize(14.0),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.42,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          28.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          28.0),
                                                                ),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ).addWalkthrough(
                                                              buttonEcf5egto,
                                                              _model
                                                                  .dialogController,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'pufcxa3k' /* חזור שנית */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                height: 57.7,
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            70.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                color: const Color(
                                                                    0xFFE7EAF8),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          functions
                                                                              .setFontSize(14.0),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.42,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState().dialogState !=
                                                                            DialogState
                                                                                .processing
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryText
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  width: 0.8,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          28.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          28.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ).addWalkthrough(
                                                              buttonUipf3jkg,
                                                              _model
                                                                  .dialogController,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 108.5,
                                                              height: 108.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9999.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          61.0,
                                                                      height:
                                                                          61.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () {
                                                                                print('Button pressed ...');
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'zmg8n5t3' /* Button */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: const Color(0x00546DEF),
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: const Color(0x00FFFFFF),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(24.0),
                                                                              child: SvgPicture.asset(
                                                                                'assets/images/pause.svg',
                                                                                width: 28.0,
                                                                                height: 28.0,
                                                                                fit: BoxFit.none,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: const AlignmentDirectional(
                                                                          -0.01,
                                                                          0.02),
                                                                      child:
                                                                          CircularPercentIndicator(
                                                                        percent:
                                                                            1.0,
                                                                        radius:
                                                                            42.25,
                                                                        lineWidth:
                                                                            12.0,
                                                                        animation:
                                                                            true,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            const Color(0xFF314CD8),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                      ).addWalkthrough(
                                                                        progressBarYujb1y9j,
                                                                        _model
                                                                            .dialogController,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                      if (widget.chatMessages != null &&
                                          (widget.chatMessages)!.isNotEmpty)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 2.21),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 22.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.0, 0.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ON_DIALOG_CHAT_PAGE____BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.goNamed(
                                                            'homepage',
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  const TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        400),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '887s7ijl' /* מעבר לעמוד הבית */,
                                                        ),
                                                        icon: const Icon(
                                                          FFIcons.khome,
                                                          size: 28.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 48.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      28.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: Colors.white,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rubik',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      56.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      const SizedBox(height: 27.0))
                                                  .addToEnd(
                                                      const SizedBox(height: 52.0)),
                                            ),
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
                    ],
                  ),
                  if (FFAppState().startPopup &&
                      !(widget.chatMessages != null &&
                          (widget.chatMessages)!.isNotEmpty))
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: const BoxDecoration(
                        color: Color(0x71000000),
                      ),
                      child: AuthUserStreamWidget(
                        builder: (context) => wrapWithModel(
                          model: _model.popupModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PopupWidget(
                            subTitle: 'נתחיל בשיעור?',
                            button: currentUserDocument?.gender == Gender.female
                                ? 'התחילי בשיעור'
                                : 'התחל בשיעור',
                            close: false,
                            onClick: () async {
                              logFirebaseEvent(
                                  'ON_DIALOG_CHAT_Container_kdy2qk4j_CALLBA');
                              logFirebaseEvent('popup_update_app_state');
                              FFAppState().startPopup = false;
                              safeSetState(() {});
                              logFirebaseEvent('popup_firestore_query');
                              _model.hobbys = await queryUserAnswersRecordOnce(
                                queryBuilder: (userAnswersRecord) =>
                                    userAnswersRecord
                                        .where(
                                          'user',
                                          isEqualTo: currentUserUid,
                                        )
                                        .where(
                                          'question',
                                          isEqualTo: 'תחומי עניין',
                                        ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              logFirebaseEvent('popup_update_page_state');
                              _model.additionalData =
                                  'השם שלך הוא:${_model.currLesson?.teacher.name} שם התלמיד הוא  $currentUserDisplayName${widget.dialogSubject != null && widget.dialogSubject != '' ? 'נושא השיעור הינו ${widget.dialogSubject}, התחל בבקשה את השיעור עכשיו ותעבור מילה מילה בהתמקדות על ההגייה הנכונה של התלמיד אל תתחיל עם כל המילים בהתחלה, תנסהלהגיד מילה אחת ולמשור על על תגובה קצרה ותמציתית' : 'תתחיל את השיעור עכשיו בתמציתיות ותציג את עצמך בקצרה'}, תקרא לתלמיד בשמו מידי פעם ותיהיה ממוקדkeep your response \'clean\' without special signs, 50 words max.try not to repeat about yourself and be relevant to the user english level.lead the lesson nicely that the user will have the feeling of a lesson. the user have done already ${_model.currLesson?.lessonNum.toString()} - so treat him like that.${!FFAppState().userSub.hasFrequencyPerWeek() ? 'This is an assessment to understand the student\'s current level and to place them accordingly. Please mention this to the student.' : 'be creative and try to teach as teacher'}if the message that the user give is \'silent\' that\'s meant that the user didn\'t talked.תחומי העניין של התלמיד הם: ${(List<String> var1) {
                                return var1.join(', ');
                              }(_model.hobbys!.answer.toList())}השיעורים הקודמים עסקו במידע הבא ולכן אל תעסוק בו שוב:${functions.getSummaries(_model.last3Lessons!.toList())}';
                              safeSetState(() {});
                              logFirebaseEvent('popup_custom_action');
                              await actions.stopInterruption();
                              if (FFAppState().onLesson) {
                                logFirebaseEvent('popup_timer');
                                _model.timerController1.onStartTimer();
                                logFirebaseEvent('popup_timer');
                                _model.timerController2.onStartTimer();
                              } else {
                                logFirebaseEvent('popup_update_app_state');
                                FFAppState().onLesson = true;
                                safeSetState(() {});
                                if (_model.chatHistory.lastOrNull?.role ==
                                    'teacher') {
                                  logFirebaseEvent('popup_update_app_state');
                                  FFAppState().userInput = '';
                                  safeSetState(() {});
                                  logFirebaseEvent('popup_update_page_state');
                                  _model.teacherTurn = false;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('popup_update_page_state');
                                  _model.teacherTurn = true;
                                  safeSetState(() {});
                                }
                              }

                              while (FFAppState().onLesson == true) {
                                while (FFAppState().onHold) {
                                  logFirebaseEvent('popup_wait__delay');
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                }
                                if (_model.teacherTurn) {
                                  logFirebaseEvent('popup_update_page_state');
                                  _model.teacherTurn = false;
                                  safeSetState(() {});
                                } else {
                                  if (!(FFAppState().userInput != '')) {
                                    logFirebaseEvent('popup_update_app_state');
                                    FFAppState().interruption = false;
                                    safeSetState(() {});
                                    logFirebaseEvent('popup_widget_animation');
                                    if (animationsMap[
                                            'carouselOnActionTriggerAnimation'] !=
                                        null) {
                                      animationsMap[
                                              'carouselOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                    logFirebaseEvent(
                                        'popup_start_audio_recording');
                                    await startAudioRecording(
                                      context,
                                      audioRecorder: _model.audioRecorder ??=
                                          AudioRecorder(),
                                    );

                                    logFirebaseEvent('popup_update_app_state');
                                    FFAppState().dialogState =
                                        DialogState.user_talking;
                                    safeSetState(() {});
                                    if (isAndroid) {
                                      logFirebaseEvent('popup_wait__delay');
                                      await Future.delayed(
                                          const Duration(milliseconds: 12000));
                                    } else {
                                      logFirebaseEvent('popup_custom_action');
                                      _model.nw = await actions.newRecord();
                                    }

                                    logFirebaseEvent('popup_widget_animation');
                                    if (animationsMap[
                                            'carouselOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'carouselOnActionTriggerAnimation']!
                                          .controller
                                          .reverse();
                                    }
                                    logFirebaseEvent('popup_custom_action');
                                    await actions.stopInterruption();
                                    logFirebaseEvent(
                                        'popup_stop_audio_recording');
                                    await stopAudioRecording(
                                      audioRecorder: _model.audioRecorder,
                                      audioName: 'recordedFileBytes',
                                      onRecordingComplete:
                                          (audioFilePath, audioBytes) {
                                        _model.audioRecording = audioFilePath;
                                        _model.recordedFileBytes = audioBytes;
                                      },
                                    );

                                    logFirebaseEvent('popup_custom_action');
                                    _model.renamedAudioFile =
                                        await actions.renameAudio(
                                      _model.recordedFileBytes,
                                      _model.audioRecording!,
                                    );
                                    logFirebaseEvent('popup_update_page_state');
                                    _model.recordedAudioFile =
                                        _model.renamedAudioFile;
                                    safeSetState(() {});
                                    logFirebaseEvent('popup_backend_call');
                                    _model.whisperResult = await OpenAIAPIGroup
                                        .createTranscriptionCall
                                        .call(
                                      file: _model.recordedAudioFile,
                                    );
                                  }
                                  logFirebaseEvent('popup_update_app_state');
                                  FFAppState().dialogState =
                                      DialogState.processing;
                                  safeSetState(() {});
                                  if (((_model.whisperResult?.succeeded ??
                                              true) ==
                                          true) ||
                                      (FFAppState().userInput != '')) {
                                    logFirebaseEvent('popup_update_app_state');
                                    FFAppState().userInput =
                                        FFAppState().userInput != ''
                                            ? FFAppState().userInput
                                            : getJsonField(
                                                (_model.whisperResult
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString();
                                    safeSetState(() {});
                                    // Create a message
                                    logFirebaseEvent('popup_Createamessage');
                                    _model.apiMessageCreateResult =
                                        await OpenAIAPIGroup.createMessageCall
                                            .call(
                                      threadId: widget.threadId,
                                      messageContent: FFAppState().userInput,
                                    );

                                    if ((_model.apiMessageCreateResult
                                            ?.succeeded ??
                                        true)) {
                                      // Add Message to Chat History
                                      logFirebaseEvent(
                                          'popup_AddMessagetoChatHistory');
                                      _model.addToChatHistory(MessageStruct(
                                        role: 'user',
                                        visible: true,
                                        content: FFAppState().userInput,
                                      ));
                                      safeSetState(() {});
                                    }
                                  }
                                }

                                // Run the assistant
                                logFirebaseEvent('popup_Runtheassistant');
                                _model.apiAssistantRunResult =
                                    await OpenAIAPIGroup.createRunCall.call(
                                  threadId: widget.threadId,
                                  assistantId: widget.assistantId,
                                  additionalInstructions: _model.additionalData,
                                );

                                if ((_model.apiAssistantRunResult?.succeeded ??
                                    true)) {
                                  logFirebaseEvent('popup_update_page_state');
                                  _model.runId =
                                      OpenAIAPIGroup.createRunCall.runId(
                                    (_model.apiAssistantRunResult?.jsonBody ??
                                        ''),
                                  );
                                  safeSetState(() {});
                                  while (_model.status != 'completed') {
                                    logFirebaseEvent('popup_backend_call');
                                    _model.apiRetrieveRunResult =
                                        await OpenAIAPIGroup.getRunCall.call(
                                      threadId: widget.threadId,
                                      runId: _model.runId,
                                    );

                                    if ((_model
                                            .apiRetrieveRunResult?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'popup_update_page_state');
                                      _model.status =
                                          OpenAIAPIGroup.getRunCall.runStatus(
                                        (_model.apiRetrieveRunResult
                                                ?.jsonBody ??
                                            ''),
                                      )!;
                                      safeSetState(() {});
                                      if (OpenAIAPIGroup.getRunCall.runStatus(
                                            (_model.apiRetrieveRunResult
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'completed') {
                                        logFirebaseEvent('popup_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                      }
                                    }
                                  }
                                  // Get latest message
                                  logFirebaseEvent('popup_Getlatestmessage');
                                  _model.apiGetMessagesResult =
                                      await OpenAIAPIGroup.listMessagesCall
                                          .call(
                                    threadId: widget.threadId,
                                  );

                                  if ((_model.apiGetMessagesResult?.succeeded ??
                                      true)) {
                                    // Add message to chat history
                                    logFirebaseEvent(
                                        'popup_Addmessagetochathistory');
                                    _model.addToChatHistory(MessageStruct(
                                      role: 'teacher',
                                      visible: true,
                                      content:
                                          OpenAIAPIGroup.listMessagesCall.data(
                                        (_model.apiGetMessagesResult
                                                ?.jsonBody ??
                                            ''),
                                      ),
                                    ));
                                    safeSetState(() {});
                                    if (FFAppState().onLesson == true) {
                                      logFirebaseEvent('popup_custom_action');
                                      _model.audioPath =
                                          await actions.fetchAndPlaySpeech(
                                        OpenAIAPIGroup.listMessagesCall.data(
                                          (_model.apiGetMessagesResult
                                                  ?.jsonBody ??
                                              ''),
                                        )!,
                                        FFAppConstants.apiKeyOpenAi,
                                        _model.currLesson!.teacher.voice,
                                        FFAppState().userSub.ttsHD,
                                      );
                                      while (FFAppState().onHold) {
                                        logFirebaseEvent('popup_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                      }
                                      logFirebaseEvent(
                                          'popup_update_app_state');
                                      FFAppState().dialogState =
                                          DialogState.AI_talking;
                                      safeSetState(() {});
                                      if (FFAppState().onLesson) {
                                        logFirebaseEvent('popup_custom_action');
                                        await actions.playAudio(
                                          _model.audioPath!,
                                        );
                                      } else {
                                        break;
                                      }

                                      logFirebaseEvent('popup_custom_action');
                                      await actions.stopInterruption();
                                    }
                                    // Reset completed status
                                    logFirebaseEvent(
                                        'popup_Resetcompletedstatus');
                                    _model.status = 'status';
                                    safeSetState(() {});
                                    logFirebaseEvent('popup_update_app_state');
                                    FFAppState().userInput = '';
                                    safeSetState(() {});
                                  }
                                }
                              }

                              safeSetState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                ],
              ),
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
          safeSetState(() => _model.dialogController = null);
          logFirebaseEvent('ON_DIALOG_CHAT_on_dialog_chat_ON_WALKTHR');
          logFirebaseEvent('on_dialog_chat_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            walkthrow: true,
          ));
          logFirebaseEvent('on_dialog_chat_update_app_state');
          FFAppState().startPopup = true;
          safeSetState(() {});
        },
        onSkip: () {
          () async {
            logFirebaseEvent('ON_DIALOG_CHAT_on_dialog_chat_ON_WALKTHR');
            logFirebaseEvent('on_dialog_chat_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              walkthrow: true,
            ));
            logFirebaseEvent('on_dialog_chat_update_app_state');
            FFAppState().startPopup = true;
            safeSetState(() {});
          }();
          return true;
        },
      );
}
