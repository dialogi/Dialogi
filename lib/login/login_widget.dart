import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_img_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'login'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PAGE_login_ON_INIT_STATE');
      logFirebaseEvent('login_action_block');
      await action_blocks.setLang(context);
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/jsons/main_logo.json',
                          width: 200.0,
                          height: 225.0,
                          fit: BoxFit.contain,
                          repeat: false,
                          animate: true,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 52.0, 0.0, 28.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'l91ypzi9' /* למידת אנגלית מדוברת
 מעולם לא ... */
                              ,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: const Color(0xFF232C2E),
                                  fontSize: functions.setFontSize(24.0),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.16,
                                ),
                          ),
                        ),
                      ),
                      if (isiOS)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LOGIN_PAGE_Container_amz67x26_ON_TAP');
                              logFirebaseEvent('buttonImg_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final user =
                                  await authManager.signInWithApple(context);
                              if (user == null) {
                                return;
                              }
                              logFirebaseEvent('buttonImg_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                displayName: functions
                                    .grabFirstName(currentUserDisplayName),
                              ));
                              logFirebaseEvent('buttonImg_update_app_state');
                              FFAppState().userSub = SubscriptionDetailsStruct
                                  .fromSerializableMap(jsonDecode(
                                      '{\"subId\":\"0\",\"name\":\"0\",\"frequencyPerWeek\":\"0\",\"lessonLimit\":\"0\"}'));
                              safeSetState(() {});
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.onboarded, false)) {
                                logFirebaseEvent('buttonImg_navigate_to');

                                context.pushNamedAuth(
                                    'homepage', context.mounted);
                              } else {
                                logFirebaseEvent('buttonImg_navigate_to');

                                context.pushNamedAuth(
                                    'start_onboarding', context.mounted);
                              }
                            },
                            child: wrapWithModel(
                              model: _model.buttonImgModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: const ButtonImgWidget(
                                text: 'התחברות עם Apple',
                                imgPath:
                                    'https://yt3.googleusercontent.com/05lhMeAH6tZrPIUsp2yHNz3DwzhKbDUQcxcY0_qeXVyZttR_pktBzw0FcLUSR6D4fVqsEgL3ZO0=s900-c-k-c0x00ffffff-no-rj',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontColor: Colors.white,
                                imgWidth: 40.0,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'LOGIN_PAGE_Container_k6lxz2cr_ON_TAP');
                            logFirebaseEvent('buttonImg_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            final user =
                                await authManager.signInWithGoogle(context);
                            if (user == null) {
                              return;
                            }
                            logFirebaseEvent('buttonImg_update_app_state');
                            FFAppState().userSub = SubscriptionDetailsStruct
                                .fromSerializableMap(jsonDecode(
                                    '{\"subId\":\"0\",\"name\":\"0\",\"frequencyPerWeek\":\"0\",\"lessonLimit\":\"0\"}'));
                            safeSetState(() {});
                            if (valueOrDefault<bool>(
                                currentUserDocument?.onboarded, false)) {
                              logFirebaseEvent('buttonImg_navigate_to');

                              context.pushNamedAuth(
                                  'homepage', context.mounted);
                            } else {
                              logFirebaseEvent('buttonImg_navigate_to');

                              context.pushNamedAuth(
                                  'start_onboarding', context.mounted);
                            }
                          },
                          child: wrapWithModel(
                            model: _model.buttonImgModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: const ButtonImgWidget(
                              text: 'התחברות עם Google',
                              imgPath:
                                  'https://yt3.googleusercontent.com/viNp17XpEF-AwWwOZSj_TvgobO1CGmUUgcTtQoAG40YaYctYMoUqaRup0rTxxxfQvWw3MvhXesw=s900-c-k-c0x00ffffff-no-rj',
                              color: Colors.white,
                              fontSize: 16.0,
                              fontColor: Colors.black,
                              imgWidth: 30.0,
                              imgAsset: false,
                              borderColor: Color(0xFFD5DBDB),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
