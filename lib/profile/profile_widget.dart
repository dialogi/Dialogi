import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/lesson_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profile'});
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'xdz9zcbe' /* פרופיל תלמיד */,
                              ),
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
                      ],
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Color(0x64FFFFFF),
                    ),
                  ],
                ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
              titlePadding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            ),
            elevation: 0.0,
          ),
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 74.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      0.0,
                                    ),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 110.0,
                                    height: 110.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration: const Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 0),
                                      imageUrl: currentUserPhoto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: StreamBuilder<List<LevelsRecord>>(
                  stream: queryLevelsRecord(
                    queryBuilder: (levelsRecord) => levelsRecord
                        .where(
                          'user',
                          isEqualTo: currentUserUid,
                        )
                        .where(
                          'subject',
                          isEqualTo: 'כללי',
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
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<LevelsRecord> columnLevelsRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnLevelsRecord = columnLevelsRecordList.isNotEmpty
                        ? columnLevelsRecordList.first
                        : null;

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 24.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: const Color(0xFF232C2E),
                                      fontSize: functions.setFontSize(24.0),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.16,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '46zei3il' /* הגשמת מטרות אישיות */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF3C3D41),
                                    fontSize: functions.setFontSize(20.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ),
                          Text(
                            ' השלמת ${columnLevelsRecord?.precent.toString()}% מהדרך',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: const Color(0xFF8A8B91),
                                  fontSize: functions.setFontSize(14.0),
                                  letterSpacing: 0.0,
                                  lineHeight: 1.4,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: Container(
                              width: 173.0,
                              constraints: const BoxConstraints(
                                maxWidth: 173.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: LinearPercentIndicator(
                                    percent: valueOrDefault<double>(
                                      columnLevelsRecord!.precent / 100,
                                      0.0,
                                    ),
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
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'yx3m9nde' /* שיחות אחרונות */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: const Color(0xFF747474),
                                  fontSize: functions.setFontSize(16.0),
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                  lineHeight: 1.5,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                StreamBuilder<List<LessonsRecord>>(
                                  stream: queryLessonsRecord(
                                    queryBuilder: (lessonsRecord) =>
                                        lessonsRecord
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<LessonsRecord>
                                        listViewLessonsRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      reverse: true,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewLessonsRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 12.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewLessonsRecord =
                                            listViewLessonsRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILE_PAGE_Container_1uzazzdj_ON_TAP');
                                            logFirebaseEvent(
                                                'lessonCard_navigate_to');

                                            context.goNamed(
                                              'dialog_summary',
                                              queryParameters: {
                                                'lastLesson': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                                'lessonId': serializeParam(
                                                  listViewLessonsRecord
                                                      .lessonId,
                                                  ParamType.String,
                                                ),
                                                'profile': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.scale,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  duration: Duration(
                                                      milliseconds: 800),
                                                ),
                                              },
                                            );
                                          },
                                          child: LessonCardWidget(
                                            key: Key(
                                                'Key1uz_${listViewIndex}_of_${listViewLessonsRecordList.length}'),
                                            teacherName: listViewLessonsRecord
                                                .teacher.name,
                                            lessonNum: valueOrDefault<String>(
                                              (listViewIndex + 1).toString(),
                                              '1',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
