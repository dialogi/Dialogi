import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'lesson_card_model.dart';
export 'lesson_card_model.dart';

class LessonCardWidget extends StatefulWidget {
  const LessonCardWidget({
    super.key,
    this.teacherName,
    this.lessonNum,
  });

  final String? teacherName;
  final String? lessonNum;

  @override
  State<LessonCardWidget> createState() => _LessonCardWidgetState();
}

class _LessonCardWidgetState extends State<LessonCardWidget> {
  late LessonCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFE8ECEF),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(14.0, 11.0, 14.0, 11.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'שיעור מס׳ ${widget.lessonNum}',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          color: const Color(0xFF232C2E),
                          fontSize: functions.setFontSize(16.0),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.42,
                        ),
                  ),
                  Text(
                    'מורה: ${widget.teacherName}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: functions.setFontSize(14.0),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          lineHeight: 1.3,
                        ),
                  ),
                ].divide(const SizedBox(height: 4.0)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.teacherName == 'נועה כהן')
                  Flexible(
                    child: Container(
                      width: 56.0,
                      height: 56.0,
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
                if (widget.teacherName == 'יואב כהן')
                  Flexible(
                    child: Container(
                      width: 56.0,
                      height: 56.0,
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
                if (widget.teacherName == 'תמר סלע')
                  Flexible(
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFACB8EC),
                        borderRadius: BorderRadius.circular(9999.0),
                        shape: BoxShape.rectangle,
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
                if (widget.teacherName == 'עומר זלמן')
                  Flexible(
                    child: Container(
                      width: 56.0,
                      height: 56.0,
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
                          'assets/images/cropped_image_1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
              ].divide(const SizedBox(height: 0.0)),
            ),
          ],
        ),
      ),
    );
  }
}
