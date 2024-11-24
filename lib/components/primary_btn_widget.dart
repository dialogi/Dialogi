import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'primary_btn_model.dart';
export 'primary_btn_model.dart';

class PrimaryBtnWidget extends StatefulWidget {
  const PrimaryBtnWidget({
    super.key,
    this.text,
    this.phone,
  });

  final String? text;
  final bool? phone;

  @override
  State<PrimaryBtnWidget> createState() => _PrimaryBtnWidgetState();
}

class _PrimaryBtnWidgetState extends State<PrimaryBtnWidget> {
  late PrimaryBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryBtnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: FFLocalizations.of(context).getText(
            'pfdg4jox' /*  */,
          ),
          options: FFButtonOptions(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 48.0,
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
            iconAlignment: IconAlignment.start,
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
            elevation: 0.0,
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(56.0),
          ),
          showLoadingIndicator: false,
        ),
        Container(
          decoration: const BoxDecoration(),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.phone ?? true)
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/phone_call.svg',
                          width: 28.0,
                          height: 28.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  Flexible(
                    child: Text(
                      valueOrDefault<String>(
                        widget.text,
                        'text',
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Rubik',
                            color: FlutterFlowTheme.of(context).info,
                            fontSize: functions.setFontSize(16.0),
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
