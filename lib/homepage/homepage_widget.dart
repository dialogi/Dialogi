import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/home_page.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homepage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOMEPAGE_PAGE_homepage_ON_INIT_STATE');
      logFirebaseEvent('homepage_action_block');
      unawaited(
        () async {
          await action_blocks.setLang(context);
          safeSetState(() {});
        }(),
      );
      if (valueOrDefault<bool>(currentUserDocument?.onboarded, false) ==
          true) {
        logFirebaseEvent('homepage_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          seenAt: getCurrentTimestamp,
        ));
        if (!valueOrDefault<bool>(currentUserDocument?.walkthrow, false)) {
          logFirebaseEvent('homepage_wait__delay');
          await Future.delayed(const Duration(milliseconds: 2000));
          logFirebaseEvent('homepage_start_walkthrough');
          safeSetState(() =>
              _model.homePageController = createPageWalkthrough(context));
          _model.homePageController?.show(context: context);
        }
      } else {
        logFirebaseEvent('homepage_navigate_to');

        context.goNamedAuth('start_onboarding', context.mounted);
      }
        });
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
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 12.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          'שלום ${(String var1) {
                            return var1.split(' ')[0];
                          }(currentUserDisplayName)}!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    color: Colors.white,
                                    fontSize: functions.setFontSize(20.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.6,
                                  ),
                        ).addWalkthrough(
                          textTryx6f7i,
                          _model.homePageController,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 12.0),
                            child: Text(
                              'שיעורים אחרונים',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: Colors.black,
                                    fontSize: functions.setFontSize(16.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<LessonsRecord>>(
                          stream: queryLessonsRecord(
                            queryBuilder: (lessonsRecord) => lessonsRecord
                                .where(
                                  'user',
                                  isEqualTo: currentUserUid,
                                )
                                .orderBy('start_at'),
                          ),
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
                            List<LessonsRecord> containerLessonsRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (containerLessonsRecordList.isNotEmpty)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final lessons =
                                                containerLessonsRecordList
                                                    .toList();

                                            return SizedBox(
                                              width: 600.0,
                                              height: 92.0,
                                              child: CarouselSlider.builder(
                                                itemCount: lessons.length,
                                                itemBuilder:
                                                    (context, lessonsIndex, _) {
                                                  final lessonsItem =
                                                      lessons[lessonsIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: SizedBox(
                                                          width: 327.0,
                                                          height: 92.0,
                                                          child: Stack(
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOMEPAGE_PAGE_Container_y0ptrtv1_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Container_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'dialog_summary',
                                                                    queryParameters:
                                                                        {
                                                                      'lastLesson':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'lessonId':
                                                                          serializeParam(
                                                                        lessonsItem
                                                                            .lessonId,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          const TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 700),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 327.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        const Color(
                                                                            0xFF788EFD),
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary
                                                                      ],
                                                                      stops: const [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: const AlignmentDirectional(
                                                                          0.31,
                                                                          -1.0),
                                                                      end: const AlignmentDirectional(
                                                                          -0.31,
                                                                          1.0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            9.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            if (lessonsItem.teacher.name ==
                                                                                'נועה כהן')
                                                                              Flexible(
                                                                                child: Container(
                                                                                  width: 68.0,
                                                                                  height: 68.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0xFFACB8EC),
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: Colors.white,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(9999.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/cropped_image_3.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (lessonsItem.teacher.name ==
                                                                                'יואב כהן')
                                                                              Flexible(
                                                                                child: Container(
                                                                                  width: 68.0,
                                                                                  height: 68.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0xFFACB8EC),
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: Colors.white,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(9999.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/cropped_image_4.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (lessonsItem.teacher.name ==
                                                                                'תמר סלע')
                                                                              Flexible(
                                                                                child: Container(
                                                                                  width: 68.0,
                                                                                  height: 68.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0xFFACB8EC),
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: Colors.white,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(9999.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/cropped_image_2.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (lessonsItem.teacher.name ==
                                                                                'עומר זלמן')
                                                                              Flexible(
                                                                                child: Container(
                                                                                  width: 68.0,
                                                                                  height: 68.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0xFFACB8EC),
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: Colors.white,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(999.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/cropped_image_1.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(height: 0.0)),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'שיעור מס׳ ${valueOrDefault<String>(
                                                                                    (lessonsIndex + 1).toString(),
                                                                                    'lessonNum',
                                                                                  )}',
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Rubik',
                                                                                        color: Colors.white,
                                                                                        fontSize: functions.setFontSize(16.0),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        lineHeight: 1.5,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'מורה: ${lessonsItem.teacher.name}',
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: Colors.white,
                                                                                      fontSize: functions.setFontSize(12.0),
                                                                                      letterSpacing: 0.0,
                                                                                      lineHeight: 1.33,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselSliderController(),
                                                options: CarouselOptions(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          valueOrDefault<int>(
                                                            containerLessonsRecordList
                                                                .length,
                                                            0,
                                                          ),
                                                          lessons.length - 1)),
                                                  viewportFraction: 0.8,
                                                  disableCenter: true,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.25,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  autoPlay: false,
                                                  onPageChanged: (index, _) =>
                                                      _model.carouselCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  if (!(containerLessonsRecordList.isNotEmpty))
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOMEPAGE_PAGE_Stack_l6f7wya7_ON_TAP');
                                            logFirebaseEvent(
                                                'Stack_navigate_to');

                                            context.pushNamed('start_dialog');
                                          },
                                          child: SizedBox(
                                            width: 327.0,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  constraints: const BoxConstraints(
                                                    minWidth: 100.0,
                                                    minHeight: 97.0,
                                                    maxWidth: 327.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                        const Color(0xC4546DEF)
                                                      ],
                                                      stops: const [0.0, 1.0],
                                                      begin:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      end: const AlignmentDirectional(
                                                          -1.0, 0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Stack(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.0, 0.0),
                                                            children: [
                                                              Container(
                                                                width: 68.0,
                                                                height: 68.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            9999.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/logo.png',
                                                                      height:
                                                                          76.0,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            'הצעד הראשון הוא הקל ביותר – לחיצה אחת והשיעור הראשון שלך מתחיל!',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: functions
                                                                      .setFontSize(
                                                                          16.0),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ).addWalkthrough(
                                columnE6dnldkt,
                                _model.homePageController,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'kxkjhfmx' /* תרגול הגייה נכונה */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: const Color(0xFF232C2E),
                                          fontSize: functions.setFontSize(18.0),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: StreamBuilder<List<UserAnswersRecord>>(
                                  stream: queryUserAnswersRecord(
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
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserAnswersRecord>
                                        containerUserAnswersRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerUserAnswersRecord =
                                        containerUserAnswersRecordList
                                                .isNotEmpty
                                            ? containerUserAnswersRecordList
                                                .first
                                            : null;

                                    return Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 400.0,
                                        maxHeight: 400.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 1.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 40.663,
                                                  color: Color(0x0E000000),
                                                  offset: Offset(
                                                    0.0,
                                                    1.694,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: StreamBuilder<
                                                List<LevelsRecord>>(
                                              stream: queryLevelsRecord(
                                                queryBuilder: (levelsRecord) =>
                                                    levelsRecord
                                                        .where(
                                                          'user',
                                                          isEqualTo:
                                                              currentUserUid,
                                                        )
                                                        .where(
                                                          'subject',
                                                          isEqualTo:
                                                              valueOrDefault<
                                                                  String>(
                                                            containerUserAnswersRecord
                                                                ?.answer
                                                                .elementAtOrNull(
                                                                    0),
                                                            'כללי',
                                                          ),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<LevelsRecord>
                                                    columnLevelsRecordList =
                                                    snapshot.data!;
                                                final columnLevelsRecord =
                                                    columnLevelsRecordList
                                                            .isNotEmpty
                                                        ? columnLevelsRecordList
                                                            .first
                                                        : null;

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
                                                        'HOMEPAGE_PAGE_Column_10mmx6kb_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Column_action_block');
                                                    await _model.startPronouns(
                                                      context,
                                                      subject: valueOrDefault<
                                                          String>(
                                                        containerUserAnswersRecord
                                                            ?.answer
                                                            .elementAtOrNull(
                                                                0),
                                                        'כללי',
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    11.0,
                                                                    11.0,
                                                                    11.0,
                                                                    25.2),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Frame_427320811.svg',
                                                            width: 48.0,
                                                            height: 48.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.5,
                                                                    0.0,
                                                                    15.5,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUserAnswersRecord
                                                                ?.answer
                                                                .elementAtOrNull(
                                                                    0),
                                                            'כללי',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF3C3D41),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        14.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight:
                                                                    1.42,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    13.24,
                                                                    0.0,
                                                                    13.24,
                                                                    0.0),
                                                        child: Text(
                                                          'השלמת ${valueOrDefault<String>(
                                                            columnLevelsRecord
                                                                ?.precent
                                                                .toString(),
                                                            '0',
                                                          )}%  מהמשימה  ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF8A8B91),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        12.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.3,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      11.3,
                                                                      21.0,
                                                                      11.3,
                                                                      11.5),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (valueOrDefault<
                                                                          int>(
                                                                        columnLevelsRecord
                                                                            ?.precent,
                                                                        0,
                                                                      ) ??
                                                                      0) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFE2E4EF),
                                                            barRadius:
                                                                const Radius.circular(
                                                                    56.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          StreamBuilder<List<LevelsRecord>>(
                                            stream: queryLevelsRecord(
                                              queryBuilder: (levelsRecord) =>
                                                  levelsRecord
                                                      .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserUid,
                                                      )
                                                      .where(
                                                        'subject',
                                                        isEqualTo:
                                                            valueOrDefault<
                                                                String>(
                                                          containerUserAnswersRecord
                                                              ?.answer
                                                              .elementAtOrNull(
                                                                  1),
                                                          'כללי',
                                                        ),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<LevelsRecord>
                                                  containerLevelsRecordList =
                                                  snapshot.data!;
                                              final containerLevelsRecord =
                                                  containerLevelsRecordList
                                                          .isNotEmpty
                                                      ? containerLevelsRecordList
                                                          .first
                                                      : null;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOMEPAGE_PAGE_Container_co7w6wsg_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_action_block');
                                                  await _model.startPronouns(
                                                    context,
                                                    subject:
                                                        valueOrDefault<String>(
                                                      containerUserAnswersRecord
                                                          ?.answer
                                                          .elementAtOrNull(1),
                                                      'כללי',
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 40.663,
                                                        color:
                                                            Color(0x0E000000),
                                                        offset: Offset(
                                                          0.0,
                                                          1.694,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    11.0,
                                                                    11.0,
                                                                    11.0,
                                                                    25.2),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Icon.svg',
                                                            width: 48.0,
                                                            height: 48.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.5,
                                                                    0.0,
                                                                    15.5,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUserAnswersRecord
                                                                ?.answer
                                                                .elementAtOrNull(
                                                                    1),
                                                            'כללי',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF3C3D41),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        14.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight:
                                                                    1.42,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    13.24,
                                                                    0.0,
                                                                    13.24,
                                                                    0.0),
                                                        child: Text(
                                                          'השלמת ${valueOrDefault<String>(
                                                            containerLevelsRecord
                                                                ?.precent
                                                                .toString(),
                                                            '0',
                                                          )}%  מהמשימה  ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF8A8B91),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        12.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.3,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      11.3,
                                                                      21.0,
                                                                      11.3,
                                                                      11.5),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (containerLevelsRecord
                                                                          ?.precent ??
                                                                      0) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFE2E4EF),
                                                            barRadius:
                                                                const Radius.circular(
                                                                    56.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<LevelsRecord>>(
                                            stream: queryLevelsRecord(
                                              queryBuilder: (levelsRecord) =>
                                                  levelsRecord
                                                      .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserUid,
                                                      )
                                                      .where(
                                                        'subject',
                                                        isEqualTo: 'יומיום',
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<LevelsRecord>
                                                  containerLevelsRecordList =
                                                  snapshot.data!;
                                              final containerLevelsRecord =
                                                  containerLevelsRecordList
                                                          .isNotEmpty
                                                      ? containerLevelsRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 40.663,
                                                      color: Color(0x0E000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.694,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: InkWell(
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
                                                        'HOMEPAGE_PAGE_Column_yuhvjqcj_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Column_action_block');
                                                    await _model.startPronouns(
                                                      context,
                                                      subject: 'יוםיום',
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    11.0,
                                                                    11.0,
                                                                    11.0,
                                                                    25.2),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Icon-1.svg',
                                                            width: 48.0,
                                                            height: 48.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.5,
                                                                    0.0,
                                                                    15.5,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rptsh3z4' /* יומיום */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF3C3D41),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        14.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight:
                                                                    1.42,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    13.24,
                                                                    0.0,
                                                                    13.24,
                                                                    0.0),
                                                        child: Text(
                                                          'השלמת ${valueOrDefault<String>(
                                                            containerLevelsRecord
                                                                ?.precent
                                                                .toString(),
                                                            '0',
                                                          )}%  מהמשימה  ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF8A8B91),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        12.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.3,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      11.3,
                                                                      21.0,
                                                                      11.3,
                                                                      11.5),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (containerLevelsRecord
                                                                          ?.precent ??
                                                                      0) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFE2E4EF),
                                                            barRadius:
                                                                const Radius.circular(
                                                                    56.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<LevelsRecord>>(
                                            stream: queryLevelsRecord(
                                              queryBuilder: (levelsRecord) =>
                                                  levelsRecord
                                                      .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserUid,
                                                      )
                                                      .where(
                                                        'subject',
                                                        isEqualTo:
                                                            valueOrDefault<
                                                                String>(
                                                          containerUserAnswersRecord
                                                              ?.answer
                                                              .elementAtOrNull(
                                                                  2),
                                                          'כללי',
                                                        ),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<LevelsRecord>
                                                  containerLevelsRecordList =
                                                  snapshot.data!;
                                              final containerLevelsRecord =
                                                  containerLevelsRecordList
                                                          .isNotEmpty
                                                      ? containerLevelsRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 40.663,
                                                      color: Color(0x0E000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.694,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: InkWell(
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
                                                        'HOMEPAGE_PAGE_Column_znyt49ye_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Column_action_block');
                                                    await _model.startPronouns(
                                                      context,
                                                      subject: valueOrDefault<
                                                          String>(
                                                        containerUserAnswersRecord
                                                            ?.answer
                                                            .elementAtOrNull(
                                                                2),
                                                        'כללי',
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    11.0,
                                                                    11.0,
                                                                    11.0,
                                                                    25.2),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/books.svg',
                                                            width: 48.0,
                                                            height: 48.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.5,
                                                                    0.0,
                                                                    15.5,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUserAnswersRecord
                                                                ?.answer
                                                                .elementAtOrNull(
                                                                    2),
                                                            'כללי',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF3C3D41),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        14.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight:
                                                                    1.42,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    13.24,
                                                                    0.0,
                                                                    13.24,
                                                                    0.0),
                                                        child: Text(
                                                          'השלמת ${valueOrDefault<String>(
                                                            containerLevelsRecord
                                                                ?.precent
                                                                .toString(),
                                                            '0',
                                                          )}%  מהמשימה  ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: const Color(
                                                                    0xFF8A8B91),
                                                                fontSize: functions
                                                                    .setFontSize(
                                                                        12.0),
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.3,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      11.3,
                                                                      21.0,
                                                                      11.3,
                                                                      11.5),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (containerLevelsRecord
                                                                          ?.precent ??
                                                                      0) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFE2E4EF),
                                                            barRadius:
                                                                const Radius.circular(
                                                                    56.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'HOMEPAGE_PAGE___BTN_ON_TAP');
                                      if (isiOS) {
                                        logFirebaseEvent('Button_launch_u_r_l');
                                        await launchURL(
                                            'https://apps.apple.com/il/app/dialogi/id6630381631');
                                      } else {
                                        logFirebaseEvent('Button_launch_u_r_l');
                                        await launchURL(
                                            'https://play.google.com/store/apps/details?id=dialogi.app');
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'u06mye1i' /* דרגו אותנו! */,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 48.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(56.0),
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
                ),
              ],
            ),
            if (!valueOrDefault<bool>(currentUserDocument?.walkthrow, false))
              AuthUserStreamWidget(
                builder: (context) => Lottie.asset(
                  'assets/jsons/Animation_-_1730377289409.json',
                  width: MediaQuery.sizeOf(context).width * 1.1,
                  height: MediaQuery.sizeOf(context).height * 1.1,
                  fit: BoxFit.cover,
                  repeat: false,
                  animate: true,
                ),
              ),
          ],
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.homePageController = null);
          logFirebaseEvent('HOMEhomepage_ON_WALKTHROUGH_COMPLETED');
          logFirebaseEvent('homepage_navigate_to');

          context.pushNamed(
            'start_dialog',
            queryParameters: {
              'walkthrow': serializeParam(
                true,
                ParamType.bool,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 700),
              ),
            },
          );
        },
        onSkip: () {
          return true;
        },
      );
}
