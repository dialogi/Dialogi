import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'bubble_thinking_model.dart';
export 'bubble_thinking_model.dart';

class BubbleThinkingWidget extends StatefulWidget {
  const BubbleThinkingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.positionTriangle,
  });

  final String? title;
  final String? description;
  final String? positionTriangle;

  @override
  State<BubbleThinkingWidget> createState() => _BubbleThinkingWidgetState();
}

class _BubbleThinkingWidgetState extends State<BubbleThinkingWidget> {
  late BubbleThinkingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BubbleThinkingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(valueOrDefault<double>(
            widget.positionTriangle == 'buttomLeft' ? 0.0 : 30.0,
            0.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            widget.positionTriangle == 'buttomRight' ? 0.0 : 30.0,
            0.0,
          )),
          topLeft: Radius.circular(valueOrDefault<double>(
            widget.positionTriangle == 'topLeft' ? 0.0 : 30.0,
            0.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            widget.positionTriangle == 'topRight' ? 0.0 : 30.0,
            0.0,
          )),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.title,
                    'ג',
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Rubik',
                        fontSize: functions.setFontSize(18.0),
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Text(
              valueOrDefault<String>(
                widget.description,
                's',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: functions.setFontSize(16.0),
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
