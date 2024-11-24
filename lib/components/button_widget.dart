import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    this.width,
    this.color,
    this.borderColor,
    this.disabled,
    this.icon,
  });

  final double? width;
  final Color? color;
  final Color? borderColor;
  final bool? disabled;
  final Widget? icon;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: widget.disabled!
          ? null
          : () {
              print('Button pressed ...');
            },
      text: FFLocalizations.of(context).getText(
        'jak0b330' /* Get Started */,
      ),
      icon: widget.icon,
      options: FFButtonOptions(
        width: widget.width,
        height: 48.0,
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget.color,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Rubik',
              color: FlutterFlowTheme.of(context).info,
              fontSize: functions.setFontSize(16.0),
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: valueOrDefault<Color>(
            widget.borderColor,
            FlutterFlowTheme.of(context).primary,
          ),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(56.0),
      ),
    );
  }
}
