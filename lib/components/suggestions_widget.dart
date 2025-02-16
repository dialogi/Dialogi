import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'suggestions_model.dart';
export 'suggestions_model.dart';

class SuggestionsWidget extends StatefulWidget {
  const SuggestionsWidget({
    super.key,
    String? text,
  }) : this.text = text ?? 'היי';

  final String text;

  @override
  State<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends State<SuggestionsWidget> {
  late SuggestionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuggestionsModel());
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFF8590C8),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          widget.text,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Rubik',
                color: Color(0xFF8590C8),
                fontSize: functions.setFontSize(14.0),
                letterSpacing: 0.0,
                lineHeight: 1.42,
              ),
        ),
      ),
    );
  }
}
