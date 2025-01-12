import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dialog_manager_model.dart';
export 'dialog_manager_model.dart';

class DialogManagerWidget extends StatefulWidget {
  const DialogManagerWidget({
    super.key,
    this.repeatAction,
    this.stopAction,
    this.repeatActive,
    required this.onPause,
    required this.progressVal,
    required this.onHold,
    required this.onResume,
  });

  final Future Function()? repeatAction;
  final Future Function()? stopAction;
  final bool? repeatActive;
  final Future Function()? onPause;
  final double? progressVal;
  final bool? onHold;
  final Future Function()? onResume;

  @override
  State<DialogManagerWidget> createState() => _DialogManagerWidgetState();
}

class _DialogManagerWidgetState extends State<DialogManagerWidget> {
  late DialogManagerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogManagerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: FFButtonWidget(
                  onPressed: ((FFAppState().dialogState ==
                              DialogState.AI_talking) ||
                          !FFAppState().onLesson)
                      ? null
                      : () async {
                          logFirebaseEvent('DIALOG_MANAGER_COMP___BTN_ON_TAP');
                          logFirebaseEvent('Button_execute_callback');
                          await widget.stopAction?.call();
                        },
                  text: FFLocalizations.of(context).getText(
                    '44gdvqrs' /* סיים שיחה */,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 57.7,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 70.0, 0.0),
                    iconPadding: const EdgeInsets.all(0.0),
                    color: const Color(0xFFE4445A),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                          fontSize: functions.setFontSize(14.0),
                          letterSpacing: 0.0,
                          lineHeight: 1.42,
                        ),
                    elevation: 0.0,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(28.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(28.0),
                    ),
                    disabledColor: const Color(0xA8E36274),
                    disabledTextColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  showLoadingIndicator: false,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: FFButtonWidget(
                  onPressed: (FFAppState().dialogState !=
                          DialogState.processing)
                      ? null
                      : () async {
                          logFirebaseEvent('DIALOG_MANAGER_COMP___BTN_ON_TAP');
                          logFirebaseEvent('Button_execute_callback');
                          await widget.repeatAction?.call();
                        },
                  text: FFLocalizations.of(context).getText(
                    'e1i26492' /* חזור שנית */,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 57.7,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 0.0, 0.0),
                    iconPadding: const EdgeInsets.all(0.0),
                    color: const Color(0xFFE7EAF8),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: functions.setFontSize(14.0),
                          letterSpacing: 0.0,
                          lineHeight: 1.42,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: valueOrDefault<Color>(
                        FFAppState().dialogState != DialogState.processing
                            ? FlutterFlowTheme.of(context).secondaryText
                            : FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      width: 0.8,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(28.0),
                      topRight: Radius.circular(0.0),
                    ),
                    disabledColor: const Color(0x1C2C3E50),
                    disabledTextColor: const Color(0xFF95A5A6),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 108.5,
                  height: 108.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(9999.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'DIALOG_MANAGER_Stack_st7th8nu_ON_TAP');
                        if (FFAppState().dialogState ==
                            DialogState.processing) {
                          if (widget.onHold!) {
                            logFirebaseEvent('Stack_execute_callback');
                            unawaited(
                              () async {
                                await widget.onResume?.call();
                              }(),
                            );
                            logFirebaseEvent('Stack_update_component_state');
                            _model.color = 'blue';
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent('Stack_update_component_state');
                            _model.color = 'orange';
                            safeSetState(() {});
                            logFirebaseEvent('Stack_execute_callback');
                            unawaited(
                              () async {
                                await widget.onPause?.call();
                              }(),
                            );
                            while (_model.color == 'orange') {
                              if ((widget.progressVal! < 0.4) &&
                                  (_model.color == 'orange')) {
                                logFirebaseEvent(
                                    'Stack_update_component_state');
                                _model.color = 'red';
                                safeSetState(() {});
                              }
                              logFirebaseEvent('Stack_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 700));
                            }
                          }
                        }
                      },
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          if (widget.onHold ?? true)
                            Container(
                              width: 60.5,
                              height: 60.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/play_(1).svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                          if ((FFAppState().dialogState ==
                                  DialogState.processing) &&
                              !widget.onHold!)
                            Container(
                              width: 61.0,
                              height: 61.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        't6uxo2fs' /* Button */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0x00546DEF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: const Color(0x00FFFFFF),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: SvgPicture.asset(
                                        'assets/images/pause.svg',
                                        width: 28.0,
                                        height: 28.0,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((FFAppState().dialogState ==
                                  DialogState.AI_talking) ||
                              (FFAppState().dialogState ==
                                  DialogState.user_talking))
                            Container(
                              width: 61.0,
                              height: 61.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/threeLines.svg',
                                  width: 32.0,
                                  fit: BoxFit.contain,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(-0.01, 0.02),
                            child: CircularPercentIndicator(
                              percent: widget.progressVal!,
                              radius: 42.25,
                              lineWidth: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: valueOrDefault<Color>(
                                (widget.onHold == true) &&
                                        (widget.progressVal! < 0.3)
                                    ? const Color(0xFFC22D36)
                                    : const Color(0xFF314CD8),
                                FlutterFlowTheme.of(context).primary,
                              ),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
