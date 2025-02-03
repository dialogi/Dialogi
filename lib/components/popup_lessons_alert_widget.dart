import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'popup_lessons_alert_model.dart';
export 'popup_lessons_alert_model.dart';

class PopupLessonsAlertWidget extends StatefulWidget {
  const PopupLessonsAlertWidget({
    super.key,
    this.title,
    this.subTitle,
    this.button,
    this.onClick,
  });

  final String? title;
  final String? subTitle;
  final String? button;
  final Future Function()? onClick;

  @override
  State<PopupLessonsAlertWidget> createState() =>
      _PopupLessonsAlertWidgetState();
}

class _PopupLessonsAlertWidgetState extends State<PopupLessonsAlertWidget>
    with TickerProviderStateMixin {
  late PopupLessonsAlertModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupLessonsAlertModel());

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
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
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
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 0.0),
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          30.0, 24.0, 30.0, 24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'POPUP_LESSONS_ALERT_Row_5sgviv0s_ON_TAP');
                          logFirebaseEvent('Row_date_time_picker');
                          await showModalBottomSheet<bool>(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    minimumDate: DateTime(1900),
                                    initialDateTime: (currentUserDocument
                                            ?.notificationsTime ??
                                        DateTime.now()),
                                    maximumDate: DateTime(2050),
                                    use24hFormat: false,
                                    onDateTimeChanged: (newDateTime) =>
                                        safeSetState(() {
                                      _model.datePicked = newDateTime;
                                    }),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'fo3rp6wi' /* תזכורות לשיעורים */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: const Color(0xFF5F5F60),
                                            fontSize:
                                                functions.setFontSize(18.0),
                                            letterSpacing: 0.0,
                                            lineHeight: 1.77,
                                          ),
                                    ),
                                    Container(
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(444.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Text(
                                          _model.datePicked != null
                                              ? dateTimeFormat(
                                                  "Hm",
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )
                                              : dateTimeFormat(
                                                  "Hm",
                                                  dateTimeFromSecondsSinceEpoch(
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch),
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize:
                                                    functions.setFontSize(16.0),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 24.0)),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Color(0x67000000),
                    ),
                    if (widget.button != null && widget.button != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'POPUP_LESSONS_ALERT_BUTTON_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              notificationsTime: _model.datePicked ?? getCurrentTimestamp,
                            ));
                            logFirebaseEvent('Button_execute_callback');
                            await widget.onClick?.call();
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              onboarded: true,
                            ));
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              photoUrl: currentUserPhoto != ''
                                  ? currentUserPhoto
                                  : 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                              notification: true,
                              walkthrow: false,
                              lessonsAlert: true,
                            ));
                            logFirebaseEvent('Button_backend_call');

                            await LevelsRecord.collection
                                .doc()
                                .set(createLevelsRecordData(
                                  user: currentUserUid,
                                  subject: 'כללי',
                                  precent: 0,
                                ));
                            logFirebaseEvent('Button_custom_action');
                            await actions.presentPaywall();
                            logFirebaseEvent('Button_close_dialog_drawer_etc');
                            Navigator.pop(context);
                            logFirebaseEvent('Button_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed('homepage');
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
      ],
    ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!);
  }
}
