import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'loader_popup_model.dart';
export 'loader_popup_model.dart';

class LoaderPopupWidget extends StatefulWidget {
  const LoaderPopupWidget({
    super.key,
    String? title,
    this.description,
    this.loader,
  }) : title = title ?? 'העדכון בדרך ☺️';

  final String title;
  final String? description;
  final bool? loader;

  @override
  State<LoaderPopupWidget> createState() => _LoaderPopupWidgetState();
}

class _LoaderPopupWidgetState extends State<LoaderPopupWidget>
    with TickerProviderStateMixin {
  late LoaderPopupModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoaderPopupModel());

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
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.8,
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                        Flexible(
                          child: Text(
                            widget.title,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: functions.setFontSize(18.0),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                    if (widget.loader ?? true)
                      Lottie.asset(
                        'assets/jsons/Animation_-_1730989492970.json',
                        width: 162.0,
                        height: 126.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    if (widget.description != null &&
                        widget.description != '')
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            widget.description,
                            'כמעט שדרגת את רמת האנגלית שלך!  הכרטיס שלך עדיין מתלבט אם להגיד \"Yes\"!  אנחנו בודקים אם הכרטיס שלך מוכן לדבר בשפה שלנו…  זה ייקח רק כמה רגעים.  ',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: functions.setFontSize(16.0),
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!);
  }
}
