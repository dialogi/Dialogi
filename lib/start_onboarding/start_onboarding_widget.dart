import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'start_onboarding_model.dart';
export 'start_onboarding_model.dart';

class StartOnboardingWidget extends StatefulWidget {
  /// zLXtvKRSqffQxWUV1eqheoNXh8K2
  const StartOnboardingWidget({super.key});

  @override
  State<StartOnboardingWidget> createState() => _StartOnboardingWidgetState();
}

class _StartOnboardingWidgetState extends State<StartOnboardingWidget> {
  late StartOnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartOnboardingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'start_onboarding'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('START_ONBOARDING_start_onboarding_ON_INI');
      logFirebaseEvent('start_onboarding_action_block');
      await action_blocks.setLang(context);
      safeSetState(() {});
      if (valueOrDefault<bool>(currentUserDocument?.onboarded, false) ==
          true) {
        logFirebaseEvent('start_onboarding_navigate_to');

        context.goNamedAuth('homepage', context.mounted);
      }
        });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserAnswersRecord>>(
      stream: queryUserAnswersRecord(
        queryBuilder: (userAnswersRecord) => userAnswersRecord.where(
          'user',
          isEqualTo: currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UserAnswersRecord> startOnboardingUserAnswersRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/personBackground.png',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Lottie.asset(
                                  'assets/jsons/man_thinking.json',
                                  width: 280.0,
                                  height: 454.0,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            48.0, 20.0, 48.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'u0ru7a5r' /* Dialogi - 
כי אנגלית לא לומדים... */
                            ,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    fontSize: functions.setFontSize(24.0),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            60.0, 10.0, 60.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            's2zj0z44' /* שאלון קצר שיעזור לנו להכיר אות... */,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF95A5A6),
                                    fontSize: functions.setFontSize(16.0),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'START_ONBOARDING_PAGE___BTN_ON_TAP');
                            if (startOnboardingUserAnswersRecordList
                                .isNotEmpty) {
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().questionNum =
                                  startOnboardingUserAnswersRecordList.length -
                                      1;
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().questionNum = 0;
                              safeSetState(() {});
                            }

                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'question',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 150),
                                ),
                              },
                            );
                          },
                          text: startOnboardingUserAnswersRecordList.isNotEmpty
                              ? 'המשך שאלון'
                              : 'התחלת שאלון',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
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
                            borderRadius: BorderRadius.circular(56.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
