import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'popup_model.dart';
export 'popup_model.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget({
    super.key,
    this.title,
    this.subTitle,
    this.footer,
    this.button,
    this.onClick,
    this.instructions,
    bool? close,
  }) : close = close ?? true;

  final String? title;
  final String? subTitle;
  final String? footer;
  final String? button;
  final Future Function()? onClick;
  final List<String>? instructions;
  final bool close;

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget>
    with TickerProviderStateMixin {
  late PopupModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
    });
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
        SafeArea(
          child: Container(
            decoration: const BoxDecoration(),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Container(
              width: widget.close ? 350.0 : 250.0,
              constraints: const BoxConstraints(
                maxWidth: 570.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: const Color(0xFFF5FBFB),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        if (widget.close)
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'POPUP_COMP_Icon_nqoxwgah_ON_TAP');
                                  logFirebaseEvent('Icon_dismiss_dialog');
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  FFIcons.kcarbonCloseOutline,
                                  color: Color(0xFF95A5A6),
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ),
                        if (widget.close)
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 17.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: 79.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (widget.title != null && widget.title != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            28.0, 0.0, 28.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.title,
                            'title',
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    color: Colors.black,
                                    fontSize: functions.setFontSize(20.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.3,
                                  ),
                        ),
                      ),
                    if (widget.subTitle != null && widget.subTitle != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            52.0, 16.0, 52.0, 16.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.subTitle,
                            'subTitle',
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF323241),
                                    fontSize: functions.setFontSize(16.0),
                                    letterSpacing: 0.0,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                    if ((widget.instructions != null &&
                            (widget.instructions)!.isNotEmpty) ==
                        true)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            14.0, 12.0, 14.0, 14.0),
                        child: Builder(
                          builder: (context) {
                            final stringList =
                                widget.instructions?.toList() ?? [];

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(stringList.length,
                                  (stringListIndex) {
                                final stringListItem =
                                    stringList[stringListIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 28.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        stringListItem,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize:
                                                  functions.setFontSize(15.0),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation']!,
                                  effects: [
                                    FadeEffect(
                                      curve: Curves.easeInOut,
                                      delay: (stringListIndex * 350).ms,
                                      duration: 760.0.ms,
                                      begin: 0.0,
                                      end: 1.0,
                                    ),
                                  ],
                                );
                              }).divide(const SizedBox(height: 12.0)),
                            );
                          },
                        ),
                      ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Color(0x67000000),
                    ),
                    if (widget.footer != null && widget.footer != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            52.0, 16.0, 52.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.footer,
                            'footer',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF95A5A6),
                                    fontSize: functions.setFontSize(14.0),
                                    letterSpacing: 0.0,
                                    lineHeight: 1.4,
                                  ),
                        ),
                      ),
                    if (widget.button != null && widget.button != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('POPUP_COMP_BUTTON_BTN_ON_TAP');
                            logFirebaseEvent('Button_execute_callback');
                            await widget.onClick?.call();
                            if (widget.close) {
                              logFirebaseEvent(
                                  'Button_close_dialog_drawer_etc');
                              Navigator.pop(context);
                            }
                          },
                          text: widget.button!,
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Rubik',
                                  color: Colors.white,
                                  fontSize: functions.setFontSize(16.0),
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius:
                                BorderRadius.circular(valueOrDefault<double>(
                              widget.close ? 56.0 : 90.0,
                              0.0,
                            )),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!);
  }
}
