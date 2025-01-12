import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'select_model.dart';
export 'select_model.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({
    super.key,
    bool? checked,
    this.text,
  }) : checked = checked ?? false;

  final bool checked;
  final String? text;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  late SelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SELECT_COMP_select_ON_INIT_STATE');
      logFirebaseEvent('select_update_app_state');

      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.checked
                  ? FlutterFlowTheme.of(context).primary
                  : const Color(0xFF95A5A6),
              const Color(0xFF95A5A6),
            ),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Rubik',
                              color: valueOrDefault<Color>(
                                widget.checked
                                    ? FlutterFlowTheme.of(context).primary
                                    : const Color(0xFF232C2E),
                                const Color(0xFF232C2E),
                              ),
                              fontSize: functions.setFontSize(16.0),
                              letterSpacing: 0.0,
                              lineHeight: 1.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              if (valueOrDefault<bool>(
                widget.checked,
                true,
              ))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    FFIcons.kselectCheck,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
