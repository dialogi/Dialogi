import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'teacher_select_model.dart';
export 'teacher_select_model.dart';

class TeacherSelectWidget extends StatefulWidget {
  const TeacherSelectWidget({
    super.key,
    bool? selected,
    this.name,
    double? imgWidth,
    required this.teacherImg,
  })  : this.selected = selected ?? false,
        this.imgWidth = imgWidth ?? 48.0;

  final bool selected;
  final String? name;
  final double imgWidth;
  final String? teacherImg;

  @override
  State<TeacherSelectWidget> createState() => _TeacherSelectWidgetState();
}

class _TeacherSelectWidgetState extends State<TeacherSelectWidget> {
  late TeacherSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeacherSelectModel());
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
        if ((widget.teacherImg == 'נועה') ||
            (widget.teacherImg == 'נועה כהן'))
          Flexible(
            child: Container(
              width: widget.imgWidth,
              height: widget.imgWidth,
              decoration: BoxDecoration(
                color: Color(0xFFACB8EC),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).primary
                      : Colors.white,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9999.0),
                child: Image.asset(
                  'assets/images/cropped_image_3.png',
                  width: widget.imgWidth,
                  height: widget.imgWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        if ((widget.teacherImg == 'יואב') ||
            (widget.teacherImg == 'יואב כהן'))
          Flexible(
            child: Container(
              width: widget.imgWidth,
              height: widget.imgWidth,
              decoration: BoxDecoration(
                color: Color(0xFFACB8EC),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).primary
                      : Colors.white,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9999.0),
                child: Image.asset(
                  'assets/images/cropped_image_4.png',
                  width: widget.imgWidth,
                  height: widget.imgWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        if ((widget.teacherImg == 'תמר') || (widget.teacherImg == 'תמר סלע'))
          Flexible(
            child: Container(
              width: widget.imgWidth,
              height: widget.imgWidth,
              decoration: BoxDecoration(
                color: Color(0xFFACB8EC),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).primary
                      : Colors.white,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9999.0),
                child: Image.asset(
                  'assets/images/cropped_image_2.png',
                  width: widget.imgWidth,
                  height: widget.imgWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        if ((widget.teacherImg == 'עומר') ||
            (widget.teacherImg == 'עומר זלמן'))
          Flexible(
            child: Container(
              width: widget.imgWidth,
              height: widget.imgWidth,
              decoration: BoxDecoration(
                color: Color(0xFFACB8EC),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).primary
                      : Colors.white,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9999.0),
                child: Image.asset(
                  'assets/images/cropped_image_1.png',
                  width: widget.imgWidth,
                  height: widget.imgWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        if ((widget.name != null && widget.name != '') && !widget.selected)
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                widget.name!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      color: widget.selected
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF232C2E),
                      fontSize: functions.setFontSize(16.0),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      lineHeight: 1.5,
                    ),
              ),
            ),
          ),
        if ((widget.name != null && widget.name != '') && widget.selected)
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                widget.name!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      color: widget.selected
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF232C2E),
                      fontSize: functions.setFontSize(16.0),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      lineHeight: 1.5,
                    ),
              ),
            ),
          ),
      ].divide(SizedBox(height: 0.0)),
    );
  }
}
