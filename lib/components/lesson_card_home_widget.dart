import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'lesson_card_home_model.dart';
export 'lesson_card_home_model.dart';

class LessonCardHomeWidget extends StatefulWidget {
  const LessonCardHomeWidget({
    super.key,
    this.lessonNum,
    this.lessonId,
    required this.teacherName,
  });

  final String? lessonNum;
  final String? lessonId;
  final String? teacherName;

  @override
  State<LessonCardHomeWidget> createState() => _LessonCardHomeWidgetState();
}

class _LessonCardHomeWidgetState extends State<LessonCardHomeWidget> {
  late LessonCardHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonCardHomeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 327.0,
            height: 92.0,
            child: Stack(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'LESSON_CARD_HOME_Container_616efm3g_ON_T');
                    logFirebaseEvent('Container_navigate_to');

                    context.pushNamed(
                      DialogSummaryWidget.routeName,
                      queryParameters: {
                        'lastLesson': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                        'lessonId': serializeParam(
                          widget.lessonId,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 700),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 327.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF788EFD),
                          FlutterFlowTheme.of(context).primary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.31, -1.0),
                        end: AlignmentDirectional(-0.31, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 9.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if ((widget.teacherName == 'נועה') ||
                                  (widget.teacherName == 'נועה כהן'))
                                Flexible(
                                  child: Container(
                                    width: 68.0,
                                    height: 68.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                      child: Image.asset(
                                        'assets/images/cropped_image_3.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((widget.teacherName == 'יואב') ||
                                  (widget.teacherName == 'יואב כהן'))
                                Flexible(
                                  child: Container(
                                    width: 68.0,
                                    height: 68.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                      child: Image.asset(
                                        'assets/images/cropped_image_4.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((widget.teacherName == 'תמר') ||
                                  (widget.teacherName == 'תמר סלע'))
                                Flexible(
                                  child: Container(
                                    width: 68.0,
                                    height: 68.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                      child: Image.asset(
                                        'assets/images/cropped_image_2.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((widget.teacherName == 'עומר') ||
                                  (widget.teacherName == 'עומר זלמן'))
                                Flexible(
                                  child: Container(
                                    width: 68.0,
                                    height: 68.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(999.0),
                                      child: Image.asset(
                                        'assets/images/cropped_image_4.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(height: 0.0)),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    'שיעור מס׳ ${widget.lessonNum}',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                                  'מורה: ${widget.teacherName}',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                        ].divide(SizedBox(width: 10.0)),
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
  }
}
